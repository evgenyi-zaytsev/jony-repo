<?php

class tools_killer {

    protected $__gt;

    public function __construct() {
        phpCrawler::load('lib/liorbk/GearmanTelnet.php');
        phpCrawler::load('lib/idiorm/idiorm.php');

        $this->__gt = new GearmanHost(phpCrawler::conf()->serverIP,phpCrawler::conf()->serverPort);
        ORM::configure('mysql:host=' . phpCrawler::conf()->host . ';dbname=' . phpCrawler::conf()->dbname);
        ORM::configure('username', phpCrawler::conf()->user);
        ORM::configure('password', phpCrawler::conf()->pass);
        ORM::configure('id_column_overrides', array(
            'sitesp' => 'Site_Id'
        ));
    }

    public function work() {
        phpCrawler::log()->logInfo("Killer start work");
        $memStat = `free -m`;
    	phpCrawler::log()->logDebug("Memory Status".PHP_EOL.$memStat);
        $jobs = $this->__gt->getJobs();
        $jobs_name = array_keys($jobs);
        $sites = ORM::for_table("sitesp")->find_many();
        $siteStatus = array();
        foreach ($sites as $site) {
            $siteStatus['stat'] = 0;
            $site_jobs = preg_grep("/" . $site->Site_Name . "/", $jobs_name);
            if (!empty($site_jobs)) {
                phpCrawler::log()->logDebug("Site name = " . $site->Site_Name);
                phpCrawler::log()->logDebug("Site jobs = " . print_r($site_jobs, true));
                foreach ($site_jobs as $site_job) {
                    phpCrawler::log()->logDebug("site job: ".$site_job);
                    phpCrawler::log()->logDebug("total: ".$jobs[$site_job]['TOTAL']);
                    phpCrawler::log()->logDebug("running: ".$jobs[$site_job]['RUNNING']);
                    phpCrawler::log()->logDebug("available: ".$jobs[$site_job]['AVAILABLE']);
                    if ($jobs[$site_job]['TOTAL'] == 0 && $jobs[$site_job]['RUNNING'] == 0) {
                        $siteStatus[$site->Site_Name] = array("name" => $site->Site_Name,
                                                              "stat" => $jobs[$site_job]['AVAILABLE'] != 0 ? 1 : 2,
                                                              "count" => $site->Site_KillCount);
                    } else {
                        $siteStatus[$site->Site_Name] = array("name" => $site->Site_Name,
                                                              "stat" => 0,
                                                              "count" => $site->Site_KillCount);
                        break;
                    }
                }
            } else {
                $message = "Site " . $site->Site_Name . " not in Gearman!";
                phpCrawler::log()->logInfo($message);
                continue;
            }
            $message = "Site " . $site->Site_Name . " ";
            switch ($siteStatus[$site->Site_Name]['stat']) {
                case 1:
                    $message .= "not work";
                case 2:
                    $message .= "not available workers";
                    break;

                default:
                    $message .= "work";
                    break;
            }
            phpCrawler::log()->logInfo($message);
        }

        $this->kill($siteStatus);

    	exec("chmod 777 /tmp/start_* && chmod -R 777 /root/test/log/*");
    	$memStat = `free -m`;
    	$procStat = `ps -eo pid,time,rss,comm | grep -v 00:0[0-5]`;
	$freeMem = exec("free -m | grep Mem | awk '{print $4}'");
    	if ( $freeMem<11 ){
		phpCrawler::log()->logError("AAA! The Thing eating our memory!! Free memory: $freeMem".PHP_EOL.$procStat);
	}
    	phpCrawler::log()->logDebug("Memory Status".PHP_EOL.$memStat);
    	phpCrawler::log()->logDebug("Proccess Status".PHP_EOL.$procStat);
        phpCrawler::log()->logInfo("Killer stop work! Zag-zag!");
    }

    public function kill($siteStatus) {
        if (!empty($siteStatus)) {
            foreach ($siteStatus as $status) {
                if ($status['stat'] == 1){
                    $status['count'] = $status['count'] + 1;
                    if ($status['count'] < phpCrawler::conf()->killCount){
                        $link_for_update = ORM::for_table('sitesp')->where('Site_Name', $status['name'])->find_one();
                        $link_for_update->set('Site_KillCount', $status['count']);
                        $link_for_update->save();
                        phpCrawler::log()->logInfo("Count killer = ".$status['count']);
                    }
                    else {
                        $command = 'ps aux | grep ' . $status['name'] . ' | grep -v grep | awk \'{print $2}\' | xargs sudo kill -9';
                        `$command`;
                        phpCrawler::log()->logInfo("Kill " . $status['name'] . "! Zag-zag!");

                        $link_for_update = ORM::for_table('sitesp')->where('Site_Name', $status['name'])->find_one();
                        $link_for_update->set('Site_KillCount', 0);
                        $link_for_update->save();
                    }
                }
                else if($status['stat'] == 0 && $status['count'] != 0){

                    $link_for_update = ORM::for_table('sitesp')->where('Site_Name', $status['name'])->find_one();
                    $link_for_update->set('Site_KillCount', 0);
                    $link_for_update->save();
                }

            }
        }
    }

}

/*$killer = new Killer($serverIP, $serverPort);
$killer->work();*/
?>

