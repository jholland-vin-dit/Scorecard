<?php
session_start();
?>
<!--?php include 'list_sessions.php'; ?-->
<?php
//	foreach ( $_POST as $key => $value ){
//	 		 echo "$key : $value <br>";
//	}
include ("connection_string.php");
$body_id=$_SESSION["body_id"];
$body_year=$_SESSION["body_year"];
$party_id=$_SESSION["party_id"];

$legislation_id=$_POST["legislation_id"];
$desired_vote_type=$_POST["desired_vote_type"];
// echo $legislation_id." ss<br>";
if($legislation_id=='add'){
	$issue_id=$_POST["issue_id"];
	$adding=true;
}else{
	$adding=false;
}

$legislation_name=mysqli_real_escape_string($link, $_POST["legislation_name"]);
$legislation_date=mysqli_real_escape_string($link, $_POST["legislation_date"]);
$description=mysqli_real_escape_string($link, $_POST["description"]);
$desired_vote_type_id=$_POST["desired_vote_type"];


//echo $event_id."<br>";
//echo $title."<br>";
//echo $subtitle."<br>";
//echo $description."<br>";
//echo $pro_environment_vote."<br>";
//echo $synopsis;


if(!$adding){
	$str_legislation  = "update tbl_legislation ";
	$str_legislation .= "set legislation_name='$legislation_name', legislation_date='$legislation_date', description='$description' ";
	$str_legislation .= "where id=".$legislation_id.";" ;

	$str_desired_vote_type  = "update mtx_legis_party_desired_vote_types ";
	$str_desired_vote_type .= "set legislation_id='$legislation_id', party_id='$party_id', desired_vote_type_id='$desired_vote_type_id' ";
	$str_desired_vote_type .= "where legislation_id=".$legislation_id.";" ;


// add or edit legislation
$sql_legislation = mysqli_query($link, $str_legislation);

}else{
	$str_legislation  = "insert into tbl_legislation ";
	$str_legislation .= "(legislation_name, legislation_date, description, issue_id, body_id, year) ";
	$str_legislation .= "VALUES ('$legislation_name', '$legislation_date', '$description', $issue_id, $body_id, $body_year)";

	// add or edit legislation
	$sql_legislation = mysqli_query($link, $str_legislation);
	$new_id=mysqli_insert_id($link);

	// get recent insert id
	$legislation_id=mysqli_insert_id($link);

	$str_desired_vote_type  = "insert into mtx_legis_party_desired_vote_types ";
	$str_desired_vote_type .= "(legislation_id, party_id, desired_vote_type_id) ";
	$str_desired_vote_type .= "VALUES ('$legislation_id', '$party_id', '$desired_vote_type_id')";

}

// add or edit desired_vote_type
$sql_desired_vote_type = mysqli_query($link, $str_desired_vote_type);

// echo $str_desired_vote_type. "<br>";
// echo $str_legislation;


$kounter=0;
if ($adding){
	$str1="insert into tbl_votes(legislation_id, voter_id, vote_type_id) VALUES";
	$str2= " ";
	foreach ( $_POST as $key => $value ){
		$kounter ++;
  		if ($kounter >6){
//	 		 echo "$key : $value <br>";
			$str2.="(".$new_id.", ".$key.", ".$value."), ";
		}
	}
	$str_tbl_votes=$str1.substr($str2,0,-2);
//	echo $str_tbl_votes;
	$sql_tbl_votes=mysqli_query($link, $str_tbl_votes);
}else{
	foreach ( $_POST as $key => $value ){
		$kounter ++;
		$str_tbl_votes="";
		if ($kounter >5){
// 	 		 echo "<br>$key : $value ";
			$str_tbl_votes.="update tbl_votes set vote_type_id='".$value."' where voter_id='".$key."' and legislation_id='".$legislation_id."'";
//echo $str_tbl_votes;			
			if ($sql_tbl_votes=mysqli_query($link, $str_tbl_votes)){
//			echo " : yes";
//			}else{
//			echo "no";
			}
			
		}
	}
}
//echo "<br>".$str_tbl_votes;

// xxx
 header('Location: index.php?id='.$legislation_id.'');

?>