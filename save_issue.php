<?php
include ("connection_string.php");

$event_id=$_POST["event_id"];
if($event_id=='add'){
	$adding=true;
}else{
	$adding=false;
}
$title=mysqli_real_escape_string($link, $_POST["title"]);
$subtitle=mysqli_real_escape_string($link, $_POST["subtitle"]);
$description=mysqli_real_escape_string($link, $_POST["description"]);
$pro_environment_vote=mysqli_real_escape_string($link, $_POST["pro_environment_vote"]);
$synopsis=mysqli_real_escape_string($link, $_POST["synopsis"]);
$big_issue_id=$_POST["big_issue"];

//echo $event_id."<br>";
//echo $title."<br>";
//echo $subtitle."<br>";
//echo $description."<br>";
//echo $pro_environment_vote."<br>";
//echo $synopsis;
//echo $big_issue_id;
if(!$adding){
	$str_issue  = "update tbl_issues ";
	$str_issue .= "set title='$title', subtitle='$subtitle', description='$description', pro_environment_vote='$pro_environment_vote', synopsis='$synopsis', big_issue_id=$big_issue_id  ";
	$str_issue .= "where id=".$event_id.";" ;
}else{
	$str_issue  = "insert into tbl_issues ";
	$str_issue .= "(title, subtitle, description, pro_environment_vote, synopsis, big_issue_id) ";
	$str_issue .= "VALUES ('$title', '$subtitle', '$description', '$pro_environment_vote', '$synopsis', $big_issue_id)";
}
//echo $str_issue;
$sql_issue = mysqli_query($link, $str_issue);

// xxx
//$row_issue = mysqli_fetch_assoc($sql_issue);
//$xx= "Location: edit_issue.php?id=".$event_id."";
//echo $xx
header('Location: index.php?id='.$event_id.'');

?>