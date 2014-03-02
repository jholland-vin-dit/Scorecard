<?php
 /*
 This file is part of Scorecard, Copyright 2013-2014 Dan Robinson, Nancy Wallace  and John Holland.

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
" l.description description, l.legislation_date legislation_date , b.name,y.year,vote_types.vote, vb.name voting_body_name " .
" FROM `tbl_legislation` l, tbl_bodies b, tbl_years y,tbl_issues i, " .
 " mtx_legis_party_desired_vote_types mtx, " .
 " tbl_vote_types vote_types, tbl_voting_bodies vb " .
" WHERE l.year = y.year " .
" AND l.body_id = b.id " .
" AND i.id=l.issue_id " .
" AND  mtx.legislation_id=l.id  " .
" AND  vote_types.id=mtx.desired_vote_type_id  " .
" and l.id = " . $legislation_id  .
" and l.voting_body = vb.id;";

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
<tr><td><span style="font-size:large;">

<?php 
echo $row_body["legislation_name"];
?>
</span>
</td></tr>
</table>
<?php


echo "<table class=bottomtable>";
echo "<tr>
<th>Description</th>
</tr>";



echo "<tr><td>"
.$row_body["description"];


echo "</td></tr>";
echo "</table><table class=bottomtable><tr>";
echo "<td><span style=\"font-size:large;\">Desired Vote: &nbsp;&nbsp;</span>"  .
"<span style=\"color:green;font-size:large;\">" .

$row_body["vote"] . "</span></td></tr>";
echo "</table><table class=bottomtable>";
echo "<tr>";
echo " <th>Further Information and Contacts</th>";
echo "</tr>\n";
echo "<tr><td>"
.$row_body["synopsis"]
."</td></tr>";



echo "</table>";

$str_votes= "SELECT mtx.party_id,issue_id, legislation_name,votes.legislation_id,voter_id,vote,first_name,last_name, ";
$str_votes .= "vote_type_id,desired_vote_type_id ,tbl_parties.name party_name, voters.district district FROM tbl_legislation legislation ";
$str_votes .= " INNER JOIN tbl_votes votes ON votes.legislation_id = legislation.id  ";

$str_votes .= " inner join tbl_voters voters on votes.voter_id=voters.id  ";
$str_votes .= "inner join tbl_vote_types vote_types on votes.vote_type_id=vote_types.id  ";

$str_votes .= "inner join mtx_legis_party_desired_vote_types mtx on mtx.legislation_id=legislation.id  ";
$str_votes .= "left outer join tbl_parties on voters.party_id = tbl_parties.id    ";
$str_votes .= " WHERE legislation.id=".$legislation_id." ";
$str_votes .= " and mtx.party_id=3 ";
$str_votes .= " order by voter_id, legislation_date  ";

$str_votes .= ";";

//echo $str_votes;

$sql_votes = mysqli_query($link, $str_votes);
$votes_count = mysqli_num_rows($sql_votes);
//$row_votes = mysqli_fetch_assoc($sql_votes);  
echo "<table class=\"bottomtable\"><tr><td align=\"center\">";
echo "<table width=\"50%\" class=\"bottomtablenowidth\">";
echo "<tr><th bgcolor=\"lightblue\">Council Member</th><th bgcolor=\"lightblue\">Vote</th></tr>\n";
// print list of voters and their votes

while($row_votes = mysqli_fetch_assoc($sql_votes)){

   $voter_link = "<a  href=\"voter_detail.php?voter_id=".$row_votes["voter_id"]."\"><span style=\"font-size:larger;\">".$row_votes["first_name"]." ".$row_votes["last_name"].  ", " . $row_votes["district"] . ", " .  $row_votes["party_name"] .    "</span></a>";
   
   if ($row_votes["vote_type_id"] == $row_votes["desired_vote_type_id"]) {
   $styletext="style=\"font-size:larger;color:green;\"";
   } else {
   $styletext="style=\"font-size:larger;\"";
}



   $vote_text = "<td " .$styletext . " >".$row_votes["vote"]."</td>";

      echo "<tr>";
                        echo "<td>".$voter_link."</td>";

      echo $vote_text;
      echo "</tr>\n";

}  // while votes
echo "<tr><td colspan=3><hr></td></tr>";
    /* free result set */
  //mysqli_free_result($sql_votes);
  //mysqli_free_result($sql_legislation);
  //mysqli_close() // do this for tidyness
// now to leave PHP and go back to straight HTML
?>
</table>
</td></tr>
<tr><td> Bill #:
<?php echo $row_body["bill_number"];?> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Voting Body:
<?php echo $row_body["voting_body_name"]; ?>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Date:
<?php  
if ($row_body["legislation_date"]  == "0000-00-00") {
echo "TBD" ; } else { 
echo $row_body["legislation_date"] ;
}


?></td></tr>

</table>
</body>
</html>
