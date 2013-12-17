<?php
// here we capture a variable from the sending page form 
$title = $_POST["title"];
// now set up the database connection
$mysql_link = mysql_connect("localhost", "jholland", "p@ssword!@#");
mysql_select_db("homeint_jholland", $mysql_link) or die("Unable to select the database...");
// now create a sql command
$sql_names = "insert into names (title) values ('$title') ;";
//echo "test:".$sql_names; // print it on screen to ensure that the variable came through - if you do this comment the header below
// run the command
mysql_query($sql_names, $mysql_link);
// go back to where you came from
header ("location:index.php");
?>
