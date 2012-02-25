<?php

phpCrawler::load(array(
            'lib/idiorm/idiorm.php',
            'lib/liorbk/GearmanTelnet.php'
        ));

class Overstock_client {

    private $__gc;
    protected $__browser;
    private $__categories = array(
        array(
            "name" => "Jewelry",
            "link" => "http://www.overstock.com/Jewelry-Watches/Jewelry/13/dept.html"),
 
        
    );


    function __construct($gc) {
        $this->__browser = &new SimpleBrowser();
        $this->__browser->useCookies();
        $this->__browser->addHeader("Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5");
        $this->__browser->addHeader("User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6; rv:2.0) Gecko/20100101 Firefox/4.0");
        $this->__browser->addHeader("Cache-Control: max-age=0");
        $this->__browser->addHeader("Connection: keep-alive");
        $this->__browser->addHeader("Keep-Alive: 3000");
        $this->__browser->addHeader("Accept-Charset: ISO-8859-1,utf-8;q=0.7,*;q=0.7");
        $this->__browser->addHeader("Accept-Language: en-us,en;q=0.5");
        $this->__browser->addHeader("Pragma: ");

        $host = phpCrawler::conf()->host;
        $user = phpCrawler::conf()->user;
        $pass = phpCrawler::conf()->pass;
        $dbname = phpCrawler::conf()->dbname;
        ORM::configure('driver_options', array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'));
        ORM::configure('mysql:host=' . $host . ';dbname=' . $dbname);
        ORM::configure('username', $user);
        ORM::configure('password', $pass);
        ORM::configure('id_column_overrides', array(
                    'sitesp' => 'Site_Id'
                ));
        $this->__gc = $gc;
    }

    function start() {
        phpCrawler::log()->logInfo("Crawler launched in daily mode.");
        $db = ORM::get_db();

//        $db->exec("TRUNCATE TABLE Overstock_Links;");

 /*       foreach ($this->__categories as $category) {
//            echo "\n" . $category['name'];
//            echo "\n" . $category['section'];
//            echo "\n" . $category['link_part'];
            phpCrawler::log()->logInfo("Search  links for section: " . $category['name']);
            $count = $this->__gc->do("Overstock_getLinks", serialize(array(
                                "link" => $category['link'],
                            )));
            phpCrawler::log()->logInfo($category['name'] . ": Found links. Count=" . $count);
        }*/
        
        

        $start_page = $this->__browser->get("http://www.overstock.com/Jewelry-Watches/Jewelry/13/dept.html");
        $html = new simple_html_dom();
        $html->load($start_page);

        $count_items_tag = $html->find('.results-heading span');
        $item_count = preg_replace("/[^0-9]/", '', $count_items_tag[0]->plaintext);
        $total_count = (int) $item_count;
        //phpCrawler::log()->logInfo($total_count);
        
        $increment = 50;
        $start_index = 0;
        $i = $start_index;
        while ($i<=$total_count)  {
            
            $link = "http://www.overstock.com/Jewelry-Watches/Jewelry/13/dept.html?index=" . $i . 
                    "&sort=Relevance&count=50";
            $payload = array("link" => $link);
            $count = $this->__gc->do("Overstock_getLinks", serialize($payload));
            //phpCrawler::log()->logInfo("Changed????" . $link);
            
            $i += $increment;
        }

        $this->crawler();
    }

    function crawler() {
        $serverIP = phpCrawler::conf()->serverIP;
        $serverPort = phpCrawler::conf()->serverPort;
        $this->_table = ORM::for_table('Overstock_Links')->create();
        do {
            $telnet = new GearmanHost($serverIP, $serverPort);
            $jobs = $telnet->getJobs();
	    $items_limit = 500;
            if ($jobs['Overstock_loadPage']['TOTAL'] < $items_limit) {
                $rows = ORM::for_table('Overstock_Links')->where('link_status', 'new')->limit($items_limit)->find_many();
                foreach ($rows as $row) {
                    //phpCrawler::log()->logInfo('Row_id = '.$row->id);
                    $this->__gc->doBackground("Overstock_loadPage", serialize(array(
                        "name" => "Overstock", 
                        "link_id" => $row->id, 
                        // "AD_City" => $row->AD_City, 
                        // "AD_Region" => $row->AD_Region, 
                        "AD_Site" => 1, //$row->AD_Site, 
                        // "AD_Section" => $row->AD_Section, 
                        "Ad_Link" => $row->AD_Link, 
                        "AdDate" => $row->AdDate, 
                        // "Category" => $row->Category
                    )));
                    $link_for_update = ORM::for_table('Overstock_Links')->where('id', $row->id)->find_one();
                    $link_for_update->set('link_status', 'process');
                    $link_for_update->save();
                }
            } else {
                sleep(30);
            }
        } while (!empty($rows));
        do {
            phpCrawler::log()->logInfo("Check working status...");
            $link_finished = ORM::for_table('Overstock_Links')->where('link_status', 'process')->find_many();
            if (empty($link_finished)) {
                phpCrawler::log()->logInfo("Crawler is finished.");
                //$site_status = ORM::for_table('sitesp')->where('Site_Name', 'Overstock')->find_one();
                //$site_status->set('Site_Crawling', '0');
                //$site_status->save();
            }
        } while (!empty($link_finished));
    }

}
?>
