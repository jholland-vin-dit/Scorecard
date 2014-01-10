<?php
 /*
 This file is part of Scorecard, Copyright 2013-2014 Dan Robinson and John Holla
nd.

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


/*

NOTE: CORRECT OPERATION OF THIS PAGE REQUIRES InnoDB Tables and the Cascading deletes in the database to delete child records



*/
?>
<?php 
session_start();
include ("connection_string.php");
include ('header.php'); 
if (isset($_SESSION["user"])) {

if (isset($_GET["legislation_id"])){

	$legislation_id=$_GET["legislation_id"];
	$str_delete_legislation  = "delete  from tbl_legislation ";
	$str_delete_legislation .= "where id=".$legislation_id.";" ;
	$sql_delete_legislation = mysqli_query($link, $str_delete_legislation);

header ("location:index.php");

	}
else {
echo "<h3>no legislation_id</h3>";

 } }
else {

echo "<h3>not authorized</h3>";
}
?>
