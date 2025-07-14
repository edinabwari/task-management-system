<?php  
$sName = "localhost";
$uName = "root";
$pass  = "";
$db_name = "task_management_db";
//For the purpose of hosting 
// $sName = "sql102.infinityfree.com"; 
// $uName = "if0_39457663";            
// $pass  = "KehkYWVVL5ou"; 
// $db_name = "if0_39457663_task_management_db"; 

try {
	$conn = new PDO("mysql:host=$sName;dbname=$db_name", $uName, $pass);
	$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
}catch(PDOException $e){
	echo "Connection failed: ". $e->getMessage();
	exit;
}