<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of phpCrawler
 *
 * @author felix
 */
class phpCrawler {

    protected static $_conf;
    protected static $_log;
    protected static $_startConf;

    public static function conf() {
        if (self::$_conf === NULL) {
            self::$_conf = new Config;
        }
        return self::$_conf;
    }

    public static function startConf() {
        if (self::$_startConf === NULL) {
            self::$_startConf = new startConf;
        }
        return self::$_startConf;
    }

    public static function load($path) {
        if (is_array($path)) {
            foreach ($path as $p) {
                self::inc($p);
            }
        } else {
            self::inc($path);
        }
    }

    protected static function inc($path) {
        if (file_exists($path)) {
            include_once($path);
        } else if (file_exists(self::conf()->BASE_PATH . $path)) {
            include_once(self::conf()->BASE_PATH . $path);
        } else {
            die("File does not exist " . $path . " !");
        }
    }

    public static function log() {
        if (self::$_log === NULL) {
            self::$_log = new Logger;
        }
        return self::$_log;
    }

    public static function autoload($class) {
        if (strstr($class, "_") != false) {
            $class = str_replace("_", "/", $class);
        }

        foreach (phpCrawler::conf()->autoload as $path) {
            if (file_exists(phpCrawler::conf()->BASE_PATH . $path . $class . ".php")) {
                include_once(phpCrawler::conf()->BASE_PATH . $path . $class . ".php");
            }
        }
    }

    public static function shutdown($errno = "", $errstr = "", $errfile = "", $errline = "") {
    
        $isError = false;
        
        if ($error = error_get_last()) {
            switch ($error['type']) {
                case E_ERROR:
                case E_CORE_ERROR:
                case E_COMPILE_ERROR:
                case E_USER_WARNING:
                case E_USER_ERROR:
                    $isError = true;
                    break;
            }
        }
        if ($isError) {

            $str = "Type - " . $error['type'] . " | " . "Message - " . $error['message'] . " | " . "File - " . $error['file'] . " | " . "Line - " . $error['line'];

            if (isset(phpCrawler::conf()->trace)) {
                if (!empty(phpCrawler::conf()->trace)) {
                    $trace = PHP_EOL . "Trace = " . print_r(phpCrawler::conf()->trace, true);
                    $str.=$trace;
                }
            }

            phpCrawler::log()->logEmerg($str);
        }
    }

}

?>
