<?php
 /*
 This file is part of Scorecard.

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
<title>enviro's aed maintenance page</title>
</head>
<body>


<?php 
$body_id=1;
$table_id=$_GET["id"];

echo "<table bgcolor='#ECF6CE' width=880 cellpadding=0 cellspacing=0>";
echo "<tr>";
echo "<td><font size=5>Maintenance Menu - Add, edit, delete</td><td align=right><a href='aed_menu.php'>Maintenance menu</a></td>";
echo "</tr>";
echo "</table>";


$link = mysqli_connect("localhost", "votes", "v0t3s123", "homeint_votes");
/* check connection */
if (mysqli_connect_errno()) {
    printf("Connect failed: %s\n", mysqli_connect_error());
    exit();
}

// get main table name
$str_main_table = "select * from str_tables tables where tables.id=".$table_id." ;" ;
$sql_main_table = mysqli_query($link, $str_main_table);
$row_main_table = mysqli_fetch_assoc($sql_main_table);

$main_table_name = $row_main_table["name"];

//echo $main_table_name;

// something wrong below
$str_name_of_body = "select * from ".$main_table_name." where id=".$body_id.";";
$sql_name_of_body = mysqli_query($link, $str_name_of_body);
$row_name_of_body = mysqli_fetch_assoc($sql_name_of_body);
//echo $str_name_of_body;
//echo "<br>".$row_name_of_body["name"]; 

// get main table display items
$str_main_table_columns = "select * from str_table_columns table_columns where table_columns.table_id=".$table_id." ;" ;
$sql_main_table_columns = mysqli_query($link, $str_main_table_columns);
//echo $str_main_table_columns;
//$row_main_table_columns = mysqli_fetch_assoc($sql_main_table_columns);

// Get sub_table info
$str_sub_tables = "select * from str_sub_tables sub_tables ";
$str_sub_tables .= "inner join str_tables tables on sub_tables.sub_table_id=tables.id " ;
$str_sub_tables .= "where sub_tables.table_id=".$table_id." " ;
$str_sub_tables .= "order by sub_tables.id;" ;
$sql_sub_tables = mysqli_query($link, $str_sub_tables);

// Get table_column info
$str_table_columns = "select * from str_table_columns table_columns ";
$str_table_columns .= "inner join str_sub_tables sub_tables on table_columns.table_id=sub_tables.id " ;
$str_table_columns .= "inner join str_tables tables on table_columns.table_id=tables.id " ;
$str_table_columns .= "where tables.id=".$table_id." " ;
$str_table_columns .= "order by tables.id;" ;
$sql_table_columns = mysqli_query($link, $str_table_columns);
// echo $str_table_columns;


// print initial list of menu_links
//$row_menu_links = mysqli_fetch_assoc($sql_menu_links);
// echo $str_sub_tables;

echo "<table width=880>";
// show table name
echo "<tr><td bgcolor=orange>Table: ".$row_main_table["screen_name"]."</td></tr>";  // name of main table column
//   echo "<tr><td bgcolor=orange>content ".$row_main_table[""]."</td></tr>";

// show table columns
while($row_main_table_columns = mysqli_fetch_assoc($sql_main_table_columns)){
	$namex=$row_main_table_columns["column_name"];
//	echo "<tr><td valign=top bgcolor=lightgrey>".$row_main_table_columns["column_name"]."</td></tr>";
	}
//$str_name_of_body = "select * from ".$main_table_name." where id=".$body_id.";";
//$sql_name_of_body = mysqli_query($link, $str_name_of_body);
//$row_name_of_body = mysqli_fetch_assoc($sql_name_of_body);
//echo $str_name_of_body;
echo "<tr><td valign=top bgcolor=lightgrey>".$row_name_of_body["$namex"]."</td></tr>";
//echo "<br>".$row_name_of_body["$namex"]; 

	
	
	
// echo "<th bgcolor=lightblue>Link</th><th bgcolor=pink>location</th>";
while($row_sub_tables = mysqli_fetch_assoc($sql_sub_tables)){
	echo "<tr><td valign=top bgcolor=lightblue>".$row_sub_tables["screen_name"]."</td></tr>";
// Get table_column info
	$str_table_columns = "select * from str_table_columns table_columns ";
	$str_table_columns .= "inner join str_tables tables on table_columns.table_id=tables.id ";
	$str_table_columns .= "where table_columns.table_id=".$row_sub_tables["sub_table_id"]." " ;
	$sql_table_columns = mysqli_query($link, $str_table_columns);
//	echo "<tr><td>".$str_table_columns."</td></tr>";
	while($row_table_columns = mysqli_fetch_assoc($sql_table_columns)){
	//	echo "<tr><td valign=top bgcolor=lightgreen>&nbsp;- ".$row_table_columns["column_name"]."</td></tr>";
		$name=$row_table_columns["column_name"];
		$str_select_lookup = "select * from ".$row_table_columns["name"]." ";
		$str_select_lookup .= "where body_id=1 " ;
		$sql_select_lookup = mysqli_query($link, $str_select_lookup);
		//	echo "<tr><td>".$str_select_lookup."</td></tr>";
		// echo "<tr><td>select * from ".$row_table_columns["name"]." where body_id=1</td></tr>";
		while($row_select_lookup = mysqli_fetch_assoc($sql_select_lookup)){
			echo "<tr><td valign=top bgcolor=lightgreen>&nbsp;&nbsp;&nbsp;".$row_select_lookup["$name"]."</td></tr>";
		} // print it
		
	} // columns
} // tables
echo "</table>";
mysqli_free_result($sql_sub_tables);
?>
</body>
</html>