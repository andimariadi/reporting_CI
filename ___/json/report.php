<?php
require '../system/system.php';
$db = new crud();

if (isset($_GET['y']) AND isset($_GET['id'])) {
	$year = $_GET['y'];
  $id = $_GET['id'];
	$query = "SELECT MONTH(`date`) as `month`, `date` FROM `reportingjob` WHERE year(`date`)='{$year}' AND `id_device`='{$id}' GROUP BY month(`date`) ORDER BY month(`date`) ASC";
} elseif ($_GET['id']) {
	$id = $_GET['id'];
	$query = "SELECT YEAR(`date`) as `year` FROM `reportingjob` WHERE `id_device`='{$id}' GROUP BY year(`date`) ORDER BY year(`date`) ASC";
} else {
  $query = "SELECT YEAR(`date`) as `year` FROM `reportingjob` GROUP BY year(`date`) ORDER BY year(`date`) ASC";
}

$hasil = mysqli_query($db->connection, $query);
if(mysqli_num_rows($hasil) > 0 ){
  $response = array();
  $response["data"] = array();
  while($x = mysqli_fetch_array($hasil)){
  	if (isset($_GET['y'])) {
  		$h['month'] = $x["month"];
      $h['tmonth'] = date('F', strtotime($x["date"]));
  	} else {
  		$h['year'] = $x["year"];
  	}
    
    array_push($response["data"], $h);
  }
}else {
  $response["data"]="empty";  
}
echo json_encode($response);
?>