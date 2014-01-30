{{ php }}

header('Content-type: application/json');

$path_to_theme = "themes/publication_1/theme_1/";

$folders = array("_css","_js","_css/webfonts","_img");

$data = array();
$data["files"] = array();
$data["images"] = array();

if (isset($_GET["retina"]) && $_GET["retina"]==1)
{
	$retina = true;
}
else
{
	$retina = false;
}


foreach ($folders as $folder)
{
	$files = glob($path_to_theme.$folder."/*.*");
	foreach ($files as $file)
	{
		if (strstr($file,"~web"))
		{
			if (strstr($file,"@2x"))
			{
				if (!$retina) continue;
			}
			else
			{
				if ($retina) continue;
			}
		}
		
	
		$dfile = array();
		$dfile["url"] = "/".$file;
		$dfile["time"] = filemtime($file);
		if ($folder=="_img")
		{
			$data["images"][] = $dfile;
		}
		else
		{
			$data["files"][] = $dfile;
		}
	}
}

$json = json_encode($data);

$json = str_replace('\\','',$json);

echo $json; 

{{ /php }}