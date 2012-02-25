<?php

    include "GearmanTelnet.php";
//
//    $telnet = new GearmanTelnet("127.0.0.1", 4730);
//    echo "<pre>GearmanTelnet<br/>";
//    echo "Status <br/>";
//    print_r($telnet->getStatus());
//    echo "Workers <br/>";
//    print_r($telnet->getWorkers());
    
    $telnet = new GearmanHost("127.0.0.1", 4730);
    #print_r($telnet->getJobs());
    $jobs = $telnet->getJobs();
    
#echo ("\n".$jobs['loadYaencontrePage']['TOTAL'])."\n";
print_r($jobs);
    
?>
