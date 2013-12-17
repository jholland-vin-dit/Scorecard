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
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head><title>New Vote List</title></head>
<body>
<?php include 'connection_string.php'; ?>
<?php include 'header.php'; ?>
<?php

/* check connection */
if (mysqli_connect_errno()) {
    printf("Connect failed: %s\n", mysqli_connect_error());
    exit();
}

$body_year=1994;

echo "<h2>Voting Scorecard</h2>";

$body_name=$row_body["name"];

$str_voters = "SELECT voters.id voter_id,first_name,last_name  from tbl_voters voters order by last_name,first_name; ";

//echo $str_voters . "<br>";
$sql_voters = mysqli_query($link, $str_voters);

$voters_count = mysqli_num_rows($sql_voters);

//echo "<br>voters_count: ".$voters_count . "<br>";


$str_votes= "SELECT mtx.party_id,issue_id,i.title issue_title, legislation_name,votes.legislation_id,voter_id,vote,first_name,last_name, ";
$str_votes .= "vote_type_id,desired_vote_type_id FROM tbl_legislation legislation ";
$str_votes .= " INNER JOIN tbl_votes votes ON votes.legislation_id = legislation.id  ";
$str_votes .= " inner join tbl_voters voters on votes.voter_id=voters.id  ";
$str_votes .= "inner join tbl_vote_types vote_types on votes.vote_type_id=vote_types.id  ";
$str_votes .= "inner join mtx_legis_party_desired_vote_types mtx on mtx.legislation_id=legislation.id  ";
$str_votes .= "inner join tbl_issues i on i.id=legislation.issue_id ";
//$str_votes .= " WHERE issue_id=".$issue_id." ";
$str_votes .= " where mtx.party_id=3 ";
$str_votes .= " order by legislation_date,legislation_id, last_name,first_name";
$str_votes .= ";";

//echo $str_votes;
$sql_votes = mysqli_query($link, $str_votes);
//echo "<br>";
//echo "new table:<br>";
echo "\n<table bgcolor='#F5DA81' border=\"1\"><tr><th>Bill Name</th><th>Bill Date</th><th>Issue</th>";
while ($row_voters = mysqli_fetch_assoc($sql_voters)) {
  echo "<th><a href=\"voter_detail.php?id=".$row_voters["voter_id"]."\">".$row_voters["first_name"]." ".$row_voters["last_name"]."</a></th>";
}

$current_legislation_id = -1;
$first_row=TRUE;



while($row_votes = mysqli_fetch_assoc($sql_votes)) {

  if ($row_votes["legislation_id"] != $current_legislation_id) {
    // start new row
    if (!$first_row){
      echo "</tr>\n"; 
    } else {
      $first_row = FALSE;
    }
    echo "\n<tr><td>" . "<a href=\"bill_detail.php?id=" . $row_votes["legislation_id"] . "&body_id=" . $body_id . "&body_year=" . $body_year . "&issue_id=". $row_votes["issue_id"] . "\">";

echo  $row_votes["legislation_name"] 
	. "</a></td><td>" . $row_votes["legislation_date"] . "</td>";
echo "<td><a href=\"legislation_listing.php?issue_id=" . $row_votes["issue_id"] 
  . "\">" . $row_votes["issue_title"] . "</a></td>";
  }

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
	echo $vote_text;




  $current_legislation_id=$row_votes["legislation_id"];
}
echo "</tr></table>";





$votes_count = mysqli_num_rows($sql_votes);
//$row_votes = mysqli_fetch_assoc($sql_votes);	
//echo "<br>votes_count: ".$votes_count;

//echo "<br>before while:";

//if ($sql_votes = mysqli_query($link, $str_votes )) 	{}
echo "<table  width=380 cdllpadding=0 cellspacing=0 border =0>";
echo "<th bgcolor=lightblue>&nbsp;</th>";
while($row_legislation = mysqli_fetch_assoc($sql_legislation)){
	echo "<th bgcolor=lightblue>".$row_legislation["legislation_name"]."<br>".$row_legislation["legislation_date"]."</th>";
}
echo "</tr>";


// print list of voters and their votes
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

    /* free result set */
mysqli_free_result($sql_votes);
mysqli_free_result($sql_legislation);
mysqli_close(); // do this for tidyness
?>
</body>
</html>
