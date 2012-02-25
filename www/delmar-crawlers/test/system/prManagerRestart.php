<?php
/**
 * Description of ProxyManager
 *
 * @author progforce
 */
class system_prManagerRestart {

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
    }

    public function system_PrManagerRestart() {
        echo "START!!!\n";
        exec("cd /root/test && ./stop.sh proxyManager");
        exec("php /root/test/main.php -c /root/test/config/proxyManager_config.php -n system");
        phpCrawler::log()->logCrit(" server 46.4.7.198  system_ProxyManager RESTART work!");
    }
       
}

?>
