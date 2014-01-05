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
?>
<?php include 'connection_string.php'; ?>
<?php include 'common.php'; ?>
<?php include 'header.php'; ?>

<?php
$body_year=$_SESSION["body_year"];

$legislation_id=$_GET["legislation_id"];
$_SESSION["legislation_id"]=$legislation_id;
$str_bill = "SELECT l.bill_number bill_number,i.title issue_title,l.issue_id,l.legislation_name legislation_name,l.synopsis synopsis, " .
" l.description description, l.legislation_date legislation_date , b.name,y.year,vote_types.vote " .

" FROM `tbl_legislation` l, tbl_bodies b, tbl_years y,tbl_issues i, " .
 " mtx_legis_party_desired_vote_types mtx, " .
 " tbl_vote_types vote_types " .
" WHERE l.year = y.year " .
" AND l.body_id = b.id " .
" AND i.id=l.issue_id " .
" AND  mtx.legislation_id=l.id  " .
" AND  vote_types.id=mtx.desired_vote_type_id  " .
" and l.id = " . $legislation_id;

//echo $str_bill;

$sql_bill = mysqli_query($link, $str_bill);
$bill_count = mysqli_num_rows($sql_bill);
$row_body = mysqli_fetch_assoc($sql_bill);

?>
<table class="bottomtable">
<tr><td><span style="font-weight:bold;"><a href="legislation_listing.php?issue_id=<?php echo $row_body["issue_id"] ?>">Issue: 
<?php echo $row_body["issue_title"] ?></a></span>
</td></tr></table>
<table class=bottomtable>
<tr><td><span style="font-weight:bold;">
 Bill:
<?php 
echo $row_body["legislation_name"];
?>
</span>
</td></tr>
<tr><td><span style="font-weight:bold;">
 Bill #:
<?php 
echo $row_body["bill_number"];
?>
</span>
</td></tr></table>
<?php


echo "<table class=bottomtable>";
echo "<tr>
<th bgcolor=\"orange\">Description</th>
<th bgcolor=\"orange\" style=\"width:100px;\">Date</th>
<th bgcolor=\"orange\">Desired Vote</th></tr>\n";

echo "<tr><td>"
.$row_body["description"]
."</td><td>"
.$row_body["legislation_date"]
."</td><td>"
.$row_body["vote"];
echo "</td></tr>";
echo "</table><table class=bottomtable>";
echo "<tr>";
echo " <th bgcolor=\"orange\">Synopsis</th>";
echo "</tr>\n";
echo "<tr><td>"
.$row_body["synopsis"]
."</td></tr>";



echo "</table>";

$str_votes= "SELECT mtx.party_id,issue_id, legislation_name,votes.legislation_id,voter_id,vote,first_name,last_name, ";
$str_votes .= "vote_type_id,desired_vote_type_id FROM tbl_legislation legislation ";
$str_votes .= " INNER JOIN tbl_votes votes ON votes.legislation_id = legislation.id  ";

$str_votes .= " inner join tbl_voters voters on votes.voter_id=voters.id  ";
$str_votes .= "inner join tbl_vote_types vote_types on votes.vote_type_id=vote_types.id  ";

$str_votes .= "inner join mtx_legis_party_desired_vote_types mtx on mtx.legislation_id=legislation.id  ";

$str_votes .= " WHERE legislation.id=".$legislation_id." ";
$str_votes .= " and mtx.party_id=3 ";
$str_votes .= " order by voter_id, legislation_date  ";

$str_votes .= ";";

//echo $str_votes;

$sql_votes = mysqli_query($link, $str_votes);
$votes_count = mysqli_num_rows($sql_votes);
//$row_votes = mysqli_fetch_assoc($sql_votes);	

echo "<table class=bottomtable>";
echo "<tr><th bgcolor=\"lightblue\">Council Member</th><th bgcolor=\"lightblue\">Vote</th></tr>\n";
// print list of voters and their votes

while($row_votes = mysqli_fetch_assoc($sql_votes)){

   $voter_link = "<a href=\"voter_detail.php?voter_id=".$row_votes["voter_id"]."\">".$row_votes["first_name"]." ".$row_votes["last_name"]."</a>";
	if ($row_votes["vote_type_id"] == $row_votes["desired_vote_type_id"]) {
           $spancolor ="background-color:" . $bgcolor1 . ";";
	} else {
           $spancolor ="background-color:" . $bgcolor2 . ";";
	}

   $vote_text = "<td style=\"".$spancolor."\" >".$row_votes["vote"]."</td>";

			echo "<tr>";
                        echo "<td style=\"" .$spancolor. "\" >".$voter_link."</td>";

			echo $vote_text;
			echo "</tr>\n";

}  // while votes
echo "<tr><td colspan=3><hr></td></tr>";
    /* free result set */
mysqli_free_result($sql_votes);
mysqli_free_result($sql_legislation);
mysqli_close() // do this for tidyness
// now to leave PHP and go back to straight HTML
?>
</table>
</body>
</html>
