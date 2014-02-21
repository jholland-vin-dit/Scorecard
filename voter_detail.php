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
<?php $page_title="County Council Scorecard";
session_start()
?>
<?php include 'connection_string.php'; ?>
<?php include 'header.php'; ?>
<?php include 'common.php'; ?>
    <?php 
      $voter_id=$_GET["voter_id"];
    /* check connection */

    // FIXME - done!
    $year=$_SESSION["year"];
    //get and print voter

    $str_voter = "SELECT voters.body_id, first_name,last_name, parties.name as party_name, district , bodies.name as body_name ";
    $str_voter .= " FROM tbl_voters voters, tbl_parties parties,tbl_bodies bodies "; 
    $str_voter .= "where parties.id = voters.party_id ";
    $str_voter .= "and bodies.id = voters.body_id ";
    $str_voter .= "and voters.id =".$voter_id.";";

//    echo $str_voter;

    $sql_voter = mysqli_query($link, $str_voter);
    $voter_count = mysqli_num_rows($sql_voter);

    $row_voter = mysqli_fetch_assoc($sql_voter);
  echo "<table class=bottomtable>";

  
    // get and print rating number - good votes first
$str_good_number = "SELECT count(*) thecount ";
$str_good_number .= " FROM tbl_votes votes, tbl_legislation legislation ";
$str_good_number .= " WHERE votes.legislation_id = legislation.id ";
$str_good_number .= " and exists (select *";
$str_good_number .= " from mtx_legis_party_desired_vote_types mtx ";
$str_good_number .= " where mtx.legislation_id = legislation.id";
$str_good_number .= " and mtx.desired_vote_type_id =votes.vote_type_id ";
$str_good_number .= " and mtx.party_id=3)";
$str_good_number .= " AND votes.voter_id=".$voter_id;
$str_good_number .= " AND votes.vote_type_id <> -1";
$str_good_number .= " AND legislation.published=1;";

    $sql_good_number  = mysqli_query($link, $str_good_number);
    $good_number_count = mysqli_num_rows($sql_good_number);
    $row_good_number = mysqli_fetch_assoc($sql_good_number);
//echo "<h1>".$row_good_number["thecount"]."<h1>\n";
    // get and print rating number - all votes 
$str_all_number = "SELECT count(*) thecount ";
$str_all_number .= " FROM tbl_votes votes, tbl_legislation legislation ";
$str_all_number .= " WHERE votes.legislation_id = legislation.id ";
$str_all_number .= " and exists (select *";
$str_all_number .= " from mtx_legis_party_desired_vote_types mtx ";
$str_all_number .= " where mtx.legislation_id = legislation.id";
$str_all_number .= " and mtx.party_id=3)";
$str_all_number .= " AND votes.voter_id=".$voter_id;
$str_all_number .= " AND votes.vote_type_id <> -1";
$str_all_number .= " AND legislation.published=1;";
    $sql_all_number  = mysqli_query($link, $str_all_number);
    $all_number_count = mysqli_num_rows($sql_all_number);
    $row_all_number = mysqli_fetch_assoc($sql_all_number);
    echo "<tr><td><div style=\"font-family:sans;font-size:small;\">";
  echo "<span style=\"font-weight:bold\">".$row_voter["first_name"]." ".$row_voter["last_name"]."</span>&nbsp;&nbsp;";
    echo $row_voter["party_name"].", " . $row_voter["district"] . " " ;
    



echo "<span style=\"font-weight:bold;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Rating: " . $row_good_number["thecount"] . "/" . $row_all_number["thecount"] ;
  echo "</span></div></td></tr>";





$str_bill = "SELECT votes.vote_type_id, mtx.desired_vote_type_id, vote_types.vote ";
    $str_bill .= ",legislation_date, legislation_name,bill_number,description,votes.legislation_id ";
    $str_bill .= "FROM tbl_votes votes, tbl_legislation legislation ";
    $str_bill .=  ",tbl_vote_types vote_types ";
    $str_bill .= ", mtx_legis_party_desired_vote_types mtx ";
    $str_bill .= "WHERE votes.legislation_id = legislation.id ";
    $str_bill .= "and vote_types.id=votes.vote_type_id ";
    $str_bill .= "and  mtx.legislation_id=legislation.id  ";
    $str_bill .= "AND votes.voter_id =" . $voter_id. " "; 
    $str_bill .= " AND legislation.published=1 ";
    $str_bill .= " order by legislation_date";
    $str_bill .= ";";



//    echo $str_bill;

    $sql_bill = mysqli_query($link, $str_bill);
    $bill_count = mysqli_num_rows($sql_bill);
  //  echo "bill_count:" . $bill_count;
    

$alternate_shade = false;

    echo "<table class=bottomtable>\n";
  echo "<tr><th style=\"width:200px;\">Bill</th><th>Description</th><th>Member Vote</th><th>Bill Number</th><th style=\"width:100px;\">Date</th></tr>";
    while($row_votes = mysqli_fetch_assoc($sql_bill)){
     if ($row_votes["vote_type_id"] == $row_votes["desired_vote_type_id"]) {
//           $span = " style=\"background-color:" . $bgcolor1 . ";\"";
	$alt="Desired Vote";
	$icon = "<img height=\"32\" width=\"32\" src=\"images/greencheck.png\" alt=\"$alt\" title=\"$alt\">";
  } else if ($row_votes["vote_type_id"] != -1 ){ // --not N/A
 //          $span=" style=\"background-color:" . $bgcolor2 . ";\"";
	$alt="Wrong Vote";
	$icon = "<img height=\"32\" width=\"32\" src=\"images/redx.png\" alt=\"$alt\" title=\"$alt\">";
"<img height=\"32\" width=\"32\" src=\"".$icon."\" alt=\"$alt\" title=\"$alt\">";

} else {
	$icon="";
  }
  $span = str_replace("#","",$span);
  
  $vote_text = "<td ".$span. ">".$row_votes["vote"].$icon. "</td>";
  $name_text = "<a href='bill_detail.php?legislation_id=".$row_votes["legislation_id"]."'>"."<span style=\"font-size:larger\">" . $row_votes["legislation_name"]."</span></a>";
    $number_text = $row_votes["bill_number"];
  if ($alternate_shade) {
  echo "<tr>" ;
  }
  else {
  echo  "<tr style=\"background-color:#AADDAA\">";
}
  $alternate_shade = !$alternate_shade;
echo "<td>";



  echo  $name_text."</td>";
echo "<td>" . $row_votes["description"]."</td>\n";
  echo  $vote_text  . "<td>".$number_text."</td><td align=\"center\">";

if ($row_votes["legislation_date"]  == "0000-00-00") {
echo "TBD" ; } else {
echo $row_votes["legislation_date"] ;
}
echo "</td>";

  echo "       </tr>\n";
    }  // while votes
    echo "</table>\n";
    /* free result set */
    mysqli_free_result($sql_voter);
    mysqli_free_result($sql_bill);
  //mysqli_close(); // do this for tidyness


    // now to leave PHP and go back to straight HTML

    ?>
  </table>
</body>
</html>
