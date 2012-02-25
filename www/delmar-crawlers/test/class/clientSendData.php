<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of clientSendData
 *
 * @author progforce
 */
class clientSendData {

    protected $__gc;

    protected static $instance;  // object instance

    private function __construct() {  }
    private function __clone() {  }

    public static function getInstance() {
        return (self::$instance === null) ?
               self::$instance = new self() :
               self::$instance;
    }

    function init($ip,$port){
        $this->__gc = new GearmanClient();
        $this->__gc->addServer($ip,$port);
    }

    function send($name,$data){
        $this->__gc->doBackground($name, serialize($data));
    }

    function sendWait($name,$data){
        return $this->__gc->do($name, serialize($data));
    }
}
?>
