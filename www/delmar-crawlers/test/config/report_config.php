<?php

   $crawlerConf = array();
   $crawlerConf[]= array (
        'type' => 'client',
        'method' => 'dayly_report',
        'params' => "",
        'count' => '1'
   );

   $crawlerConf[]= array (
        'type' => 'worker',
        'method' => 'mailer',
        'params' => "",
        'count' => '1'
   );
?>
