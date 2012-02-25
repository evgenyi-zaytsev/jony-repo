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
class workerGearman {

    private $__class;
    private $__gw;
    private $stop_work;
    
    function init($ip, $port){
        $this->__gw = new GearmanWorker();
        $this->__gw->addOptions(GEARMAN_WORKER_NON_BLOCKING); 
        $this->__gw->addServer($ip,$port);
        $this->__gc = clientSendData::getInstance();
        //$this->__gc->init($ip,$port);
    }

    function register($method, $name, $param){
        $cname = $name."_".$method;
        $this->__class = new $cname($param);
        $methods = get_class_methods($this->__class);
        foreach($methods as $method){
            if($method[0] != "_"){
                $this->__gw->addFunction($method, array($this->__class, $method));
            }
        }
        $this->__gw->addFunction($name."_stop_worker", array($this, "stop"));
        
    }

    function work($method, $name,$param){
        $this->register($method, $name,$param);
        $this->stop_work = false;
        while(!$this->stop_work){

            if(@$this->__gw->work() ||
               $this->__gw->returnCode() == GEARMAN_IO_WAIT ||
               $this->__gw->returnCode() == GEARMAN_NO_JOBS) {

                if ($this->__gw->returnCode() == GEARMAN_SUCCESS) continue;

                if (!@$this->__gw->wait()){
                    if ($this->__gw->returnCode() == GEARMAN_NO_ACTIVE_FDS){
                        sleep(5);
                    }
                }
                gc_collect_cycles();
            }

        }
        echo "end";
        $this->__gw->unregisterAll();
    }
    
    function stop($job){
        $this->stop_work = true;
    }
}

?>
