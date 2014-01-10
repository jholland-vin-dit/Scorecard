<?php
 /*
 This file is part of Scorecard, Copyright 2013-2014 Dan Robinson and John Holland.

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

$page_name="publish.php";
$page_title = "Voter Scorecard Publish Action";
?>
<?php  include 'header.php'; // need this for db connection ?>
<?php  $submitted_username = '';
    echo "hello";
    if(!empty($_POST))
    {
 print_r($_POST); 

foreach ($_POST as $key => $value){
	if ( ereg('published.*',$key)) {
	echo "<br>" . $key . "<br>" . $value . "<br>";

	$query =  "UPDATE `tbl_legislation` set published = " . $value . " where id=" . substr($key,9);

	echo $query;
	    $sql_query = mysqli_query($link, $query);
	}
}
}
    header('Location: legislation_listing.php?issue_id=' . $_POST["issue_id_save"]) ;
?>

