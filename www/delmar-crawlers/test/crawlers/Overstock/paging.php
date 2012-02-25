<?php

/**
 * idealista.com paging 
 * @author <yuri@progforce.com>
 */
class Overstock_paging {

    protected $__browser;
    // Browser for page getting
    protected $__client; // Gearman client object

    /**
     * Constructor
     */
    function __construct() {

        // Bbrowser init
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

        // Client init
        $this->__client = clientSendData::getInstance();
    }

    public function Overstock_getLinks($job) {
        phpCrawler::log()->logInfo("Start gathering of links...");
        $links_total = 0;
        $pages_num = 1;
        $job = unserialize($job->workload());
        echo "\n-->" . $job['link'] . "\n";
        $page = $this->__browser->get($job['link']);
        echo "\n" . $this->__browser->getResponseCode();

        phpCrawler::log()->logInfo("Paging mode: $mode");
        $html = new simple_html_dom();
        $html->load($page);

        $thumbs = $html->find("#result-products .pro-thumb");
        $links = array();
        $links_total = 0;
        foreach($thumbs as $thumb){
            $ad_link = $thumb->href;
            $links [] = array(
             //  "mode" => $mode,
               "url" => $ad_link,
               // "section" => $section,
               //"ad_date" => $ad_date,
               // "category" => $category
            );
            echo "\n".$thumb->href;
        }
        $links_total = $links_total + count($links);
        
        phpCrawler::log()->logInfo("Mode: $mode. Pass base links to dbworker...");
        $this->__client->sendWait("Overstock_writeLinks", $links);
        unset($links);
//        if (!empty($result)) {
//            $pages_num = floor((preg_replace("/[^0-9]/", '', $result[0]->plaintext)) / 50 + 1);
//        }
//        echo "\n Number=$pages_num\n";


//
//        $result = $html->find("#primary-h1");
//        if (!empty($result)) {
//            $pages_num = floor((preg_replace("/[^0-9]/", '', $result[0]->plaintext)) / 50 + 1);
//        }
//        echo "\n Number=$pages_num\n";
//
//        for ($next = 1; $next <= $pages_num; $next++) {
//            echo "\nNEXT=$next\n";
//            $page = $this->__browser->get($job['link'] . $next);
//            $html->load($page);
//            $links = array();
//            $li_ads = $html->find("li.hlisting");
//            if (!empty($li_ads)) {
//
//                foreach ($li_ads as $li_ad) {
//                    $ad_date='';
//
//                    if ($mode == 'daily') {
//                        $ad_time = $li_ad->find('.post-date');
//                        if (!empty($ad_time)) {
//                            echo "\ntime-->" . $ad_time[0]->plaintext . "\n";
//                            $title = $ad_time[0]->title;
//                            if (preg_match('/^([\d]{4})([\d]{2})([\d]{2})T.*?$/', $title, $matches)) {
//                                $ad_date = $matches[1] . "-" . $matches[2] . "-" . $matches[3];
//                                echo "\nad_date=$ad_date\n";
//                            }
//
//                            if (substr_count($ad_time[0]->plaintext, "days ago") != 0) {
//                                echo "\n-->" . substr_count($ad_time[0]->plaintext, "days ago") . "\n";
//                                $next = $pages_num + 1;
//                            } else {
//                                $featured = $li_ad->find('.featured');
//                                if (empty($featured)) {
//
//                                    $a_ad = $li_ad->find('a');
//                                    if (!empty($a_ad)) {
//                                        $ad_link = "http://www.gumtree.com" . $a_ad[0]->href;
//                                        echo "\nlink-->" . $ad_link;
//                                        $links [] = array(
//                                            "mode" => $mode,
//                                            "url" => $ad_link,
//                                            "section" => $section,
//                                            "ad_date" => $ad_date,
//                                            "category" => $category
//                                        );
//                                    }
//                                }
//                            }
//                        }
//                    } elseif ($mode == 'all') {
//                        $a_ad = $li_ad->find('a');
//                        if (!empty($a_ad)) {
//                            $ad_time = $li_ad->find('.post-date');
//                            if (!empty($ad_time)) {
//                                echo "\ntime-->" . $ad_time[0]->plaintext . "\n";
//                                $title = $ad_time[0]->title;
//                                if (preg_match('/^([\d]{4})([\d]{2})([\d]{2})T.*?$/', $title, $matches)) {
//                                    $ad_date = $matches[1] . "-" . $matches[2] . "-" . $matches[3];
//                                }
//                            }
//                            if (empty($ad_date)){
//                                    $ad_date = date("Y-m-d",time());
//                                }
//                                $ad_link = "http://www.gumtree.com" . $a_ad[0]->href;
//                                echo "\nlink-->" . $ad_link;
//                                $links [] = array(
//                                    "mode" => $mode,
//                                    "url" => $ad_link,
//                                    "section" => $section,
//                                    "ad_date" => $ad_date,
//                                    "category" => $category
//                                );
//                            }
//                        }
//                    }
//                }
//                $links_total = $links_total + count($links);
//
//
//
//                if ($mode == 'daily') {
//                    phpCrawler::log()->logInfo("Mode: $mode. Pass base links to dbworker...");
//                    $this->__client->sendWait("Overstock_writeLinks", $links);
//                }
//                if ($mode == 'all') {
//                    phpCrawler::log()->logInfo("Mode: $mode. Pass base links to dbworker...");
//                    $this->__client->sendWait("Overstock_writeLinks", $links);
//                }
//                unset($links);
//            }

            return $links_total;
        }



//    private function ChangeProxy($test_page) {
//            $currentProxy = $this->__client->sendWait("system_ProxyManager", array("url"=>$test_page, "site_name"=>"Gratka"));
//            if ($currentProxy != null) {
//                if ($currentProxy != "site_redirect") {
//                    $currentProxy = explode(":", $currentProxy);
//                    $this->__browser->useProxy("http://" . $currentProxy[0] . ":" . $currentProxy[1], null, null);
//                    phpCrawler::log()->logInfo("YOU HAVE NEW PROXY: " . $currentProxy[0] . ":" . $currentProxy[1]);
//                    return true;
//                }
//                else if ($currentProxy == "site_redirect"){
//                    phpCrawler::log()->logWarn("SITE LINK REDIRECT. This link was skipped: " . $test_page);
//                    return false;
//                }
//                else if ($currentProxy == "bad_url"){
//                    phpCrawler::log()->logWarn("NOT CORRECT SITE LINK. This link was skipped: " . $test_page);
//                    return false;
//                }
//            }
//            else {
//                phpCrawler::log()->logCrit("DATABASE:PROXY LISY IS EMPTY");
//                exit();
//            }
//        }
//
    }
?>
