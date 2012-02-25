<?php

/*
 * Tool for finding deleted ADs in database
 * @author Yuri Tkachenko <yuri@progforce.com>
 */

class tools_deleter {

    private $_db; // PDO ORM object
    private $_siteId;
    private $_linksAll;

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

    /**
     * Main importing method
     * @global Object $production
     * @param Object $job
     * @return String Status Message 
     */
    public function tools_delete($job) {

        $production = phpCrawler::conf()->production;

        $mtime = explode(" ", microtime());
        $starttime = $mtime[1] + $mtime[0];

        // Preparing parameters
        $job = unserialize($job->workload());
        $this->_linksAll = $job['siteName'] . '_Links_All';

        $siteInfo = ORM::for_table($production->sites)->where('Site_Name', $job['siteName'])->find_one();
        $this->_siteId = $siteInfo->Site_Id;

        $this->_db = ORM::get_db();

        $beforeIns = ORM::for_table($production->del)->count();
        $allPagingCount = ORM::for_table($this->_linksAll)->count();

        if ($allPagingCount > 0) {

            $sql = "CALL " . phpCrawler::conf()->dbname . ".delete('" . $job['siteName'] . "', $this->_siteId )";

            phpCrawler::log()->logInfo($sql);
            $this->db_query($sql);

            $sql = "UPDATE $production->data SET AD_import = 3 WHERE $production->data.AD_md5 IN ( ";
            $sql .= "SELECT $production->del.AD_md5 FROM $production->del WHERE SiteId = $this->_siteId AND AD_import != 4 );";

            phpCrawler::log()->logInfo($sql);
            $this->db_query($sql);
        } else {
            phpCrawler::log()->logInfo("Paging table is empty! Do nothing!");
            return "";
        }

        $afterIns = ORM::for_table($production->del)->count();
        $deleted = $afterIns - $beforeIns;

        $mtime = explode(" ", microtime());
        $endtime = $mtime[1] + $mtime[0];
        $totaltime = $this->sec2hms(round($endtime - $starttime, 0));

        $str = "Was marked as deleted: $deleted ADs!";
        phpCrawler::log()->logInfo($str);

        return $str;
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
