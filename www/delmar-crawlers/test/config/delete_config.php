<?php

   $crawlerConf = array();
   $crawlerConf[]= array (
        'type' => 'client',
        'method' => 'delete',
        'params' => "",
        'count' => '1'
   );

   $crawlerConf[]= array (
        'type' => 'dbworker',
        'method' => 'deleter',
        'params' => "",
        'count' => '1'
   );
?>
