<?php
/**
 * Description of ProxyManager
 *
 * @author progforce
 */
class system_proxyManager {

        protected $__browser;
        protected $__master_proxy = "209.172.34.132:3128";
        protected $__tor_address = "127.0.0.1:8118";

        public function __construct() {
        phpCrawler::load('lib/idiorm/idiorm.php');
        phpCrawler::load('lib/liorbk/GearmanTelnet.php');

        ORM::configure('mysql:host='.phpCrawler::conf()->host.';dbname='.phpCrawler::conf()->dbname);
        ORM::configure('username', phpCrawler::conf()->user);
        ORM::configure('password', phpCrawler::conf()->pass);

        $this->__browser = &new SimpleBrowser();
        $this->__browser->useCookies();
        $this->__browser->addHeader("Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5");
        $this->__browser->addHeader("User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6; rv:2.0) Gecko/20100101 Firefox/4.0");
        $this->__browser->addHeader("Cache-Control: max-age=0");
        $this->__browser->addHeader("Connection: keep-alive");
        $this->__browser->addHeader("Keep-Alive: 300");
        $this->__browser->addHeader("Accept-Charset: ISO-8859-1,utf-8;q=0.7,*;q=0.7");
        $this->__browser->addHeader("Accept-Language: en-us,en;q=0.5");
        $this->__browser->addHeader("Pragma: ");

	$this->__client = clientSendData::getInstance();
    }

    public function system_ProxyManager($job) {
        $job = unserialize($job->workload());
        $html = new simple_html_dom();
        $site_name = $job['site_name'];
        $root_address = $job['url'];
        $isDBError = false;
        
        phpCrawler::log()->logInfo("--------------------------------------------------------------------------------");
        
        #определяет от кого нужно получить IP адрес (Tor или База данных)
        $torOption = phpCrawler::conf()->tor;
        phpCrawler::log()->logInfo("   The Onion Router option is: " . $torOption);
        if ($torOption == "true") {
            phpCrawler::log()->logInfo(" + Selected \"The Onion Router\". Local address:" .$this->__tor_address); 
            return $this->Tor($root_address);
        }
        
        $minimal_proxy_count = 150;
        $available_proxy_count = 0;
        $testUrlNumber = 0;
	$badResponsCode_counter = 0;
        $hour = 3;
        $sleepTime = 60; # время на которое приостанавливается работа прокси менеджера
        #-----------------[часы    мин  сек]----установлена задержка общего ожидания интервалом в 3 часа
        $iterationCount = ($hour * 60 * 60) / $sleepTime;
        $needWork = true;
        
        try { 
            $proxy_list = ORM::for_table('Proxy_List')->where_not_equal('proxy_status', 2)->order_by_desc('proxy_status')->find_many();
            if(!$proxy_list)
                echo "ERROR DATABASE. MySQL write: 1. ", mysql_errno();
        }
        catch(Exception $e) { 
            phpCrawler::log()->logCrit($e->getMessage(),'db_error'); 
            $isDBError = true;
        }
            
        $available_proxy_count = count($proxy_list);
        phpCrawler::log()->logInfo("1. Loaded count of proxy: " . $available_proxy_count);
        
        if ($available_proxy_count < 1)
            phpCrawler::log()->logCrit("   DATABASE ERROR: PROXY LIST IS EMPTY!");
        
        #система ожидания загрузки новых прокси в БД в случа отсутствия рабочих ip адресов
        while ($needWork) {

            # останавливает работу прокси менеджера до тех пор пока в базу не запишутся новые прокси
            while ($available_proxy_count <1) {
                if (!$isDBError AND !$this->IsGearmanHasProxyJob()) {
                    $this->StartProxySearch();
                }
                
                $isDBError ? $messageText = " sec. DATABASE problem!" : $messageText = " sec. Now work proxy search!";
                $isDBError = false;

                phpCrawler::log()->logInfo("   proxyManager sleep " . $sleepTime . $messageText);
                $iterationCount--;
                sleep($sleepTime);

                try { 
                    $proxy_list = ORM::for_table('Proxy_List')->where_not_equal('proxy_status', 2)->order_by_desc('proxy_status')->find_many();
                    if(!$proxy_list)
                        echo "ERROR DATABASE. MySQL write: 2. ", mysql_errno();
                }
                catch(Exception $e) { 
                    phpCrawler::log()->logCrit($e->getMessage(),'db_error'); 
                    $isDBError = true;
                }

                $available_proxy_count = count($proxy_list);
                phpCrawler::log()->logInfo("   Loaded count of proxy after search: " . $available_proxy_count);
                
                if ($iterationCount <= 0) {
                    $needWork = false;
                    phpCrawler::log()->logCrit("   FATAL - system_ProxyManager stop work! DATABASE ProxyList is Epty over then " . $hour . " hour(s)");
                    exec("cd /root/test && ./stop.sh proxyManager");
                }

                if ($iterationCount == 170) {
                    $needWork = false;
                    phpCrawler::log()->logCrit("   system_ProxyManagerRestart START work!");
                    $this->__client->send("system_PrManagerRestart");
                    #exec("php /root/test/main.php -c /root/test/config/proxyManagerRestart_config.php -n system");

                }
            }

            foreach ($proxy_list as $proxy) {
                
                # обновление числа итераций
                $iterationCount = ($hour * 60 * 60) / $sleepTime;
                phpCrawler::log()->logInfo(".............: " . ($available_proxy_count));

                # проверка наличия прокси в БД и анализ работы прокси поисковика
                if (($available_proxy_count) < $minimal_proxy_count and !$this->IsGearmanHasProxyJob()) {
                    $this->StartProxySearch();
                    phpCrawler::log()->logInfo("Proxy_[GET PROXY] Started! Minimal count of proxy was installed to: " . $minimal_proxy_count);
                }
                
                $available_proxy_count--;

                $currentProxy = array();
                $currentProxy['ip'] = $proxy->ip;
                $currentProxy['port'] = $proxy->port;

                phpCrawler::log()->logInfo("2. NEW PROXY: " . $currentProxy['ip'] . ":" . $currentProxy['port']);

                # установка прокси
                $this->__browser->useProxy("http://" . $currentProxy['ip'] . ":" . $currentProxy['port'], null, null);

                # загрузка сайта по присланной ссылке (root_address) и вычисление времени загрузки сайта
                $timeStart = time();
                $page = $this->__browser->get($root_address);
                $timeStop = time();
                $difference = $timeStop - $timeStart;

                phpCrawler::log()->logInfo("   [" . $currentProxy['ip'] . ":" . $currentProxy['port'] . "]" . "\t" . "(" .
                $this->__browser->getResponseCode() . ") " . "PROXY_CHECKER::PAGE LOADING TEST TIME: " . $difference . "sec");

                # тестирование №1 (необходимо для определения есть ли редирект, и если есть, то идет он из сайта или из-за прокси)
                if ($this->TestUrl($site_name)) {
                    $testUrlNumber = 0;
                    
                    # проверка респонс кода и времени загрузки сайта
                    if ($this->__browser->getResponseCode() == "200" AND $difference < 40) {
                        $this->DataBaseChange(2);
                        $badResponsCode_counter = 0;

                        # тестирование №2 (необходимо для проверки корректности работы выбранного прокси)
                        $result = $this->TestPage($page, $site_name);

                        if ($result) {
                            $this->DataBaseWrite(1, $proxy);
                            phpCrawler::log()->logInfo("4. PROXY_CHECKER::Proxy was selected for " . $site_name . ": " .$currentProxy['ip'] .":" .$currentProxy['port']);
                            return $currentProxy['ip'] . ":" . $currentProxy['port'];
                        }
                        else {
                            $this->DataBaseWrite(2, $proxy);
                        }
                    }
                    else {
                        $this->DataBaseWrite(3, $proxy);
//                        preg_match('"/\d{1,3}.\d{1,3}.\d{1,3}.\d{1,3}/"', $href, $matches);
//                        if (count($matches) > 0) {
//                            $href = preg_replace('"/\d{1,3}.\d{1,3}.\d{1,3}.\d{1,3}/"', "/www." . strtolower($site_name) . ".com/", $href);
//                        }
                        $badResponsCode_counter++;
                        phpCrawler::log()->logInfo(" - TEST PROXY FAILED (count of fail is: " . $badResponsCode_counter . ") | URL: " . $this->__browser->getUrl());
                        if ($badResponsCode_counter > 9) {
                            $this->__browser->useProxy("http://" . $this->__master_proxy, null, null);
                            $page = $this->__browser->get($root_address);
                            if ($this->__browser->getResponseCode() == "200") {
                                $this->DataBaseChange(2);
                                phpCrawler::log()->logInfo(" + TestUrl(MasterProxy)->Success. Proxy with status 3 was deleted");
                                phpCrawler::log()->logInfo(" + Url is correct!");
                            }
                            else {
                                $this->DataBaseChange(0);
                                phpCrawler::log()->logInfo(" - TestUrl(MasterProxy)->Failed. Proxy with status 3 was restored");
                                phpCrawler::log()->logInfo(" - Bad Url. Url was skyped!");
                                return "bad_url";
                            }
                        }
                    }
                }
                else {
                    $this->DataBaseWrite(3, $proxy);
                    $testUrlNumber++;
                    phpCrawler::log()->logInfo(" - TEST URL FAILED (count of fail is: " . $testUrlNumber . ") | URL TRANSFORM: " . $root_address . "  ---->  " . $this->__browser->getUrl());
                    if ($testUrlNumber > 4) {
                        $this->__browser->useProxy("http://" . $this->__master_proxy, null, null);
                        $page = $this->__browser->get($root_address);
                        if ($this->TestUrl($site_name)) {
                            $this->DataBaseChange(2);
                            phpCrawler::log()->logInfo(" + TestUrl(MasterProxy)->Success. Proxy with status 3 was deleted");
                            phpCrawler::log()->logInfo(" - PROXY REDIRECT!");
                        }
                        else {
                            $this->DataBaseChange(0);
                            phpCrawler::log()->logInfo(" - TestUrl(MasterProxy)->Failed. Proxy with status 3 was restored");
                            phpCrawler::log()->logInfo(" - SITE REDIRECT!");
                            return "site_redirect";
                        }
                    }
                }

                unset($currentProxy);
            }
        }

        return null;
    }

    private function DataBaseWrite($status, $proxy) {
        try {
            $proxy->set('proxy_status', $status);
            $proxy->save();
        }catch(Exception $e){
            phpCrawler::log()->logCrit(" - PROXY MANAGER DATABASE ERROR:: " . $e->getMessage(),'db_error');
        }
    }
    
    private function DataBaseChange($status) {
        try { 
            $proxy_list = ORM::for_table('Proxy_List')->where_equal('proxy_status', 3)->find_many();
            if(!$proxy_list)
                echo "ERROR DATABASE. MySQL write: 3. ", mysql_errno();

        }
        catch(Exception $e) { 
            phpCrawler::log()->logCrit($e->getMessage(),'db_error'); 
        }
        foreach ($proxy_list as $proxy) {
            try {
                $proxy->set('proxy_status', $status);
                $proxy->save();
            }catch(Exception $e) {
                phpCrawler::log()->logCrit(" - PROXY MANAGER DATABASE ERROR:: " . $e->getMessage(),'db_error');
            }
        }
    }

    private function IsGearmanHasProxyJob() {
        $this->__gt = new GearmanHost(phpCrawler::conf()->serverIP,phpCrawler::conf()->serverPort);
        $jobs = $this->__gt->getJobs();
        $jobs_name = array_keys($jobs);
        $proxy_jobs = preg_grep("/Proxy_/", $jobs_name);

        $proxyJob_isExist = false;
        foreach ($proxy_jobs as $proxy_job) {
            if ($jobs[$proxy_job]['TOTAL'] != 0 && $jobs[$proxy_job]['RUNNING'] != 0) {
                phpCrawler::log()->logInfo("   ".$proxy_job."\t"."TOTAL: ".$jobs[$proxy_job]['TOTAL']."\t"."RUNNING: ".$jobs[$proxy_job]['RUNNING']);
                $proxyJob_isExist = true;
            }
        }

        unset($this->__gt, $jobs, $jobs_name, $proxy_jobs);

        return $proxyJob_isExist;
    }
    
    private function TestUrl($site_name) {
        $key = strtolower($site_name);
        $pageUrl = $this->__browser->getUrl();
        $pageUrl = strtolower($pageUrl);
        
        if (substr_count($pageUrl, $key) > 0)
            return true;
        else
            return false;
    }
    
    private function TestPage($page, $site_name) {
        $html = new simple_html_dom();
        $html->load($page);
        $lowSiteName = strtolower($site_name);
        
        switch ($lowSiteName) {

	    case "fotocasa":
                phpCrawler::log()->logInfo("   TestPage(" . $site_name . ")...");
                
                #Search Menu tab -> ""
                if ($html->find(".compound-logo")) {
                    phpCrawler::log()->logInfo(" + Success");
                    return true;
                }else {
                    phpCrawler::log()->logInfo(" - Failed");
                    return false;
                }

            
            default :
                phpCrawler::log()->logInfo(" - Please Check Site Name: {" . $site_name .  "}");
                return false;
        }
    }
	
    private function StartProxySearch() {
        #запуск поиска новых прокси адресов
        exec("cd /root/test && ./stop.sh Proxy");
        sleep(1);
        exec("php /root/test/main.php -c /root/test/crawlers/Proxy/config_proxy.php -n Proxy");
    }
    
    private function Tor($root_address, $site_name) {
        # установка прокси через Tor
        $this->__browser->useProxy("http://" . $this->__tor_address, null, null);

        # загрузка сайта по присланной ссылке (root_address) и вычисление времени загрузки сайта
        $page = $this->__browser->get($root_address);
        if ($this->__browser->getResponseCode() != "200") {
            phpCrawler::log()->logWarn(" - Tor Failed .Response Cod: " .$this->__browser->getResponseCode());
            
            # установка мастер прокси
            $this->__browser->useProxy("http://" . $this->__master_proxy, null, null);

            # загрузка сайта по присланной ссылке (root_address) и вычисление времени загрузки сайта
            $page = $this->__browser->get($root_address);
            if ($this->__browser->getResponseCode() != "200") {
                phpCrawler::log()->logCrit(" - MasterProxy Failed .Response Cod: " .$this->__browser->getResponseCode());
                phpCrawler::log()->logInfo(" - Bad Url. Url was skyped!");
                return "bad_url";
            }
            else {
                phpCrawler::log()->logCrit(" - MasterProxy Success .Response Cod: " .$this->__browser->getResponseCode());
                phpCrawler::log()->logEmerg("- Tor need check \"NEWNYM\"!");
            }
        }
        else {
            phpCrawler::log()->logInfo(" + OK");
        }
        return $this->__tor_address;
    }
}

?>
