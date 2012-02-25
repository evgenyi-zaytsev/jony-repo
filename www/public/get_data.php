<?php 

$link = mysql_connect('dev.progforce.com:3306', 'delmar', 'mrVzQzjm7RaqsyVG');
if (!$link) {
    die('Could not connect: ' . mysql_error());
}
//echo 'Connected successfully';

$db_name = "delmar_db";
mysql_select_db($db_name) or die("Could not select database " . $db_name);

$rows = array();

$start_row = 0;
$row_count = 10;

if ($_GET['query'] == 'new') {
	$sql = " SELECT a1.AD_KEY, 
					a1.AD_Link,
					a1.AD_Price AS NewPrice, 
					a1.name, 
					img.ImagePath, 
					a1.AD_Price AS OldPrice -- , a2.AD_KEY null_key
			 FROM Overstock_Temp_Ads a1
			 LEFT JOIN Overstock_Temp_Ads a2
			 	ON (a1.AD_KEY = a2.AD_KEY AND a2.AD_PostDate < '2012-02-24')
			 LEFT JOIN Overstock_Images img
			 	ON (a1.POST_ID = img.AD_id)
			 WHERE a1.AD_PostDate >= '2012-02-24'
			   AND a2.AD_KEY IS NULL 
			 GROUP BY a1.AD_KEY 
			 Limit " . $start_row . "," . $row_count;
} elseif ($_GET['query'] == 'removed') {
	$sql = " SELECT a1.AD_KEY,
					a1.AD_Link,
					a1.AD_Price AS NewPrice, 
					a1.name, 
					img.ImagePath, 
					a1.AD_Price AS OldPrice -- , a2.AD_KEY null_key
			 FROM Overstock_Temp_Ads a1
			 LEFT JOIN Overstock_Temp_Ads a2
			 	ON (a1.AD_KEY = a2.AD_KEY AND a2.AD_PostDate >= '2012-02-24')
			 LEFT JOIN Overstock_Images img
				ON (a1.POST_ID = img.AD_id)
			 WHERE a1.AD_PostDate < '2012-02-24'
			   AND a2.AD_KEY IS NULL 
			 GROUP BY a1.AD_KEY 
			 Limit " . $start_row . "," . $row_count;

} elseif ($_GET['query'] == 'changed') {
	$sql = " SELECT a1.POST_ID,
					a1.AD_KEY,
					a1.AD_Link,
					a1.AD_Price AS NewPrice, 
					a1.name, 
					-- img.ImagePath, 
					a2.AD_Price AS OldPrice -- , a2.AD_KEY null_key
			 FROM Overstock_Temp_Ads a1
			 LEFT JOIN Overstock_Temp_Ads a2
			 	ON (a1.AD_KEY = a2.AD_KEY AND a2.AD_PostDate >= '2012-02-24')
			-- LEFT JOIN Overstock_Images img
			--	ON (a1.POST_ID = img.AD_id)
			 WHERE a1.AD_PostDate < '2012-02-24'
			-- GROUP BY a1.AD_KEY 
			 Limit " . $start_row . "," . $row_count;
	$sql = "SELECT a1.*, img.ImagePath 
			FROM Overstock_Images img 
			LEFT JOIN (" . $sql . ") a1 
			ON (a1.POST_ID = img.AD_id)
			GROUP BY a1.AD_KEY ";
			// Limit " . $start_row . "," . $row_count;
} else {
	echo '{"success": false, "msg" : "Bad Request" }';
	mysql_close($link);
	exit;
}

$result = mysql_query($sql);

if (!$result) {
	echo '{"success": false, "msg" : ' . mysql_error() . ' }';
}

while($row = mysql_fetch_assoc($result)) {
	$rows[] = $row;
}

echo json_encode(array('data' => $rows));

mysql_close($link);

?>
