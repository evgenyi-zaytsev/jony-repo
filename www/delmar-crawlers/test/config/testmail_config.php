<?php

   $crawlerConf = array();
   $crawlerConf[]= array (
        'type' => 'client',
        'method' => 'error_test',
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
