<?php

/*
 * Crawler for Gismeteo site.
 */

require_once('lib/simpletest/browser.php');
include_once('lib/simplehtmldom/simple_html_dom.php');

//include_once('lib/idiorm/idiorm.php');

function create_browser() {

// create browser
    $browser = &new SimpleBrowser();
    $browser->useCookies();
    $browser->useFrames();
    $browser->addHeader("Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8");
    $browser->addHeader("User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.2.16) Gecko/20110323 Ubuntu/10.10 (maverick) Firefox/3.6.16");
    $browser->addHeader("Cache-Control: private");
    $browser->addHeader("Connection: keep-alive");
    $browser->addHeader("Keep-Alive: 115");
    $browser->addHeader("Accept-Charset: ISO-8859-1,utf-8;q=0.7,*;q=0.7");
    $browser->addHeader("Accept-Language: en-us,en;q=0.5");
    return $browser;
}


function getData($browser) {
    $main_link = "http://dom.gratka.pl";
echo "\n".$main_link."\n";
    try{
    $page = $browser->get($main_link);}
catch(Exception $e){echo "ERROR";}

echo $page;


$html = new simple_html_dom();
//$page = utf8_encode($page);
//$page=iconv('utf-8','iso-8859-2',$page);
    $page = iconv("ISO-8859-2", "UTF-8", $page);
    $html->load($page);
    #---------------------------
    # Parse page 
    #---------------------------
    $ad_descr_block = $html->find(".danePodst");
    if (!empty ($ad_descr_block)){
        if(preg_match('/(Garaż\/Miejsce parkingowe)/',$ad_descr_block[0]->innertext, $mathces)){
           echo "\n yes parking\n" ;

        }
        else{
          echo "\n no parking\n" ;
        }
         $dane_divs = $ad_descr_block[0]->find('.dane');
                if(!empty($dane_divs)){
                    foreach ($dane_divs as $dane_div){
                        if (substr_count($dane_div, "Okolica")!=0){
                            $neighborhood = $dane_div->find('p');
                            if(!empty($neighborhood)){
                                echo "\n".trim($neighborhood[0]->plaintext)."\n";
                            }
                        }
                    }
                }
    }
    die();


    $item_kol = $html->find('.kol ');
    if (!empty($item_kol)) {
        foreach ($item_kol as $kol) {
 
            if (substr_count($kol->innertext, "strong") != 0) {
                if ($kol->find('strong', 0)->plaintext == "Liczba pięter") {
                    echo "\napp_FloorTotal=>>" . trim(str_replace("Liczba pięter", "", $kol->plaintext));
                    $data['ad']['app_FloorTotal'] = trim(str_replace("Liczba pięter", "", $kol->plaintext));
                }
                if ($kol->find('strong', 0)->plaintext == "Typ budynku") {
                    echo "\nBuilding type=>>" . trim(str_replace("Typ budynku", "", $kol->plaintext));
                }
                if ($kol->find('strong', 0)->plaintext == "Materiał") {
                    echo "\nBuilding material=>>" . trim(str_replace("Materiał", "", $kol->plaintext));
                }
                 if ($kol->find('strong', 0)->plaintext == "Rok budowy") {
                    echo "\nYear of construction=>>" . trim(str_replace("Rok budowy", "", $kol->plaintext));
                }
                if ($kol->find('strong', 0)->plaintext == "Powierzchnia") {
                    echo "\napp_meter=>>" . trim(str_replace("m2", '', trim(str_replace("Powierzchnia", "", $kol->plaintext))));
                    $data['ad']['app_meter'] = trim(str_replace("m2", '', trim(str_replace("Powierzchnia", "", $kol->plaintext))));
                }
                if ($kol->find('strong', 0)->plaintext == "Forma własności") {
                    echo "\nform of ownership=>>" . trim(str_replace("Forma własności", "", $kol->plaintext));
                }
                if ($kol->find('strong', 0)->plaintext == "Piętro") {
                    echo "\nfloor=>>" . trim(str_replace("Piętro", "", $kol->plaintext));
                    $data['ad']['app_Floor'] = trim(str_replace("Piętro", "", $kol->plaintext));
                }
                if ($kol->find('strong', 0)->plaintext == "Liczba pokoi") {
                    echo "\nrooms=>>" . trim(str_replace("Liczba pokoi", "", $kol->plaintext));
                    $data['ad']['app_Rooms'] = trim(str_replace("Liczba pokoi", "", $kol->plaintext));
                }
                if ($kol->find('strong', 0)->plaintext == "Liczba poziomów") {
                    echo "\nlevels=>>" . trim(str_replace("Liczba poziomów", "", $kol->plaintext));
                }
                if ($kol->find('strong', 0)->plaintext == "Głośność") {
                    echo "\nvolume=>>" . trim(str_replace("Głośność", "", $kol->plaintext));
                }
                if ($kol->find('strong', 0)->plaintext == "Okna") {
                    echo "\nwindow=>>" . trim(str_replace("Okna", "", $kol->plaintext));
                }
                if ($kol->find('strong', 0)->plaintext == "Powierzchnia dodatkowa") {
                    $addit_area = trim(str_replace("Powierzchnia dodatkowa", "", $kol->plaintext));
                    echo "\nAdditional area=>>" . $addit_area;
                    if (substr_count($addit_area, "balkon")!=0){
                        $data['ad']['app_BalconyIndex'] = "yes";
                    }
                }
            }
        }
    }

    $ad_descr_block = $html->find(".danePodst");
    if (!empty ($ad_descr_block)){
        if(preg_match('/(Garaż/Miejsce parkingowe)/',$ad_descr_block[0]->innertext, $mathces)){
           echo "\n yes parking\n" ;

        }
        else{
          echo "\n no parking\n" ;
        }
    }

    $blocks = $html->find('.dane ');
    if (!empty($blocks)) {
        foreach ($blocks as $block) {
            if (substr_count($block->innertext, "h3") != 0) {
                if ($block->find('h3', 0)->plaintext) {
                    if ($block->find('h3', 0)->plaintext == "Numer oferty") {
                        $key = $block->find('.opis', 0)->plaintext;
                        echo "\nAd_key=" . trim($key);
                    }
                }
            }
        }
    }
    die();

    $title = $html->find('#ogloszenie h1');
    if (!empty($title)) {
        echo "\n Title-->" . $title[0]->innertext;
    }

    $price = $html->find('.opis');
    if (!empty($price)) {
        echo "\n Price-->" . $price[0]->plaintext;
    }

    $sizes = $html->find('.duzeLitery');
    if (!empty($sizes)) {


        echo "\n Rooms-->" . $sizes[0]->plaintext;
        echo "\n Meter-->" . $sizes[1]->plaintext;
        echo "\n Floor-->" . $sizes[2]->plaintext;
    }
    die();
 
}

#-------------------------#
# Main body application   #
#-------------------------#
echo "\nstart";
$browser = create_browser();
echo "\n browser created";
getData($browser);
//getLinks($browser);
?>
