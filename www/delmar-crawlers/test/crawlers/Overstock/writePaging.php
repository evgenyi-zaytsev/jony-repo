<?php

/*
 * idealista.com data writer
 */
phpCrawler::load('lib/idiorm/idiorm.php');

/**
 * Base write DB class
 * @author <yuri@progforce.com>
 */
class Overstock_writePaging {

    function _init() {
        $host   = phpCrawler::conf()->host;
        $user   = phpCrawler::conf()->user;
        $pass   = phpCrawler::conf()->pass;
        $dbname = phpCrawler::conf()->dbname;
        ORM::configure('driver_options', array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'));
        ORM::configure('mysql:host=' . $host . ';dbname=' . $dbname);
        ORM::configure('username', $user);
        ORM::configure('password', $pass);
    }
    
    function Overstock_writeLinks($data) {

        $data = unserialize($data->workload());

        $i = 0;

        foreach ($data as $key => $value) {
            // if ($value["mode"]=="daily"){
            //     $this->_table = ORM::for_table('Overstock_Links')->create();
            //     }
            // elseif ($value["mode"]=="all") {
            //     $this->_table = ORM::for_table('Overstock_Links_All')->create();
            //     $this->_table->AD_md5 = md5($value["url"]);

            // }
            $this->_table = ORM::for_table('Overstock_Links')->create();
            if ($key >= 0) {
                $i+=1;
                
//                $this->_table->baselink_subtype = $value["subtype"];
              //  $this->_table->	AD_Site = "2";
                $this->_table->	AD_Link = $value["url"];
                $this->_table->link_status = "new";
                // $this->_table->AD_Section = $value["section"];
                // $this->_table->AdDate = $value["ad_date"];
                // $this->_table->Category = $value["category"];
                $this->_table->save();
            }

        }
        return $i;
    }

    
    

    

}

?>
