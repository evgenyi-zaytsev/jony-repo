<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of germanClient
 *
 * @author progforce
 */
class toolsGearman {

    private $__gc;
    private $name;
    private $__class;


    function init($ip, $port){
        $this->__gc = new GearmanClient();
        $this->__gc->addServer($ip,$port);
    }

    function work($method, $name, $param){
        $this->name = $name;
        $classname = "tools_".$name;
        $this->__class = new $classname($this->__gc);
        $this->__class->$method($param);
    }
}
?>
