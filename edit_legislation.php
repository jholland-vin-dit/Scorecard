<?php 
session_start();
include ("connection_string.php");
if (isset($_GET["legislation_id"])){
	$adding=false;
	$text="Edit";
	$legislation_id=$_GET["legislation_id"];
	$_SESSION["legislation_id"]=$legislation_id;
	// vote preference
	$str_legis_party_desired_vote_type = "select * from mtx_legis_party_desired_vote_types ";
	$str_legis_party_desired_vote_type .= "where legislation_id=".$legislation_id.";" ;
	$sql_legis_party_desired_vote_type = mysqli_query($link, $str_legis_party_desired_vote_type);
	$row_legis_party_desired_vote_type = mysqli_fetch_assoc($sql_legis_party_desired_vote_type);
	$legis_party_desired_vote_type_id=$row_legis_party_desired_vote_type["desired_vote_type_id"];
//	echo $str_legis_party_desired_vote_type."<br>";
//	echo "legis_party_desired_vote_type_id: ".$legis_party_desired_vote_type_id;
	$legis_party_desired_vote_type_on=true;
}elseif($_GET["add"]='T'){
	$adding=true;
	$text="Add";
	$legis_party_desired_vote_type_on=false;
}else{
	header("location: index.php");
}	
?>
<?php include 'header.php'; ?>

<?php
$issue_id=$_SESSION["issue_id"];
$str_issue = "select * from tbl_issues ";
$str_issue .= "where id=".$issue_id.";" ;
$sql_issue = mysqli_query($link, $str_issue);
$row_issue = mysqli_fetch_assoc($sql_issue);
$issue=$row_issue["title"];
// echo "issue: ".$issue;

// vote types for dropdown
$str_vote_types = "select * from tbl_vote_types ";
$str_vote_types .= " order by vote; ";
$sql_vote_types = mysqli_query($link, $str_vote_types);



// $issue_id=$_GET["issue_id"];
echo "<table class=bottomtable>";
echo "<tr>";
echo "<td><font size=5>".$text." Legislation for ".$issue."</td><td align=right><a href='index.php'>Home</a></td>";
echo "</tr>";
echo "</table>";

echo "<table class=bottomtable>";
echo "<form name='save_legislation' action='save_legislation.php' method=post>";
echo "<tr>";
echo "<td valign=top bgcolor=lightblue>Legislation ".$text."</td>";
if(!$adding){
	// 
	$str_legislation = "select * from tbl_legislation ";
	$str_legislation .= "where id=".$legislation_id.";" ;
	$sql_legislation = mysqli_query($link, $str_legislation);
	$row_legislation = mysqli_fetch_assoc($sql_legislation);
	// echo $str_legislation;
	$legislation_name=htmlspecialchars($row_legislation["legislation_name"], ENT_QUOTES);
	$legislation_date=$row_legislation["legislation_date"];
	$description=$row_legislation["description"];
	echo " <input type=hidden name='legislation_id' value=".$legislation_id.">";
	// echo"<td bgcolor=lightblue align=right><a href='edit_legislation.php?add=T'>Add</a></td>";
	mysqli_free_result($sql_legislation);
}else{
	$legislation_name="";
	$legislation_date="";
	$description="";
	echo " <input type=hidden name='legislation_id' value='add'>";
	echo "<input type=hidden name=issue_id value=".$issue_id.">";
}


// now comes the desired vote dropdown
echo"\n<td bgcolor=lightblue align=right>Green Party preferred vote: ";
echo "\n<select name=desired_vote_type>";
while($row_vote_types = mysqli_fetch_assoc($sql_vote_types)){
	if($legis_party_desired_vote_type_on){
		if($legis_party_desired_vote_type_id==$row_vote_types["id"]){
			$selected = " selected ";
		}else{
			$selected = " ";
		}
	}
	echo "\n<option value=".$row_vote_types["id"]." ".$selected." >".$row_vote_types["vote"]."</option>";
}
echo "\n\r</select>";
echo "</td>";
echo "</tr>";
echo "<tr>";
echo "<td valign=top  bgcolor=#ACFA58>";
echo "Name: </td>"; 
echo "<td valign=top  bgcolor=#ACFA58>";
echo "<input size=80 maxlength=255 type=text name='legislation_name' value='".$legislation_name."'></td></tr>";
echo "<tr>";
echo "<td valign=top  bgcolor=#ACFA58>";
echo "Date: </td>"; 
echo "<td valign=top  bgcolor=#ACFA58>";
echo "<input size=10 maxlength=10 type=text name='legislation_date' value='".$legislation_date."'></td></tr>";
echo "<tr>";
echo "<td valign=top  bgcolor=#ACFA58> ";
echo "Description: </td>"; 
echo "<td valign=top  bgcolor=#ACFA58>";
echo "<textarea cols='50' rows='10' name='description'>".$description."</textarea></td></tr>";

echo "<tr><td colspan=2>";
echo "<table class=bottomtable>";

//<table bgcolor=#ACFA58 border=1>";

// show votes
if($adding){
	$str_voters = "select * from mtx_voters_bodies vb ";
	$str_voters .= " inner join tbl_voters v on vb.voter_id=v.id ";
	$str_voters .= " where year = ".$body_year." and vb.body_id = ".$body_id." ";
	$str_voters .= " order by v.last_name, v.first_name; ";
	$sql_voters = mysqli_query($link, $str_voters);
	while($row_voters = mysqli_fetch_assoc($sql_voters)){
		$str_vote_types = "select * from tbl_vote_types ";
		$str_vote_types .= " order by vote; ";
		$sql_vote_types = mysqli_query($link, $str_vote_types);
		echo "\n<tr><td>".$row_voters["first_name"]." ".$row_voters["last_name"]."</td>";				
		while($row_vote_types = mysqli_fetch_assoc($sql_vote_types)){
//			if($adding){
				echo "\n<td>".$row_vote_types["vote"]."\n<input type=radio name=".$row_voters["id"]." value=".$row_vote_types["id"].">\n</td>"; 
//			}else{
//			}
		}
		echo "\n</tr>";
	}
}else{ // editing
	$str_voters = "select * FROM tbl_votes votes ";
	$str_voters .= " INNER JOIN tbl_voters voters ON voters.id = votes.voter_id ";
	$str_voters .= " where legislation_id = ".$legislation_id."";
	$str_voters .= " order by voters.last_name, voters.first_name; ";
	$sql_voters = mysqli_query($link, $str_voters);
	while($row_voters = mysqli_fetch_assoc($sql_voters)){
		$str_vote_types = "select * from tbl_vote_types ";
		$str_vote_types .= " order by vote; ";
		$sql_vote_types = mysqli_query($link, $str_vote_types);
		echo "\n<tr><td>".$row_voters["first_name"]." ".$row_voters["last_name"]."</td>";				
		while($row_vote_types = mysqli_fetch_assoc($sql_vote_types)){
//			if(!$adding){
				if ($row_vote_types["id"]==$row_voters["vote_type_id"]){ $checked=" CHECKED ";}ELSE{$checked=" ";}
				echo "\n<td>".$row_vote_types["vote"]."\n<input type=radio name=".$row_voters["id"]." value=".$row_vote_types["id"]."  ".$checked.">\n</td>"; 
//			}else{
//			}
		}
		echo "\n</tr>";
	}
}
//	echo $str_voters;
echo "</table></td></tr>";
echo "<tr><td colspan=2 bgcolor=#ACFA58>";
echo "<input type=submit value='Save Legislation'>";
echo "</td></tr>";
echo "\n</table>";
echo "\n</form>";
//$clean_string = mysql_real_escape_string($string);
// $output = stripslashes($db_string);

?>
</body>
</html>