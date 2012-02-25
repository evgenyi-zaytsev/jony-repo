<?php

   $crawlerConf = array();
   $crawlerConf[]= array (
        'type' => 'client',
        'method' => 'import',
        'params' => "",
        'count' => '1'
   );
   
   $crawlerConf[]= array (
        'type' => 'dbworker',
        'method' => 'importer',
        'params' => "",
        'count' => '1'
   );
   
   $crawlerConf[]= array (
        'type' => 'worker',
        'method' => 'mailer',
        'params' => "",
        'count' => '1'
   );
   
   $crawlerConf[]= array (
        'type' => 'dbworker',
        'method' => 'exporter',
        'params' => "",
        'count' => '1'
   );
   
?>
