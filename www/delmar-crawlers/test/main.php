<?php

date_default_timezone_set('Europe/Moscow');

if (false == gc_enabled()) {
    gc_enable();
}

error_reporting(E_ALL);
ini_set('display_errors','On');

$BASE_PATH = __DIR__ . "/";
require $BASE_PATH . 'class/phpCrawler.php';
require $BASE_PATH . 'class/Config.php';
require $BASE_PATH . 'config/config.php';

phpCrawler::conf()->set($config);

phpCrawler::conf()->add("BASE_PATH", __DIR__ . "/");

spl_autoload_register('phpCrawler::autoload');

register_shutdown_function('phpCrawler::shutdown');

//set_error_handler('phpCrawler::shutdown');


phpCrawler::load(array(
    'lib/simpletest/browser.php',
    'lib/simplehtmldom/simple_html_dom.php'
));

function help() {
    $str = "Help phpCrawler \n";
    $str.= "\t -t  - type  example : worker, client, dbworker \n";
    $str.= "\t -m  - method  example : paging, crawler, writeData etc.. \n";
    $str.= "\t -n  - site name example : Fotocasa etc.. \n";
    $str.= "\t -p  - arguments example: Fotocasa_Temp_Ads \n";
    $str.= "\t -h  - help print with text \n";
    print $str;
    //die();
}

$arguments = getopt("t:m:n:hp:c:");

$gearmanClass = null;
$method = null;
$name = null;
$args = null;
$confFile = null;

foreach ($arguments as $key => $value) {
    switch ($key) {
        case "t":
            $cname = $value . "Gearman";
            $gearmanClass = new $cname();
            phpCrawler::conf()->add('cname', $cname);
            break;
        case "m":
            $method = $value;
            phpCrawler::conf()->add('method', $value);
            break;
        case "n":
            $name = $value;
            echo "\n Name ->".$name;
            phpCrawler::conf()->add('name', $value);
            break;
        case "h":
            help();
            break;
        case "p":
            $args = $value;
            phpCrawler::conf()->add('args', $value);
            break;
        case "c":
            $confFile = $value;
            echo "\n Config ->".$confFile;
            phpCrawler::conf()->add('confFile', $value);
            break;
        default :
            $workerClass = null;
    }
}

if ($confFile && $name) {
    $file = phpCrawler::startConf()->parseConf($confFile, $name);
    if ($file) {
        exec("nohup /bin/bash $file &");
    }

    die();
}

if ($gearmanClass != null && $method != null) {
    clientSendData::getInstance()->init(phpCrawler::conf()->serverIP, phpCrawler::conf()->serverPort);
    $gearmanClass->init(phpCrawler::conf()->serverIP, phpCrawler::conf()->serverPort);
    $gearmanClass->work($method, $name, $args);
}
?>
