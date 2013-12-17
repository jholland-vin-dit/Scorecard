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
<title>legitit legislation add/edit page</title>
</head>
<body>

<?php 
$id=$_GET["id"];
if (isset($id)){
	$adding=false;
	$text="Edit";
}elseif($_GET["add"]='T'){
	$adding=true;
	$text="Add";
}else{
	header("location: index.php");
}	

include ("connection_string.php");
	$str_big_issues = "select * from tbl_big_issues ";
	if($sql_big_issues = mysqli_query($link, $str_big_issues))
	{
		//echo "yes";
	}

echo "<table bgcolor='#ECF6CE' width=880 cellpadding=0 cellspacing=0>";
echo "<tr>";
echo "<td><font size=5>".$text." Issue</td><td align=right><a href='index.php'>Home</a></td>";
echo "</tr>";
echo "</table>";

echo "<table width=880>";
echo "<form name='save_issue' action='save_issue.php' method=post>";
// echo "<th bgcolor=lightblue>Link</th><th bgcolor=pink>location</th>";
//$test=$row_issue["title"];
echo "<tr><td valign=top bgcolor=lightblue>".$text."ing</td>";
if(!$adding){
	// Get and print menu links
	$str_issue = "select * from tbl_issues ";
	$str_issue .= "where id=".$id.";" ;
	$sql_issue = mysqli_query($link, $str_issue);
	// xxx
	$row_issue = mysqli_fetch_assoc($sql_issue);
	// echo $str_issue;
	$title=htmlspecialchars($row_issue["title"], ENT_QUOTES);
	$subtitle=htmlspecialchars($row_issue["subtitle"], ENT_QUOTES);
	$description=htmlspecialchars($row_issue["description"], ENT_QUOTES);
	$pro_environment_vote=htmlspecialchars($row_issue["pro_environment_vote"], ENT_QUOTES);
	$synopsis=htmlspecialchars($row_issue["synopsis"], ENT_QUOTES);
	echo "<td bgcolor=lightblue align=left>";	
	echo "<select name=big_issue>";
	while($row_big_issues = mysqli_fetch_assoc($sql_big_issues))
	{
		if ($row_issue["big_issue_id"]==$row_big_issues["id"]){
			$selected=" selected ";
		}else{ 
			$selected= "";
		}
		echo "<option value='".$row_big_issues["id"]."'  ". $selected. ">".$row_big_issues["name"]."</option>";
	}
	echo "</select>";
	echo "</td>";
	
	
	echo"<td bgcolor=lightblue align=right><a href='edit_issue.php?add=T'>Add</a></td>";
}else{
	echo "<td bgcolor=lightblue align=left>";
		echo "<select name=big_issue>";
	while($row_big_issues = mysqli_fetch_assoc($sql_big_issues))
	{
		echo "<option value='".$row_big_issues["id"]."' >".$row_big_issues["name"]."</option>";
	}
	echo "</select>";
	echo "</td>";
	echo"<td bgcolor=lightblue align=right>&nbsp;</td>";
	$title="";
	$subtitle="";
	$description="";
	$pro_environment_vote="";
	$synopsis="";
}
echo "</tr>";
echo "<tr>";
echo "<td valign=top bgcolor=#ACFA58>";
echo "Title: </td>"; 
echo "<td valign=top colspan=2   bgcolor=#ACFA58>";
echo "<input size=80 maxlength=255 type=text name='title' value='".$title."'></td></tr>";
echo "<tr>";
echo "<td valign=top  bgcolor=#ACFA58>";
echo "SubTitle: </td>"; 
echo "<td valign=top  colspan=2  bgcolor=#ACFA58>";
echo "<input size=80 maxlength=255 type=text name='subtitle' value='".$subtitle."'></td></tr>";
echo "<tr>";
echo "<td valign=top  bgcolor=#ACFA58> ";
echo "Description: </td>"; 
echo "<td valign=top  colspan=2  bgcolor=#ACFA58>";
echo "<textarea cols='50' rows='10' name='description'>".$description."</textarea></td></tr>";
echo "<tr>";
echo "<td valign=top bgcolor=#ACFA58> ";
echo "Pro Environment Vote: </td>"; 
echo "<td valign=top  colspan=2  bgcolor=#ACFA58>";
echo "<input type=text name='pro_environment_vote' value='".$pro_environment_vote."'></td></tr>";
echo "<tr>";
echo "<td valign=top bgcolor=#ACFA58> ";
echo "Synopsis: </td>"; 
echo "<td valign=top colspan=2  bgcolor=#ACFA58>";
echo " <textarea name='synopsis' cols='50' rows='10' >".$synopsis."</textarea></td></tr>";
echo "<tr>";
echo "<td valign=top bgcolor=#ACFA58 colspan=3> ";
if(!$adding){
	mysqli_free_result($sql_issue);
	echo " <input type=hidden name='event_id' value=".$id.">";
	echo "<input type=submit value='Save Issue'>";
}else{
	echo " <input type=hidden name='event_id' value='add'>";
	echo "<input type=submit value='Add Issue'>";
}

echo "</td></tr>";
echo "</form>";
echo "</table>";

//$clean_string = mysql_real_escape_string($string);
// $output = stripslashes($db_string);

?>
</body>
</html>