<?php

   $crawlerConf = array();
   $crawlerConf[]= array (
        'type' => 'client',
        'method' => 'paging',
        'params' => "",
        'count' => '1'
   );
   $crawlerConf[]= array (
        'type' => 'worker',
        'method' => 'paging',
        'params' => "",
        'count' => '5'
   );
   
   $crawlerConf[]= array (
        'type' => 'dbworker',
        'method' => 'paging',
        'params' => "",
        'count' => '1'
   );

?>
