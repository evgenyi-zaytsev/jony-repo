<?php

class class_systemLog {

    public $date;
    private $__fileHandler;
    
    public function __construct() {
            
        $this->_createHandler();        
    }
    
    public function _createHandler(){
        if(!file_exists(phpCrawler::conf()->BASE_PATH."log/system")){
            mkdir(phpCrawler::conf()->BASE_PATH."log/system", 0777);
        }

        if(!file_exists(phpCrawler::conf()->BASE_PATH."log/system/".date("Y-m-d"))){
            mkdir(phpCrawler::conf()->BASE_PATH."log/system/".date("Y-m-d"), 0777);
        }
        if(!file_exists(phpCrawler::conf()->BASE_PATH."log/system/".date("Y-m-d")."/system.log")){
            if($this->__fileHandler){
                fclose($this->__fileHandler);
            }
            if (!$this->__fileHandler = fopen(phpCrawler::conf()->BASE_PATH."log/system/".date("Y-m-d")."/system.log", "a")) {
                phpCrawler::log()->logError("Cannot open file (".phpCrawler::conf()->BASE_PATH."log/system/".date("Y-m-d")."/system.log".")");
            } 
        }
        else if(!$this->__fileHandler){
            if (!$this->__fileHandler = fopen(phpCrawler::conf()->BASE_PATH."log/system/".date("Y-m-d")."/system.log", "a")) {
                phpCrawler::log()->logError("Cannot open file (".phpCrawler::conf()->BASE_PATH."log/system/".date("Y-m-d")."/system.log".")");
            }
        }
    }
    
    public function class_systemLog($job){
        $str = unserialize($job->workload());
        $this->_write($str);
    }
    
    public function _write($str){
        $this->_createHandler();
        if (fwrite($this->__fileHandler, $str) === FALSE) {
            phpCrawler::log()->logError("Cannot write to file (".phpCrawler::conf()->BASE_PATH."log/system/".date("Y-m-d")."/system.log".")");
            exit;
        }
    }
}


?>
