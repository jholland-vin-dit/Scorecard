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
echo "<tr><td colspan=3><h3>Issue:".$row_issue["title"]."</td><td><a href=\"edit_issue.php?id=".$row_issue["id"]."\">edit</a></h3>\n</td></tr>";
echo "<th bgcolor=orange>SubTitle</th><th bgcolor=orange>Description</th><th bgcolor=orange>Pro environment</th><th bgcolor=orange>Synopsis</th>";
echo "<tr>";
echo "<td>".$row_issue["subtitle"]."</td>";
echo "<td valign=top>".$row_issue["description"]."</td><td>".$row_issue["pro_environment_vote"]."</td>";
echo "<td valign=top>".$row_issue["synopsis"]."</td>";
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
echo "<tr><td bgcolor=lightblue  align=right colspan=4><a href='edit_legislation.php?add=T'>Add Legislation</a></td></tr>";
//echo "<th bgcolor=lightblue>Bill</th><th bgcolor=pink>Date</th><th bgcolor=green>Description</th>";
while($row_legislation = mysqli_fetch_assoc($sql_legislation)){
//"edit_legislation.php?id=".$row_legislation["id"];
echo "<tr><td valign=top bgcolor=lightblue width=25%><a href=\"bill_detail.php?legislation_id=".$row_legislation["id"]."\">".$row_legislation["legislation_name"]."</a></td>";
echo "<td valign=top  bgcolor=pink width=25%>".$row_legislation["legislation_date"]."</td>";
echo "<td valign=top  bgcolor=lightgreen>".$row_legislation["description"]."</td>";
echo "<td valign=top  bgcolor=lightgreen><a href='edit_legislation.php?legislation_id=".$row_legislation["id"]."'>edit</a></td>";
echo "</tr>";
}
echo "</table>";
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

<?php  include 'voters_ratings.php' ; ?>

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
