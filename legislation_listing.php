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
?>
<?php
session_start();
$page_name="legislation_listing.php";
$page_title = "Legislation listing";
$issue_id=$_GET["issue_id"];
$_SESSION["issue_id"]=$issue_id;
$body_year = $_SESSION["body_year"];
?>
<?php include 'header.php'; ?>
<?php 
// get and print issue
$str_issue = "select * from tbl_issues issues ";
$str_issue .= "where id=".$issue_id." ;" ;
$sql_issue = mysqli_query($link, $str_issue);
$row_issue = mysqli_fetch_assoc($sql_issue);	
// echo $str_issue;

echo "<table class=bottomtable>";
echo "<tr><td colspan=3><span style=\"font-weight:bold;\">Issue: ".$row_issue["title"]."</td>";

if ($_SESSION["user"]) { 
echo "<td><a href=\"edit_issue.php?id=".$row_issue["id"]."\">edit</a></h3>\n</td>";
}
echo "</tr>";
echo "<tr>";
echo "<td valign=top>".$row_issue["description"]."</td>";
echo "</tr>";
echo "</table>";

// Get and print legislation
$str_legislation = "select * from tbl_legislation legislation ";
$str_legislation .= "where issue_id=".$issue_id;
$str_legislation .= " and year = ".$body_year." ";
$str_legislation .= " order by legislation_date;" ;
$sql_legislation = mysqli_query($link, $str_legislation);

// print initial list of legislation
//$row_legislation = mysqli_fetch_assoc($sql_legislation1);
//echo $str_legislation;
echo "<table class=\"bottomtable\">";
if ( $_SESSION["root"]) { 
echo "<tr><td><form action=\"publish.php\" method=POST><input type=\"submit\" value=\"Apply Published states\"></td></tr>";
echo "<input type=\"hidden\" name=\"issue_id_save\" value=\"" . $_GET["issue_id"] . "\">";
}

if ($_SESSION["user"] || $_SESSION["root"]) { 
echo "<tr bgcolor=lightblue ><td >Published</td><td>Click on Bill Title to see votes</td><td style=\"width:30px;\">Bill #</td><td style=\"width:50px;\">Date<td>Description</td><td align=right colspan=4><a href='edit_legislation.php?add=T'>Add Legislation</a></td></tr>";
}
 else {
echo "<tr bgcolor=lightblue ><td>Click on Bill Title to see votes</td><td style=\"width:30px;\">Bill #</td><td style=\"width:50px;\">Date<td>Description</td><td align=right colspan=4></td></tr>";


}
while($row_legislation = mysqli_fetch_assoc($sql_legislation)){


if ( $_SESSION["root"]) { 
echo "<tr><td>Published:<br><input type=\"radio\"  name=\"published".$row_legislation["id"]. "\" value=\"true\" " .  ($row_legislation["published"]  ? "checked ":"") . ">Yes<input type=\"radio\" name=\"published".$row_legislation["id"]."\" value=\"false\"" .  (!$row_legislation["published"]  ? "checked ":"") . ">No</td><td valign=top bgcolor=lightblue width=25%><a href=\"bill_detail.php?legislation_id=".$row_legislation["id"]."\">".$row_legislation["legislation_name"]."</a></td>";
}
if ( 
(!$_SESSION["user"] && !$_SESSION["root"] && $row_legislation["published"]) // published, non special user
|| ($_SESSION["user"] && !$SESSION["root"]) ) // user but not root
{

if ($_SESSION["user"] && !$_SESSION["root"]) {
 echo "<tr><td>" . ($row_legislation["published"] ? "Y" : "N" ) . "</td>" ;
echo "<td valign=top bgcolor=lightblue width=25%><a href=\"bill_detail.php?legislation_id=".$row_legislation["id"]."\">".$row_legislation["legislation_name"]."</a></td>";
} 
if (!$_SESSION["user"]) {
echo "<tr>";
echo "<td valign=top bgcolor=lightblue width=25%><a href=\"bill_detail.php?legislation_id=".$row_legislation["id"]."\">".$row_legislation["legislation_name"]."</a></td>";
}




echo "<td valign=top>".$row_legislation["bill_number"]."</td><td valign=top   >".$row_legislation["legislation_date"]."</td>";
echo "<td valign=top  bgcolor=lightgreen>".$row_legislation["description"]."</td>";}


if ($_SESSION["user"]) { 
echo "<td valign=top  bgcolor=lightgreen><a href='edit_legislation.php?legislation_id=".$row_legislation["id"]."'>edit</a>&nbsp;&nbsp;&nbsp;<a href='delete_legislation.php?legislation_id=".$row_legislation["id"]."'>delete</a></td>";

echo "</tr>";
echo "</tr><tr><td colspan=4 valign=top bgcolor=papayawhip>".$row_legislation["synopsis"]."</td><td>&nbsp;</td></tr>";

}

}
echo "</form></table>";
mysqli_free_result($sql_legislation);

// Get and print legislation again in table
$str_legislation = "select * from tbl_legislation legislation ";
$str_legislation .= "where issue_id=".$issue_id." order by legislation_date;" ;
$sql_legislation = mysqli_query($link, $str_legislation);
$legislation_count = mysqli_num_rows($sql_legislation);

//echo $str_legislation."<br>";
//echo "lgislation_count:".$legislation_count;


$str_votes= "SELECT mtx.party_id,issue_id, legislation_name,votes.legislation_id,voter_id,vote,first_name,last_name, ";
$str_votes .= "vote_type_id,desired_vote_type_id FROM tbl_legislation legislation ";
$str_votes .= " INNER JOIN tbl_votes votes ON votes.legislation_id = legislation.id  ";
$str_votes .= " inner join tbl_voters voters on votes.voter_id=voters.id  ";
$str_votes .= "inner join tbl_vote_types vote_types on votes.vote_type_id=vote_types.id  ";
$str_votes .= "inner join mtx_legis_party_desired_vote_types mtx on mtx.legislation_id=legislation.id  ";
$str_votes .= " WHERE issue_id=".$issue_id." ";
$str_votes .= " and mtx.party_id=3 ";
$str_votes .= " order by voter_id, legislation_date  ";
$str_votes .= ";";

//echo $str_votes;

$sql_votes = mysqli_query($link, $str_votes);

$votes_count = mysqli_num_rows($sql_votes);
//$row_votes = mysqli_fetch_assoc($sql_votes);	
//echo "<br>votes_count: ".$votes_count;

//echo "<br>before while:";

//if ($sql_votes = mysqli_query($link, $str_votes )) 	{}

/*
echo "<table bgcolor='#F5DA81' width=380 cdllpadding=0 cellspacing=0 border =0>";
echo "<th bgcolor=lightblue>&nbsp;</th>";
while($row_legislation = mysqli_fetch_assoc($sql_legislation)){
	echo "<th bgcolor=lightblue>".$row_legislation["legislation_name"]."<br>".$row_legislation["legislation_date"]."</th>";
}
echo "</tr>";
echo "</table>\n";

// print list of voters and their votes

*/

$legislation_issues_to_view = " = " . $issue_id;
$heading_clause = "for this issue";
?>
<?php // below would print ratings of voters on this issue
//  include 'http://192.168.61.98/Scorecard/voters_ratings.php' . '?issue_id=' . $issue_id . '&heading_clause=' . urlencode($heading_clause) ; 

?>


<?php
/*


$kounter=1;
while($row_votes = mysqli_fetch_assoc($sql_votes)){
//echo "<br>legislation_name: ".$row_votes["legislation_name"];

//echo "<tr><td>id: ".$row_votes["vote_type_id"]."</td></tr>";

// I commented the next line and added the line above on 114 to see if I could get it to work in an while loop. . .
	//if(FALSE) {  if ($row_votes["vote_type_id"] == $row_votes["desired_vote_type_id"]) {
	if ($row_votes["vote_type_id"] == $row_votes["desired_vote_type_id"]) {
	   $vote_is_desired  = TRUE;
           $spancolor ="bgcolor=\"lightgreen\"";
	} else {
	   $vote_is_desired = FALSE;
	}
	if ($vote_is_desired){
	   $vote_text = "<td ".$spancolor." >".$row_votes["vote"]."</td>";


	} else {
	    $vote_text = "<td>".$row_votes["vote"]."</td>"; 

	}
		if ($kounter==1){ // print first time of set
			echo "<tr>";
			echo "<td valign=top><a href=\"voter_detail.php?id=".$row_votes["voter_id"]."\">".$row_votes["first_name"]." ".$row_votes["last_name"]."</a></td>";
			echo $vote_text;
		}else{  // bigger than 1 or reset
			echo $vote_text;
		}
		++$kounter;  // increment either way
		if ($kounter > $legislation_count){ // end of row
			echo "</tr>";
			$kounter=1;
		} 
}  // while votes
echo "<tr><td colspan=3><hr></td></tr>";
  
mysqli_free_result($sql_votes);
mysqli_free_result($sql_legislation);
mysqli_close() // do this for tidyness



//if ($sql_names = mysqli_query($link, "select * from voters")) {
   // printf("Select returned %d rows.\n", mysqli_num_rows($sql_names));
//}

// this creates a form to enter info into. It calls an update page which then returns to this page
//echo "<table bgcolor='yellow'>";
//echo "<form action='table_adder.php' method=post>";
//echo "<tr><td><input type=text name=title maxwidth=15>enter new names here";
//echo "<input type=submit value='submit'></td></tr>";
//echo "</form>";
//echo "</table>";

// now to leave PHP and go back to straight HTML
*/
?>

</body>
</html>
