<?php
$config['autoload'] = array(
    'class/',
    'crawlers/',
    'tools/',
    ''
);
$config['logpath'] = "log/log";
$config['systemLog'] = true;
$config['systemLogLevel'] = 3;
$config['serverIP'] = "127.0.0.1";
$config['serverPort'] = "4730";

/* database configuration */

$config['user'] = 'delmar';
$config['pass'] = 'mrVzQzjm7RaqsyVG';
$config['host'] = 'localhost';
$config['dbname'] = 'delmar_db';

$config['killCount']  = 2;

/* The Onion Router */
$config['tor'] = 'false';

$config["target_date"] = '2011-04-27';

$config['production'] = (object) array(
            'sites' => 'sitesp',
            'data' => 'genericdatap',
            'images' => 'imagesp',
            'del' => 'deletedidsadsp'
);

$config['export'] = (object) array(
            'server' => "62.219.199.57",
            'user' => "progforce",
            'pass' => "progforce",
            'db' => "Spain",
            'datatable' => "GenericDataP",
            'imagestable' => "ImagesP",
            'deletetable' => "DeletedIdsAdsP",
            'sqlCount' => 100,
            'ftp' => (object) array(
                'host' => '62.219.199.57',
                'usr' => 'progforce',
                'pwd' => 'Kv63jMOT'
            )
);

$config['adminmail'] = array(
    'Svetlana Melnikova <svetlana@progforce.com>',
    'Marya Dembaschenko <marya.esipenko@progforce.com>'
);

$config['mail'] = array(
    'Boris Oberstein <boris@progforce.com>',
    'Sergey Shestakov <shs@progforce.com>',
    'Yuri Tkachenko <yuri@progforce.com>',
    'Itzik Lerner <itzik@progforce.com>',
    'Svetlana Melnikova <svetlana@progforce.com>',
    'Oleg Shulman <oleg@progforce.com>',
    'Marya Dembaschenko <marya.esipenko@progforce.com>'
);

$config['crawlerLogType'] = array(
    "not_availiable" => "Site is not availiable ",
    "not_found" => "Page is not found: Server Error 404 ",
    "server_error" => "Server Error 500 ",
    "banned_403" => "Site is banned (Error: 403) ",
    "banned" => "Site is banned ",
    "some_server_error" => "Some Server Error",
    "connect_db_failed" => "Connection to database failed",
    "db_error" => "Database error",
    "ftp_connect_error" => "FTP connect error",
    "ftp_upload_error" => "FTP upload error",
    "no_data_found" => "No data found on advertisement page",
    "no_result_on_search" => "No results for this search criteria",
    "field_not_found" => "Field is not found on advertisement page",
    "crawler_workflow_error" => "Crawler workflow error"
);

$config['PropertyType'] = array(
    "duplex" ,
    "dúplex",
    "loft" ,
    "estudio",
    "casita" ,
    "cabaña",
    "chalet" ,
    "villa",
    "apartamento",
    "piso",
    "pisos",
    "casa",
    "oficina",
    "oficinas",
    "habitacion",
    "habitación",
    "residencia",
    "despachos",
    "terreno",
    "terrenos",
    "vivienda",
    "viviendas",
    "obra nueva",
    "pisazo",
    "vacacional",
    "vacacionales",
    "solar",
    "finca",
    "parcela",
    "comercial",
    "adosado",

    "garajes",
    "garaje",
    "trastero",
    "trasteros",
    "parking",
    "aparcamiento",
    "bar",
    "plaza",
    "ático",
    "atico"
);
?>

