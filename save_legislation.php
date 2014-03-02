<?php
 /*
 This file is part of Scorecard, Copyright 2013-2014 Dan Robinson, Nancy Wallace  and John Holland.

    Scorecard is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    Scorecard is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with Scorecard.  If not, see <http://www.gnu.org/licenses/>.

*/
?>
<?php
session_start();
?>
<?php




//foreach ( $_POST as $key => $value ){
//	 echo "$key : $value <br>";
//}
foreach ( $_POST as $key =>$value ){
	// put values in session to redisplay later
	if (ereg("^[0-9]+$",$key)){
		 $_SESSION["VOTE".$key] = $value;
 	 } else {
	 	 $_SESSION[$key] = $value;
	 }
}
//echo "after foreach";
include ("connection_string.php");
$body_id=$_SESSION["body_id"];
$body_year=$_SESSION["body_year"];
$party_id=$_SESSION["party_id"];

$legislation_id=$_POST["legislation_id"];
$desired_vote_type=$_POST["desired_vote_type"];
$voting_body=$_POST["voting_body"];
// echo $legislation_id." ss<br>";
if($legislation_id=='add'){
	$issue_id=$_POST["issue_id"];
	$adding=true;
}else{
	$adding=false;
}

$legislation_name=mysqli_real_escape_string($link, $_POST["legislation_name"]);
$legislation_date=mysqli_real_escape_string($link, $_POST["legislation_date"]);
$bill_number=mysqli_real_escape_string($link, $_POST["bill_number"]);
$synopsis=mysqli_real_escape_string($link, $_POST["synopsis"]);
$description=mysqli_real_escape_string($link, $_POST["description"]);
$desired_vote_type_id=$_POST["desired_vote_type"];


//date should be YYYY-MM-DD
//	foreach ( $_SESSION as $key => $value ){
//	 		 echo "$key : $value <br>";
//	}
//	foreach ( $_POST as $key => $value ){
//	 		 echo " POST $key : $value <br>";
//	}
$year = substr($legislation_date,0,4);
$month = substr($legislation_date,5,2);
$day = substr($legislation_date,8,2);

//echo "$year   $month    $day";

$gooddate = true;
$errors=false;    
$errormsgs="";
if (is_numeric($year) && is_numeric($month) && is_numeric($day)) {
	
	if (!checkdate($month,$day,$year)) {	
		$gooddate = false;
		$errormsgs .= "invalid date";
		}
} else {
	$gooddate = false;
	$errormsgs .= "non-numeric date";
}

if (!$gooddate) {
   $errors = true;
 }

//echo $legislation_date;



if(!$adding){
	$str_legislation  = "update tbl_legislation ";
	$str_legislation .= "set legislation_name='$legislation_name', legislation_date='$legislation_date', description='$description',bill_number='$bill_number',synopsis='$synopsis',voting_body=$voting_body ";
	$str_legislation .= "where id=".$legislation_id.";" ;

	$str_desired_vote_type  = "update mtx_legis_party_desired_vote_types ";
	$str_desired_vote_type .= "set legislation_id='$legislation_id', party_id='$party_id', desired_vote_type_id='$desired_vote_type_id' ";
	$str_desired_vote_type .= "where legislation_id=".$legislation_id.";" ;


// add or edit legislation
$sql_legislation = mysqli_query($link, $str_legislation);

}else{
	$str_legislation  = "insert into tbl_legislation ";
	$str_legislation .= "(legislation_name, legislation_date, description, issue_id, body_id, year,synopsis,bill_number,voting_body) ";
	$str_legislation .= "VALUES ('$legislation_name', '$legislation_date', '$description', $issue_id, $body_id, $body_year, '$synopsis','$bill_number',$voting_body)";

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



$kounter=0;
if ($adding){
	$str1="insert into tbl_votes(legislation_id, voter_id, vote_type_id) VALUES";
	$str2= " ";
	foreach ( $_POST as $key => $value ){
	if (is_numeric($key)){
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

			$str_tbl_votes.="update tbl_votes set vote_type_id='".$value."' where voter_id='".$key."' and legislation_id='".$legislation_id."'";

			if ($sql_tbl_votes=mysqli_query($link, $str_tbl_votes)){

			}
			
		}
	}
}
//echo "<br>".$str_tbl_votes;
//echo "at end";
// xxx
 if (empty($errormsgs)) { 

header('Location: bill_detail.php?legislation_id='.$legislation_id.'');
} 


else {
// must have errors
	 $_SESSION['haderrors'] = 1;
 header('Location: errors.php?errormsgs='.urlencode($errormsgs));
}





?>
