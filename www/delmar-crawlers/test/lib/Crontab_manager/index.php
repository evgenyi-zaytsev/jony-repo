<?php
    
    
    include "Crontab_manager.php";
    
    $crontab = new Crontab_manager(false);
    
    #$crontab->append_cronjob('1 * * * * /root/phpCrawler/start_yaencontre_daily_all.sh 2>&1');
    $cron_regex = '/root\/phpCrawler/';
    $crontab->remove_cronjob($cron_regex);
    
    //die();
    //$crontab = new Crontab_manager(true);
      
    $new_cronjobs = array(  
        '55 * * * * /root/phpCrawler/start_yaencontre_daily_all.sh 2>&1',
        '55 * * * * /root/phpCrawler/start_motocasion.sh 2>&1',
        '55 * * * * /root/phpCrawler/start_ventadepisos_weekly.sh 2>&1',
        '55 * * * * /root/phpCrawler/start_enalquiler_weekly.sh 2>&1'
    );  
      
    $crontab->append_cronjob($new_cronjobs);  
    die();
    $crontab = new Crontab_manager(true);  
      
    $cron_regex = '/home\/path\/to\/command\/the_command\.sh\/';  
      
    $crontab->remove_cronjob($cron_regex);  
    
    $crontab = new Crontab_manager(true);  
      
    $cron_regex = array(  
        '/0 0 1 \* \*/',  
        '/home\/path\/to\/command\/the_command\.sh\/'  
    );  
      
    $crontab->remove_cronjob($cron_regex);  
    
?>
