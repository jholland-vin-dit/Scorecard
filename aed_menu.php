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
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>enviro's first page</title>
</head>
<body>




<?php 
echo "<table bgcolor='#ECF6CE' width=880 cellpadding=0 cellspacing=0>";
echo "<tr>";
echo "<td><font size=5>Maintenance Menu</td><td align=right><a href='index.php'>Home</a></td>";
echo "</tr>";
echo "</table>";


/* check connection */
if (pg_last_error()) {
    exit();
}

// Get and print menu links
$str_menu_links = "select * from str_tables ";
$str_menu_links .= "order by id;" ;
$sql_menu_links = pg_query($link, $str_menu_links);

// print initial list of menu_links
//$row_menu_links = pg_fetch_assoc($sql_menu_links);
//echo $str_menu_links;

echo "<table width=880>";
// echo "<th bgcolor=lightblue>Link</th><th bgcolor=pink>location</th>";
while($row_menu_links = pg_fetch_assoc($sql_menu_links)){
echo "<tr><td valign=top bgcolor=lightblue>Add/edit/delete <a href='aed.php?id=".$row_menu_links["id"]."'>".$row_menu_links["screen_name"]."</a></td>";
// echo "<td valign=top  bgcolor=#ACFA58 width='25%'>".$row_menu_links["url"]."</td>";
// echo "<td valign=top  bgcolor=#ACFA58>".$row_menu_links["short_name"]."</td>";
}
echo "</table>";

?>
</body>
</html>
