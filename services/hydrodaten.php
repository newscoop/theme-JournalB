<?php

// remote URL to proxy
$url = 'http://www.hydrodaten.admin.ch/lhg/SMS.xml';

// cache file
$file = "hydrodaten.xml";

// cache timeout in minutes
$ttl = 1000; // 1 day = 1440 minutes

// refresh the cache
if (!is_file($file) || filemtime($file)<time()-$ttl * 60)
{
  $ch = curl_init($url);
  $fp = fopen($file, "w");
  curl_setopt($ch, CURLOPT_FILE, $fp);
  curl_setopt($ch, CURLOPT_HEADER, 0);
  curl_exec($ch);
  curl_close($ch);
  fflush($fp);
  fclose($fp);
}

$exp_gmt = gmdate("D, d M Y H:i:s", time() + $ttl * 60) ." GMT";
$mod_gmt = gmdate("D, d M Y H:i:s", filemtime($file)) ." GMT";
header("Expires: " . $exp_gmt);
header("Last-Modified: " . $mod_gmt);
header("Cache-Control: public, max-age=" . $ttl * 60);
// for MSIE 5
header("Cache-Control: pre-check=" . $ttl * 60, FALSE);  
header('Content-type: application/json');

// push the entire cache out

//readfile($file);


// push out only relevant lines

ini_set("auto_detect_line_endings", true);
$handle = @fopen($file, "r");
$started = false;
$finished = false;
if ($handle) {
    while (!$finished && ($buffer = fgets($handle)) !== false) {
    	if (strpos($buffer, '<MesPar DH="HBCHa" StrNr="2135" Typ="03" Var="00">') > 0) {
	    	$started = true;
    	}
    	if ($started) {
	        if (preg_match("/<Wert dt=\"-24h\">([.0-9]+)<\/Wert>/",$buffer,$matches))
			{
				$temp = round($matches[1]*10)/10;
				echo '{"temperature": "'.$temp.'"}';
			}
	    }
	    if ($started && strpos($buffer, '</MesPar>') > 0) {
    		$started = false; $finished = true;
    	}
    }
    fclose($handle);
}

?>