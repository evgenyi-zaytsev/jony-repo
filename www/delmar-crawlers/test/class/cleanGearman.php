<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Description of gearmanWorker
 *
 * @author progforce
 */
class cleanGearman {

    private $__gw;

    function init($ip, $port){
        $this->__gw = new GearmanWorker();
        $this->__gw->addOptions(GEARMAN_WORKER_NON_BLOCKING);
        $this->__gw->addServer($ip,$port);
    }

    function register($method, $name){
        $cname  = $name."_".$method;
        $this->__fw = new $cname();
        $methods = get_class_methods($this->__fw);
        foreach($methods as $method){
            if($method[0] != "_"){
                $this->__gw->addFunction($method, array($this, $method));
            }
        }
    }

    function work($method, $name){
        $this->register($method,$name);
        while(true){
        
            if(@$this->__gw->work() || $this->__gw->returnCode() == GEARMAN_IO_WAIT ) {

                if ($this->__gw->returnCode() == GEARMAN_SUCCESS) continue;

                if (!@$this->__gw->wait()){
                    if ($this->__gw->returnCode() == GEARMAN_NO_ACTIVE_FDS){
                        sleep(5);
                    }
                }
            }
            else if($this->__gw->returnCode() == GEARMAN_NO_JOBS){
                break;
            }
            
        }
        echo "end";
        $this->__gw->unregisterAll();
    }
    
    function __call($name, $arguments){
        echo "clean ".$name."\n";
    }
}
?>
