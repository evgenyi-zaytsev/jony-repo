<?php

/*
 * Tool for importing data from crawler to production database
 * @author Yuri Tkachenko <yuri@progforce.com>
 */

class tools_exporter {

    private $_db; // PDO ORM object

    /**
     * Class Initialization
     * @global type $host
     * @global type $user
     * @global type $pass
     * @global type $dbname 
     */

    function _init() {
        phpCrawler::load('lib/idiorm/idiorm.php');

        ORM::configure('mysql:host=' . phpCrawler::conf()->host . ';dbname=' . phpCrawler::conf()->dbname);
        ORM::configure('username', phpCrawler::conf()->user);
        ORM::configure('password', phpCrawler::conf()->pass);
        ORM::configure('id_column_overrides', array(
            'sitesp' => 'Site_Id'
        ));
    }

    public function new_export() {
        $tmp = new mssqlExport();
        $params = array();
        $params['mysql_table'] = phpCrawler::conf()->production->data;
        $params['mssql_table'] = phpCrawler::conf()->export->datatable;
        require '_mapping.php';
        $params['mssql_table'] = phpCrawler::conf()->export->datatable;
        $params['id'] = "POST_ID";
        $params['fields'] = $production_fields_types;
        $tmp->export($params);
    }

    /**
     * Main importing method
     * @global Object $production phpCrawler::conf()->production
     * @global Object $export phpCrawler::conf()->export
     * @param Object $job
     * @return String Status Message 
     */
    public function tools_export($job) {

        /**
         * Step 1. Preparing to export data
         * */
        // Mapping file include
        require '_mapping.php';

        // Getting global configs
        $production = phpCrawler::conf()->production;
        $export = phpCrawler::conf()->export;

        // Start timers
        $mtime = explode(" ", microtime());
        $starttime = $mtime[1] + $mtime[0];

        // Preparing variables
        $job = unserialize($job->workload());
        $msg = "Export started " . date('Y-m-d H:i');
        phpCrawler::log()->logInfo($msg);

        // Initializing Exporter
        $mssqlExporter = new mssqlExport();
        
        $params = array();
        $params['mysql_table'] = $production->data;
        $params['mssql_table'] = $export->datatable;
        $params['id'] = "POST_ID";
        $params['fields'] = $production_fields_types;
        
        $dataExp = $mssqlExporter->export($params);
        
        $params = array();
        $params['mysql_table'] = $production->images;
        $params['mssql_table'] = $export->imagestable;
        $params['id'] = "Id";
        $params['fields'] = $images_fields_types;
        
        $imgExp = $mssqlExporter->export($params);

        $params = array();
        $params['mysql_table'] = $production->del;
        $params['mssql_table'] = $export->deltable;
        $params['id'] = "Id";
        $params['fields'] = $delete_fields_types;
        
        $delExp = $mssqlExporter->export($params);

        /**
         * Step 6. Email generation
         */
        // Count imported sites
        $sites = ORM::for_table('sitesp')->where('Site_Imported', 1)->find_many();
        $about = "";
        foreach ($sites as $site) {
            $about .= $site->Site_Name . ", ";
            $site->Site_Imported = 0;
            $site->save();
        }
        $about = substr($about, 0, -2);
        $siteNum = count($sites);

        // Count production sites
        $sites = ORM::for_table('sitesp')->where('Site_Enabled', 1)->find_many();
        $about2 = "";
        foreach ($sites as $site) {
            $about2 .= $site->Site_Name . ", ";
        }
        $about2 = substr($about2, 0, -2);
        $siteNum2 = count($sites);

        // Timer stop
        $mtime = explode(" ", microtime());
        $endtime = $mtime[1] + $mtime[0];
        $totaltime = $this->sec2hms(round($endtime - $starttime, 0));

        $delmessage = "";
        if ($delExp != 0) {
            $delmessage = "Also exported $delExp deleted ADs.<br><br>";
        }

        // Email body
        $str = "Exported $dataExp ADs from $siteNum sites: $about! <br>This export took $totaltime!<br><br>$delmessage" .
                "<small style=\"color: #666;\">There are $siteNum2 sites in production now: $about2. If they are not listed above they are collecting data right now.</small>";
        phpCrawler::log()->logInfo($str);

        unset($job, $crawler_filds, $production_fields, $images_fields, $production, $export, $mtime, $starttime, $exportUnic, $dataFile, $imagesFile, $dataImport, $imagesImport, $field, $dataExp, $imgExp, $sql, $conn_id, $uploadOK, $uploadError, $upload, $dbhandle, $selected, $result, $endtime, $totaltime);

        $msg .= "\n" . $str;
        return $msg;
    }

    private function sec2hms($sec, $padHours = false) {
        $hms = "";
        $hours = intval(intval($sec) / 3600);
        $hms .= ( $padHours) ? str_pad($hours, 2, "0", STR_PAD_LEFT) . ":" : $hours . ":";
        $minutes = intval(($sec / 60) % 60);
        $hms .= str_pad($minutes, 2, "0", STR_PAD_LEFT) . ":";
        $seconds = intval($sec % 60);
        $hms .= str_pad($seconds, 2, "0", STR_PAD_LEFT);
        return $hms;
    }

    private function db_query($sql) {
        try {
            $this->_db->beginTransaction();
            $this->_db->exec($sql);
            $this->_db->commit();
            phpCrawler::log()->logInfo("Transaction successful!\n\nSQL: $sql");
        } catch (Exception $e) {
            phpCrawler::log()->logError("Transaction rolled back!\n\nSQL: $sql \n\nMSG: $e");
            $this->_db->rollback();
        }
    }

}

?>
