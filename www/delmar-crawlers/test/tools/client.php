<?php

/*
 * Tools client
 * @author Yuri Tkachenko <yuri@progforce.com>
 */

class tools_client {

    private $__gc;
    private $exported;
    private $deleted;

    function __construct($gc) {

        phpCrawler::load('lib/idiorm/idiorm.php');

        ORM::configure('driver_options', array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'));
        ORM::configure('mysql:host=' . phpCrawler::conf()->host . ';dbname=' . phpCrawler::conf()->dbname);
        ORM::configure('username', phpCrawler::conf()->user);
        ORM::configure('password', phpCrawler::conf()->pass);

        $this->__gc = $gc;
    }

    function import() {
        phpCrawler::log()->logInfo("Import started!");
        $sites = ORM::for_table('sitesp')->where('Site_Enabled', 1)->find_many();
        foreach ($sites as $site) {
            $this->__gc->addTask("tools_import", serialize(array("siteName" => $site->Site_Name)));
        }
        $this->__gc->runTasks();
        phpCrawler::log()->logInfo("Import finished! ");
	exec('mysqldump -u root -piRBRe6Bc --where="AD_import = 0" zvz_spain genericdatap>/tmp/1.sql');
        $this->export();
    }

    function export() {
        $this->__gc->addTask("do_replication_generic", "test", NULL, "replication_generic");
        $this->__gc->addTask("do_replication_images", "test", NULL, "replication_images");
        $this->__gc->addTask("do_replication_deleted", "test", NULL, "replication_deleted");
        $this->__gc->setCompleteCallback(array($this,"export_complete"));
        $this->__gc->runTasks();
        phpCrawler::log()->logInfo("Export finished!");
        //if ($this->exported != "") {
        //    $this->__gc->do('tools_mail', serialize(array("subject" => "Export completed!", "message" => $exported)));
        //}
    }

    function export_complete($task) {
        if ($task->unique() == "replication_generic") {
	    phpCrawler::log()->logInfo("replication_generic finished!");
            phpCrawler::log()->logInfo("Exported " . $task->data . " ADs!");
        } elseif ($task->unique() == "replication_deleted") {
            phpCrawler::log()->logInfo("replication_deleted finished!");
            phpCrawler::log()->logInfo("Exported " . $task->data . " deleted!");
        } else {
	    phpCrawler::log()->logInfo("replication_images finished!");
            phpCrawler::log()->logInfo("Exported " . $task->data . " images!");
        }
    }

    function mail() {
        $this->__gc->do('tools_mail', serialize(array("subject" => "Test!", "message" => 'For admin only!')));
    }

    function error_test() {
	phpCrawler::log()->logCrit("TEST ERROR!!!" ,'server_error');
    }

    function delete() {
        $sites = ORM::for_table('sitesp')->where('Site_Enabled', 1)->where('Site_Crawling', 0)->find_many();
        foreach ($sites as $site) {
            $this->__gc->addTask("tools_delete", serialize(array("siteName" => $site->Site_Name)));
        }
        $this->__gc->runTasks();
    }

    function dayly_report() {
        $results = ORM::for_table('stat')->
                        left_outer_join('sitesp', array('stat.OP_Site', '=', 'sitesp.Site_Id'))->
                        // SELECT
                        select('Site_Name')->
                        select('Site_Id')->
                        select_expr('SUM(`OP_New`)', 'New')->
                        select_expr('SUM(`OP_Upd`)', 'Upd')->
                        // WHERE
                        where_raw('`OP_Datetime` BETWEEN ? AND ?', array(date("Y-m-d"), date('Y-m-d', mktime(0, 0, 0, date('m'), date('d') + 1, date('Y')))))->
                        // GROUP BY
                        group_by('OP_Site')->find_many();

        $mailbody = "Here is daily report:<br><br>";
        $mailbody .= '<table cellspacing="0" cellpadding="2" border="1" width="100%"><tr><th>Site Name</th><th>New</th><th>Updated</th><th>Day Total</th><th>Avarage</th></tr>';

        $total = 0;
        $total_avarage = 0;

        $today = floatval(date("d"));
        echo $today . "\n";

        foreach ($results as $res) {

            $daily = $res->New + $res->Upd;
            $total += $daily;

            if ($today == 1) {
                $avarage = $daily;
            } else {
                $mnthly = ORM::for_table('stat')->
                        // SELECT
                        select_expr('COUNT(DISTINCT(DATE(`OP_Datetime`)))', 'total')->
                        // WHERE
                        where_raw('`OP_Datetime` BETWEEN ? AND ?', array(date("Y-m-01"), date('Y-m-d', mktime(0, 0, 0, date('m'), date('d') + 1, date('Y')))))->
                        where_raw('(`OP_New` > ? OR `OP_Upd` > ?)', array(0, 0))->
                        where('OP_Site', $res->Site_Id)->
                        find_one();

		$mnth = ORM::for_table('stat')->
                        // SELECT
                        select_expr('SUM(`OP_New`)', 'New')->
                        select_expr('SUM(`OP_Upd`)', 'Upd')->
                        // WHERE
                        where_raw('`OP_Datetime` BETWEEN ? AND ?', array(date("Y-m-01"), date('Y-m-d', mktime(0, 0, 0, date('m'), date('d') + 1, date('Y')))))->
                        where('OP_Site', $res->Site_Id)->
                        // GROUP BY
                        find_one();

                $avarage = round(($mnth->New + $mnth->Upd) / $mnthly->total);
                $total_avarage += $avarage;
		$mnthly = NULL;
            }

            $mailbody .= '<tr><td>' . $res->Site_Name . '</td><td>' . $res->New . '</td><td>' . $res->Upd . '</td><td>' . $daily . '</td><td>' . $avarage . '</td></tr>';
        }
        $mailbody .= '<tr><td colspan="3"> Total:</td><td>' . $total . '</td><td>' . $total_avarage . '</td></tr></table>';

        phpCrawler::log()->logInfo($mailbody);

        $this->__gc->do('tools_mail', serialize(array("subject" => "Daily report!", "message" => $mailbody)));
    }

}

?>

