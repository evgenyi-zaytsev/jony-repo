<?php
$crawlerConf = array();
$crawlerConf[] = array (
    'type'      => 'client',
    'method'    => 'start',
    'params'    => "",
    'count'     => '1'
);

$crawlerConf[] = array (
    'type'      => 'worker',
    'method'    => 'paging',
    'params'    => "",
    'count'     => '1'
);

$crawlerConf[] = array (
    'type'      => 'worker',
    'method'    => 'crawler',
    'params'    => "",
    'count'     => '1'
);

$crawlerConf[] = array (
    'type'      => 'dbworker',
    'method'    => 'writePaging',
    'params'    => "",
    'count'     => '1'
);

$crawlerConf[] = array (
    'type'      => 'dbworker',
    'method'    => 'writeData',
    'params'    => "",
    'count'     => '1'
);
?>
