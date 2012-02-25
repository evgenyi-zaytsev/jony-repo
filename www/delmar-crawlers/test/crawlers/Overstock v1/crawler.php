<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Overstock_crawler
 *
 * @author Svetlana
 */
class Overstock_crawler {

    protected $__browser;
    protected $__client;

    function __construct() {
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

        $this->__client = clientSendData::getInstance();
    }

    public function Overstock_loadPage($job) {
        try {
            $job = unserialize($job->workload());
            $data = array();
            $remove = array("\n", "\r\n", "\r", "\t", "&nbsp;");

            $url = $job["Ad_Link"];

            phpCrawler::log()->logInfo("Load ad page. URL=" . $url);
            $page = $this->__browser->get($url);
//                   echo "\n".$this->__browser->getResponseCode();
//        if ($this->__browser->getResponseCode() != "200") {
//                if ($this->ChangeProxy($url)){
//                    $page = $this->__browser->get($url);
//                }
//                else { return false; }
//            }

            $response_code = $this->__browser->getResponseCode();
            phpCrawler::log()->logInfo("Response code=" . $response_code);
            if ($response_code == 500) {
                phpCrawler::log()->logFatal("Server Error", 'server_error');
                $this->__client->send("Overstock_WriteStatusAd", array('id' => $job["link_id"], 'status' => 'error'));
                return;
            } else if ($response_code == 403) {
                phpCrawler::log()->logFatal($url, 'banned_403');
                $this->__client->send("Overstock_WriteStatusAd", array('id' => $job["link_id"], 'status' => 'banned'));
                return;
            } else if ($response_code == 404) {
#phpCrawler::log()->logFatal($url, 'not_found');
                $this->__client->send("Overstock_WriteStatusAd", array('id' => $job["link_id"], 'status' => 'discharged'));
                return;
            }
//            else if ($response_code != 200) {
//                phpCrawler::log()->logFatal($response_code, 'some_server_error');
//                echo "\n response=" . $response_code;
//                $this->__client->send("Overstock_WriteStatusAd", array('id' => $job["link_id"], 'status' => 'discharged'));
//                return;
//            }
//            if (substr_count($page, 'ha sido dado de baja') > 0) {
//                phpCrawler::log()->logWarn("Discharged ad found. URL=" . $url, "no_data_found");
//                $this->__client->send("Overstock_WriteStatusAd", array('id' => $job["link_id"], 'status' => 'discharged'));
//                return;
//            }
//
//            if (substr_count($page, 'pendiente de que un miembro de nuestro equipo lo verifique') > 0) {
//                phpCrawler::log()->logWarn("Pending ad found. URL=" . $url, "no_data_found");
//                $this->__client->send("Overstock_WriteStatusAd", array('id' => $job["link_id"], 'status' => 'pending'));
//                return;
//            }

            //phpCrawler::log()->logInfo($url);
            $html = new simple_html_dom();
            //phpCrawler::log()->logInfo($page);
            //$page = iconv("ISO-8859-2", "UTF-8", $page);
            $html->load($page);
            //echo '***PAGE*** ';
            //echo $page;
            //echo '***HTML*** ';
            //echo $html;
            // $notice = $html->find(".notice");
            // if (!empty($notice)) {
            //     if (trim($notice[0]->plaintext) == "Sorry, this item is no longer available.") {
            //         echo "\n" . trim($notice[0]->plaintext) . "\n";
            //         $this->__client->send("Overstock_WriteStatusAd", array('id' => $job["link_id"], 'status' => 'discharged'));
            //         return;
            //     }
            // }

            // $info = $html->find(".ad-footer-info");
            // if (!empty($info)){
            //     echo "\n INFO: ".$info[0]->innertext."\n";
            //     if(preg_match ("/.*?(Posted .*?)<.*?/", $info[0]->plaintext, $matches)){
            //         echo "\n DATE: ".$matches[1]."\n";
            //     }
            // }


            $data['link_id'] = $job["link_id"];
            $data['ad']['AD_Site'] = $job["AD_Site"];
            //$data['ad']['AD_Section'] = $job["AD_Section"];
            $data['ad']['Ad_Link'] = $job["Ad_Link"];
            // $data['ad']['AD_City'] = $job["AD_City"];
            // $data['ad']['AD_Region'] = $job["AD_Region"];
            $cur_date = date("Y-m-d H:i:s");
            $data['ad']['AD_UpdateDate'] = $cur_date;//$job["AdDate"];
            $data['ad']['AD_PostDate'] = $cur_date; //$job["AdDate"];
            //$data['ad']['yad2_Category'] = $job["Category"];

// ADD_key  
            preg_match('/.*\/(\d+)\/product.html$/', $job["Ad_Link"], $matches);
            if (!empty($matches)) {
                $data['ad']['AD_KEY'] = $matches[1];
            }

// Title
            //sleep(1);
            $title_block = $html->find('title');
            phpCrawler::log()->logInfo("Title_block");
            phpCrawler::log()->logInfo($title_block[0]->innertext);
            phpCrawler::log()->logInfo('Count of array items' . count($title_block));
            if (!empty($title_block)) {
                //$data['ad']['AD_Title'] = trim($title[0]->innertext);

                $title = trim($title_block[0]->innertext);
                preg_match("/(.*)\|.*$/", $title,  $matches);
                if (!empty($matches)) {
                    $title = $matches[1];
                }
//                    echo "\n Title-->" . $title;
                $data['ad']['name'] = $title;
               phpCrawler::log()->logInfo($data['ad']['name']);
            }
            

// Price
            $price_item = $html->find('.Oprice .Ovalue');
            if (!empty($price_item)) {
                $price = trim($price_item[0]->plaintext);
                $ad_price = preg_replace("/[^0-9\.]/", '', $price);
                echo "\n Price-->" . $ad_price;
                $data['ad']['AD_Price'] = $ad_price;
            }

// Description
            $description_item = $html->find('#details_descFull');
            if (!empty($description_item)) {
//                             echo "\n Descr-->" . trim($description_item[0]->plaintext);
                $data['ad']['AD_Description'] = trim($description_item[0]->innertext);
            }
// Model_no
            $item_model = $html->find('#details_descMisc dd');

            if (!empty($item_model)) {
                $model = trim($item_model[2]->plaintext);
//                             echo "\n Descr-->" . trim($description_item[0]->plaintext);
                $data['ad']['model_no'] = $model;
                phpCrawler::log()->logInfo("MODEL'KA !!!". $data['ad']['model_no']);
            }

// Materials
            $item_materials = $html->find('#details_descMisc dd');

            if (!empty($item_materials)) {
                $material = trim($item_model[1]->plaintext);
//                             echo "\n Descr-->" . trim($description_item[0]->plaintext);
                $data['ad']['AD_Materials'] = $material;
                phpCrawler::log()->logInfo("Materials !!!". $data['ad']['AD_Materials']);
            }



/*
// Address 
            $address = $html->find('.ad-location');
            if (!empty($address)) {
                echo "\n Address-->" . trim($address[0]->plaintext);
                $data['ad']['AD_Address'] = trim($address[0]->plaintext);
            }
// Description
            $description_item = $html->find('#vip-description-text');
            if (!empty($description_item)) {
//                             echo "\n Descr-->" . trim($description_item[0]->plaintext);
                $data['ad']['AD_Notes'] = trim($description_item[0]->plaintext);
            }

// Contact & Phone
            $contakt_block = $html->find('.phone');
	    if (!empty($contakt_block)) {
		//if there are name & phone
		if (preg_match('/^(.*?)on(.*?)$/', $contakt_block[0]->innertext, $matches)) {
		    echo "\nname->" . trim($matches[1]);
		    echo "\ncount=" . substr_count($matches[1], "NO TEXTS") . "\n";
		    if (substr_count($matches[1], "NO TEXTS") == 0) {
		        $data['ad']['AD_ContactName1'] = trim($matches[1]);
		    }
		    echo "\nphone->" . trim($matches[2]);
		    $data['ad']['AD_Phone1'] = trim($matches[2]);
		}
		else{
	   //if there is only phone
		     $data['ad']['AD_Phone1'] = $contakt_block[0]->plaintext;
		}
	    }
// Location: Region, Area, City
            $breadcrumbs = $html->find('#breadcrumbs');
            if (!empty($breadcrumbs)) {
                $location = array();
                $breadcrumbs_items = $breadcrumbs[0]->find("a");
                if (!empty($breadcrumbs_items)) {
                    foreach ($breadcrumbs_items as $breadcrumbs_item) {
                        echo "\nli - >" . $breadcrumbs_item->plaintext;
                        if (trim($breadcrumbs_item->plaintext) == "Pets") {
                            break;
                        } else if (trim($breadcrumbs_item->plaintext) != "United Kingdom") {
                            $location[] = trim($breadcrumbs_item->plaintext);
                        }
                        echo "\n";
                    }
                    print_r($location);
                    if (count($location) == 3) {
                        $data['ad']['AD_Region'] = $location[0];
                        $data['ad']['AD_Area'] = $location[1];
                        $data['ad']['AD_City'] = $location[2];
                    } elseif (count($location) == 2) {
                        $data['ad']['AD_Region'] = $location[0];
                        $data['ad']['AD_City'] = $location[1];
                    } elseif (count($location) == 1) {
                        $data['ad']['AD_City'] = $location[0];
                    }
                }
            }

// Images

            $gallery_thumbs = $html->find('.gallery-thumbs');

            if (!empty($gallery_thumbs)) {
                $thumbs = $gallery_thumbs[0]->find(".thumbnail");
                foreach ($thumbs as $thumb) {
                    echo "\n ->" . $thumb->src;
                    $data['images'] [] = str_replace("thumb", "big", $thumb->src);
                }
            } else {
                $gallery_main = $html->find('.gallery-main');
                if (!empty($gallery_main)) {
                    $image = $gallery_main[0]->find("img");
                    if (!empty($image)) {
                        $data['images'] [] = $image[0]->src;
                    }
                }
            }
            print_r($data[$images]);
*/
// Images

            $gallery_thumbs = $html->find('ul.noZoom li img');

            if (!empty($gallery_thumbs)) {
                foreach ($gallery_thumbs as $gallery_thumb) {
                    echo "\n ->" . $gallery_thumb->src;
                    $data['images'][] = $gallery_thumb->src;
                }
            } 

            print_r($data[$images]);


            if (!empty($data)) {
                phpCrawler::log()->logInfo("Pass data array to dbworker.");
                

                //phpCrawler::log()->logInfo(print_r($data, true));
                $this->__client->send("Overstock_WriteDataAd", $data);

                unset($data);
                unset($html);
                unset($temp);
            } else {
                phpCrawler::log()->logFatal("No data found for ad by URL=" . $url, "no_data_found");
            }
        } catch (Exception $e) {
            phpCrawler::log()->logFatal("Caught exception: " . $e->getMessage());
        }
    }

    private function ChangeProxy($test_page) {
        $currentProxy = $this->__client->sendWait("system_ProxyManager", array("url" => $test_page, "site_name" => "Gratka"));
        if ($currentProxy != null) {
            if ($currentProxy != "site_redirect") {
                $currentProxy = explode(":", $currentProxy);
                $this->__browser->useProxy("http://" . $currentProxy[0] . ":" . $currentProxy[1], null, null);
                phpCrawler::log()->logInfo("YOU HAVE NEW PROXY: " . $currentProxy[0] . ":" . $currentProxy[1]);
                return true;
            } else if ($currentProxy == "site_redirect") {
                phpCrawler::log()->logWarn("SITE LINK REDIRECT. This link was skipped: " . $test_page);
                return false;
            } else if ($currentProxy == "bad_url") {
                phpCrawler::log()->logWarn("NOT CORRECT SITE LINK. This link was skipped: " . $test_page);
                return false;
            }
        } else {
            phpCrawler::log()->logCrit("DATABASE:PROXY LISY IS EMPTY");
            exit();
        }
    }

}
?>
