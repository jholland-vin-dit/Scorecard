<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>enviro's first page</title>
</head>
<body>




<?php 
if ($_GET["sid"]<>""){
	$county_show = true;
	$sid=$_GET["sid"];
}

$link = mysqli_connect("localhost", "votes", "v0t3s123", "homeint_votes");
/* check connection */
if (mysqli_connect_errno()) {
    printf("Connect failed: %s\n", mysqli_connect_error());
    exit();
}

// Get and print menu links
$str_state_county_municipality = "select * from tbl_states ";
$str_state_county_municipality .= "order by name;" ;
$sql_state_county_municipality = mysqli_query($link, $str_state_county_municipality);

// print initial list of menu_links
//$row_menu_links = mysqli_fetch_assoc($sql_menu_links);
// echo $str_state_county_municipality;

echo "<table width=880>";
echo "<th colspan=2 bgcolor=lightblue>Legislative analyzer</th>";
//echo "<th bgcolor=lightblue>Choose</th><th bgcolor=lightblue>Expand</th>";
while($row_state_county_municipality = mysqli_fetch_assoc($sql_state_county_municipality)){
echo "<tr><td valign=top bgcolor=#ACFA58 width='50%'><a href='legislation_list.php?sid=".$row_state_county_municipality["id"]."'>".$row_state_county_municipality["name"]."</a></td>";
echo "<td valign=top bgcolor=#ACFA58 width='25%'><a href='index.php?sid=".$row_state_county_municipality["id"]."'>Show counties</a></td>";
//echo "<td valign=top  bgcolor=#ACFA58>".$row_menu_links["short_name"]."</td>";
}
echo "</table>";
mysqli_free_result($sql_menu_links);
?>
</body>
</html>