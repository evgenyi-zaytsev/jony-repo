<?php

/*
 * Tool for importing data from crawler to production database
 * @author Yuri Tkachenko <yuri@progforce.com>
 */

class tools_mailer {

    public function tools_mail($job) {

        $job = unserialize($job->workload());

        $subject = $job['subject'] == "" ? "ZVZ-Spain Crawler System Notify" : $job['subject'];
        $toadmin = $job['toadmin'] == true ? true : false;

	if ($toadmin) {
		$pretext = "There was an error listed below:";
		$mailers = phpCrawler::conf()->adminmail;
	} else {
		$pretext = "We have some good news listed below:";
		$mailers = phpCrawler::conf()->mail;
	}

        $message = '<html><body><table style="width: 100%;">
                    <tr><td><div style="text-align: right;"><img src="http://www.progforce.com/sites/default/files/progforce_logo.jpg"></div></td></tr>
                    <tr><td><div style="font: 14px Helvetica, Arial;">
                    Hi!<br>'
		    . $pretext . 
		    '<br><br>'
                    . $job['message'] .
                    '<br><br></div></td></tr>
                    <tr><td><div style="text-align: left; font: 14px Helvetica, Arial;">Thanks,<br><span style="color: #666;">Progforce Russia, ZVZ Team</span></div></td></tr>
                    </table></body></html>';

        $headers = 'From: zvz-spain@progforce.com' . "\r\n";
        $headers .= "MIME-Version: 1.0\r\n";
        $headers .= "Content-Type: text/html; charset=ISO-8859-1\r\n";

	if ($toadmin) { $mailers = phpCrawler::conf()->adminmail; }
	else { $mailers = phpCrawler::conf()->mail; }

        foreach ($mailers as $address) {
    		mail($address, $subject, $message, $headers);
		$sentto .= $address . ", ";
       	}

        phpCrawler::log()->logInfo("SENT: $subject");
        phpCrawler::log()->logInfo("TO: " . join(", ", $mailers));
        phpCrawler::log()->logInfo("MESSAGE: \n\n" . $job['message']);
    }

}

?>
