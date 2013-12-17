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


$link = mysqli_connect("localhost", "votes", "v0t3s123", "homeint_votes");
/* check connection */
if (mysqli_connect_errno()) {
    printf("Connect failed: %s\n", mysqli_connect_error());
    exit();
}

// Get and print menu links
$str_menu_links = "select * from str_tables ";
$str_menu_links .= "order by id;" ;
$sql_menu_links = mysqli_query($link, $str_menu_links);

// print initial list of menu_links
//$row_menu_links = mysqli_fetch_assoc($sql_menu_links);
//echo $str_menu_links;

echo "<table width=880>";
// echo "<th bgcolor=lightblue>Link</th><th bgcolor=pink>location</th>";
while($row_menu_links = mysqli_fetch_assoc($sql_menu_links)){
echo "<tr><td valign=top bgcolor=lightblue>Add/edit/delete <a href='aed.php?id=".$row_menu_links["id"]."'>".$row_menu_links["screen_name"]."</a></td>";
// echo "<td valign=top  bgcolor=#ACFA58 width='25%'>".$row_menu_links["url"]."</td>";
// echo "<td valign=top  bgcolor=#ACFA58>".$row_menu_links["short_name"]."</td>";
}
echo "</table>";
mysqli_free_result($sql_menu_links);
?>
</body>
</html>