<?php

/**
 * Description of startConf
 *
 * @author felix
 */
class startConf {
    
    public function parseConf($file, $name){
        $BASE_PATH = phpCrawler::conf()->BASE_PATH;

	// --TO DO REMOVE

        if (file_exists($BASE_PATH."log/Overstock")) {
            delete_directory($BASE_PATH."log/Overstock");
            //mk_dir($BASE_PATH."log/Overstock");
        }
        // ------------------------------------

        $date = date("Y-m-d");
        $time = date("H-i");
        if (file_exists($file)) {
            include_once($file);
        }
        else if(file_exists($BASE_PATH.$file)) {
            include_once($BASE_PATH.$file);
        }
        else if(file_exists($BASE_PATH."crawlers/".$name."/".$file)){
            include_once($BASE_PATH."crawlers/".$name."/".$file);
        }
        else {
            die("Config file not exist!".PHP_EOL);
        }
        
        $fh = fopen("/tmp/start_".$name.".sh", "w");
        fwrite($fh, "#!/bin/bash".PHP_EOL);
        fwrite($fh, "cd ".$BASE_PATH.PHP_EOL);
        foreach($crawlerConf as $conf){
            $str = "";
            $str = "nohup php ".$BASE_PATH."main.php -t ".$conf['type']." -m ".$conf['method']." -n ".$name;
            if(isset($conf['params'])){
                if($conf['params']!= ""){
                    $str.= " -p '".$conf['params']."'";
                }
            }
            if(isset($conf['count'])){
                if($conf['count']==0 || $conf['count']==""){
                    $conf['count'] = 1;
                }
            }
            else{
                $conf['count'] = 1;
            }


            for($i = 0; $i<$conf['count']; $i++ ){
                $index = $i == 0? "": $i;
                $postfix = "";
                if(isset($conf['logpath'])){
                    if($conf['logpath']==""){
                        $postfix = " &> /dev/null";
                    }
                    else{
                        $postfix.= " &>> '".$conf['logpath'].$index.".log'";
                    }
                }
                else {
                    //$str.= " &> /dev/null";
                    if (!file_exists($BASE_PATH."log/".$name)){
                        mkdir($BASE_PATH."log/".$name, 0777);
                    }
                    if(!file_exists($BASE_PATH."log/".$name."/".$date)){
                        mkdir($BASE_PATH."log/".$name."/".$date, 0777);
                    }
                    $postfix.= " &>> ".$BASE_PATH."log/".$name."/".$date."/".$conf['type']."_".$conf['method'].$index.".log";
                }
               $com =  $str.$postfix." &".PHP_EOL;
               fwrite($fh, $com);
            }
        }
        fwrite($fh,"echo finish".PHP_EOL);
        fclose($fh);
        return "/tmp/start_".$name.".sh";
    }
    
    public function checkCrawler($name){
        $telnet = new GearmanHost(phpCrawler::conf()->serverIP, phpCrawler::conf()->serverPort);
        $status = 0;
        $jobs = $telnet->getJobs();
        $jobs_name = array_keys($jobs);
        $site_jobs = preg_grep("/".$name."/",$jobs_name);
        foreach($site_jobs as $site_job){
            if($jobs[$site_job]['TOTAL'] == 0 && $jobs[$site_job]['RUNNING'] == 0){
                $status = 0;
            }
            else{
                $status = 1;
                break;
            }
        }
        if($status){
            phpCrawler::log()->logInfo("Site ".$name." not start");
        }
        else {
            phpCrawler::log()->logInfo("Site ".$name." start");
        }
        return $status;
        
    }
}

function delete_directory($dirname) {
   if (is_dir($dirname))
      $dir_handle = opendir($dirname);
   if (!$dir_handle)
      return false;
   while($file = readdir($dir_handle)) {
      if ($file != "." && $file != "..") {
         if (!is_dir($dirname."/".$file))
            unlink($dirname."/".$file);
         else
            delete_directory($dirname.'/'.$file);    
      }
   }
   closedir($dir_handle);
   rmdir($dirname);
   return true;
}

?>
