<?php

class mssqlExport {

    private $dbhandle;
    private $conf;
    private $mysql_db;
    private $params;
    private $trans;

    function __construct() {

        phpCrawler::load('lib/idiorm/idiorm.php');

        ORM::configure('mysql:host=' . phpCrawler::conf()->host . ';dbname=' . phpCrawler::conf()->dbname);
        ORM::configure('username', phpCrawler::conf()->user);
        ORM::configure('password', phpCrawler::conf()->pass);
        ORM::configure('id_column_overrides', array(
            'sitesp' => 'Site_Id',
            'POST_ID' => phpCrawler::conf()->production->data
        ));
        include('adodb.inc.php');
        $this->mysql_db = ORM::get_db();
        //$this->dbhandle = new PDO("sybase:host=".phpCrawler::conf()->export->server.";dbname=".phpCrawler::conf()->export->db , phpCrawler::conf()->export->user , phpCrawler::conf()->export->pass); 
        $this->dbhandle = NewADOConnection('mssql'); 
        $this->dbhandle->Connect(phpCrawler::conf()->export->server, phpCrawler::conf()->export->user, phpCrawler::conf()->export->pass, phpCrawler::conf()->export->db);
    }

    function export($params) {

        $min = ORM::for_table($params['mysql_table'])->select($params['id'])->where('AD_import', 0)->order_by_asc($params['id'])->limit(1)->find_one();
        if (!$min)
            return 0;
        $min = $min->$params['id'];
        $max = $min + phpCrawler::conf()->export->sqlCount;
        $lines = ORM::for_table($params['mysql_table'])->where_raw("`AD_import` = 0 AND `" . $params['id'] . "` >= $min AND `" . $params['id'] . "` < $max")->order_by_asc($params['id'])->find_many();
        phpCrawler::log()->logInfo("START EXPORT " . $params['mysql_table']);
        $count = 0;

        while (!empty($lines)) {
            phpCrawler::log()->logInfo("try export " . count($lines));
            $this->db_query("BEGIN TRANSACTION");
            $this->trans = 1;
            $mainsql = "";
            foreach ($lines as $line) {
                $sql = "INSERT INTO " . phpCrawler::conf()->export->db . ".dbo." . $params['mssql_table'] ." ( ".implode(", ",array_keys($params['fields'])). " ) \n VALUES ( ";
                foreach ($params['fields'] as $field => $type) {
                    $val = $line->$field;
                    if ($type == "text" && $line->$field != "NULL") {
                        $val = "'" . str_replace("'", "''", $line->$field) . "'";
                    } else if ($type == "datetime") {
                        $val = "NULL";
                        if ($line->$field != '0000-00-00 00:00:00') {
                            $val = "CONVERT(datetime,'" . $line->$field . "',20)";
                        }
                    } else if ($line->$field == "") {
                        $val = "NULL";
                    }
                    $sql.= $val . ",";
                }
                
                $sql = rtrim($sql, ",") . ");";
                $mainsql .= $sql;
            }
            phpCrawler::log()->logInfo("start exec");
            $this->db_query($sql);
            phpCrawler::log()->logInfo("exec finished!");
            $this->db_query("COMMIT TRANSACTION");
            phpCrawler::log()->logInfo("export complite " . count($lines));
            $this->trans = 0;
            $this->mysql_db->exec("UPDATE " . $params['mysql_table'] . " SET `AD_import` = 4 WHERE `" . $params['id'] . "` >= $min AND `" . $params['id'] . "` < $max");
            $count+= count($lines);
            $min = $max;
            $max = $min + phpCrawler::conf()->export->sqlCount;

            phpCrawler::log()->logInfo("now exporting " . $count);
            $lines = ORM::for_table($params['mysql_table'])->where_raw("`AD_import` = 0 AND `" . $params['id'] . "` >= $min AND `" . $params['id'] . "` < $max")->order_by_asc($params['id'])->find_many();
        }
        phpCrawler::log()->logInfo("TOTAL EXPORT " . $count);
        phpCrawler::log()->logInfo("FINISH EXPORT " . $params['mysql_table']);

        return $count;
    }

    function db_query($sql) {
        try {
            phpCrawler::conf()->trace["sql"] = $sql;
            $ok = $this->dbhandle->Execute("update atable set aval = 0");
            if (!$ok){ 
                   phpCrawler::log()->logInfo($this->dbhandle->ErrorMsg());
                   phpCrawler::log()->logInfo($sql);
                   
                   $this->dbhandle->Execute("ROLLBACK TRANSACTION;");
            }
            //$STH = $this->dbhandle->prepare($sql);  
            //$STH->execute();
        } catch (Exception $e) {
            print_r($e);
            if ($this->trans) {
                $this->dbhandle->Execute("ROLLBACK TRANSACTION;");
                phpCrawler::log()->logInfo($e->getMessage());
                
//                $STH = $this->dbhandle->prepare("ROLLBACK TRANSACTION;");  
//                $STH->execute();
            }
        }
    }

}

?>
