<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
phpCrawler::load('lib/idiorm/idiorm.php');


/**
 * Description of writeData
 *
 * @author progforce
 */
class Overstock_writeData {

    private $_table;

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

    function Overstock_WriteStatusAd($data) {
        $data = unserialize($data->workload());
        $for_update = ORM::for_table('Overstock_Links')->find_one($data['id']);
        $for_update->set('link_status', $data['status']);
        $for_update->save();
        }


    function Overstock_WriteDataAd($data) {

        $data = unserialize($data->workload());

        $this->_table = ORM::for_table('Overstock_Temp_Ads')->create();
        $this->_table->AD_Site = $data['ad']["AD_Site"];
        //$this->_table->AD_Section = $data['ad']["AD_Section"];
        $this->_table->Ad_Link = $data['ad']["Ad_Link"];
        $this->_table->AD_md5 = md5($data['ad']["Ad_Link"]);
        $this->_table->AD_Description = $data['ad']['AD_Description'];
        $this->_table->model_no = $data['ad']['model_no'];
        $this->_table->AD_Materials = $data['ad']['AD_Materials'];
        $this->_table->AD_status = 0;
        phpCrawler::log()->logInfo('Write ad details to database for link='.$data['ad']["Ad_Link"]);
        foreach ($data['ad'] as $key=>$value) {
              $this->_table->$key = $value;
       }
        // IMAGES
        $this->_table->save();
           $post_id =$this->_table->id;

           foreach ($data["images"] as $photo) {
            // insert thumbs images

            preg_match('/.*\/(.*?)\.(.*?)$/', $photo, $matches);

            if (!empty($matches)) {
                $image_name = $matches[1] . "." . $matches[2];
             }
            $this->_table = ORM::for_table('Overstock_Images')->create();
            $this->_table->AD_id = $post_id;
            //$this->_table->Ad_Site = $data['ad']['AD_Site'];
            //$this->_table->Ad_Section = $data['ad']["AD_Section"];

            $this->_table->ImagePath = $photo;
            $this->_table->ImageName = $image_name;
            $this->_table->save();
        }

        /*foreach ($data["images"] as $photo) {
            // insert big images
            $this->_table = ORM::for_table('Overstock_Images')->create();
            $image_name = '';
            $this->_table->AD_Key = $post_id;
            $this->_table->cDate = date("Y-m-d H:i:s");
            $this->_table->Ad_Site = $data['ad']['AD_Site'];
            $this->_table->Ad_Section = $data['ad']["AD_Section"];
            $this->_table->ImagePath = $photo;
            preg_match('/.*\/(.*?\..*?)$/', $photo, $matches);
            if (!empty($matches)) {
                $image_name = $matches[1];
            }
            $this->_table->ImageName = $image_name;
            $this->_table->save();
            // insert thumbs images

            preg_match('/.*\/(.*?)\.(.*?)$/', $photo, $matches);

            if (!empty($matches)) {
                $image_name = $matches[1]."_thumb.".$matches[2];
             }
            $this->_table = ORM::for_table('Overstock_Images')->create();
            $this->_table->AD_Key = $post_id;
            $this->_table->cDate = date("Y-m-d H:i:s");
            $this->_table->Ad_Site = $data['ad']['AD_Site'];
            $this->_table->Ad_Section = $data['ad']["AD_Section"];
            $this->_table->ImagePath = str_replace("big", "thumb",$photo);
            $this->_table->ImageName = $image_name;
            $this->_table->save();
        }
        */

        phpCrawler::log()->logInfo('Link_id = '.$data["link_id"]);
        $for_update = ORM::for_table('Overstock_Links')->find_one($data['link_id']);
        $for_update->set('link_status', 'finished');
        $for_update->save();
        unset($data);
        unset($for_update);
        unset($this->_table);
    }

}

?>
