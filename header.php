<?php
 /*
 This file is part of Scorecard, Copyright 2013-2014 Dan Robinson and John Holla nd.

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
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>
    	<?php echo $page_title;?>
	</title>
	  	<link rel="stylesheet" type="text/css" href="css/general.css" />
  		<link rel="stylesheet" type="text/css" href="css/calendar.css" />

<script type="text/javascript" src="script/jquery-1.10.2.min.js"></script>


<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.min.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
<script>
$(function() {
$( "#datepicker" ).datepicker();
    $( "#datepicker" ).datepicker( "option", "dateFormat", "yy-mm-dd");
});
</script>
  </head>
<body>
<?php include 'connection_string.php'; ?>
<?php
session_start();
$body_id=1;
$_SESSION["body_id"] = $body_id;
$party_id=3;
$_SESSION["party_id"] = $party_id;
$body_year= $_SESSION["body_year"];
$all_bills=true;
?>
<!--?php include 'list_sessions.php'; ?-->
<?php
/* check connection */
if (mysqli_connect_errno()) {
    printf("Connect failed: %s\n", mysqli_connect_error());
    exit();
}
// Get and print leg. body
$str_body = "SELECT * FROM tbl_bodies WHERE id= 1 ";
if ($sql_body = mysqli_query($link, $str_body)) {
   // printf("Select returned %d rows.\n", mysqli_num_rows($sql_names));
}
$row_body = mysqli_fetch_assoc($sql_body);

echo "<table style=\"background-color:198a1d;\"  width=840 cellpadding=0 cellspacing=0 border=0 align=center>";
echo "<tr><td rowspan=\"2\" align=\"center\" valign=\"center\" width=\"20%\"><br><img  style=\"width:48%;height:48%;\" src=\"images/mocologo.gif\">";
echo "</td><td align=\"center\" valign=\"top\" ><span style=\"color:d5d761;font-size:large;font-weight:200;\">Green Party of Montgomery County, Maryland</span></td><td width=\"20%\">&nbsp;</td></tr>";


echo "<tr><td align=\"center\">";
echo "<span style=\"font-weight:200;font-size:x-large;\">";
echo $row_body["name"] ;
echo "</span>";
echo "</td><td width=\"20%\">&nbsp;</td>" ;
echo "</tr>";
if ($page_name <> "index.php") {
echo "<tr><td>";
echo "<a style=\"font-weight:normal;\"	 href=\"index.php\">Return to front page</a>";
echo "</td></tr>"; 

}

echo "<tr><td><div style=\"height:6px;background-color:198a1d;\">&nbsp;</div></td></tr>"; 
if ($_SESSION['user'])  {
echo "<tr><td><a href=\"login.php\"><span style=\"color:white;\">Login/Logout page</span></a></td></tr>";
}
echo "</table>";

