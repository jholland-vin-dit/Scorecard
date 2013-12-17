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
<?php $page_title="enviro listing page--bill detail";
session_start()
?>
<?php include 'connection_string.php'; ?>
<?php include 'header.php'; ?>
    <?php 
      $voter_id=$_GET["voter_id"];
    /* check connection */

    // FIXME - done!
    $year=$_SESSION["year"];
    //get and print voter

    $str_voter = "SELECT voters.body_id, first_name,last_name, parties.name as party_name, bodies.name as body_name ";
    $str_voter .= " FROM tbl_voters voters, tbl_parties parties,tbl_bodies bodies "; 
    $str_voter .= "where parties.id = voters.party_id ";
    $str_voter .= "and bodies.id = voters.body_id ";
    $str_voter .= "and voters.id =".$voter_id.";";

//    echo $str_voter;

    $sql_voter = mysqli_query($link, $str_voter);
    $voter_count = mysqli_num_rows($sql_voter);

    $row_voter = mysqli_fetch_assoc($sql_voter);
	echo "<table class=bottomtable>";
    echo "<tr><td>";
	echo "<h3>".$row_voter["first_name"]." ".$row_voter["last_name"]."</h3>";
    echo "<h4>".$row_voter["party_name"].", " 
    ."<a href=\"index.php?body_id=". $row_voter["body_id"]."\">"
    .$row_voter["body_name"]."</a></h4>";
    echo "</td></tr>";
	echo "</table>";
	
    // get and print rating number - good votes first
$str_good_number = "SELECT count(*) thecount ";
$str_good_number .= " FROM tbl_votes votes, tbl_legislation legislation ";
$str_good_number .= " WHERE votes.legislation_id = legislation.id ";
$str_good_number .= " and exists (select *";
$str_good_number .= " from mtx_legis_party_desired_vote_types mtx ";
$str_good_number .= " where mtx.legislation_id = legislation.id";
$str_good_number .= " and mtx.desired_vote_type_id =votes.vote_type_id ";
$str_good_number .= " and mtx.party_id=3)";
$str_good_number .= " AND votes.voter_id=".$voter_id.";";

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
$str_all_number .= " AND votes.voter_id=".$voter_id.";";

    $sql_all_number  = mysqli_query($link, $str_all_number);
    $all_number_count = mysqli_num_rows($sql_all_number);
    $row_all_number = mysqli_fetch_assoc($sql_all_number);
//echo "<h1>".$row_good_number["thecount"]."<h1>\n";
//echo "<h1>-----</h1>\n";
//echo "<h1>".$row_all_number["thecount"]."</h1>\n";
    // Get and print votes
$TOTAL_CELLS=140;  // total number of cells in thermometer table
$all_number=$row_all_number["thecount"];
$good_number=$row_good_number["thecount"];

echo "numbers:" . $all_number . " " . $good_number . "<br>";
if ($all_number != 0) {
$num_of_green_cells = intval(($TOTAL_CELLS * $good_number) / $all_number);
}
else {
$num_of_green_cells = 0;
}

//echo $num_of_green_cells . "<br>";

echo "<table class=votebartable>";
echo "<tr><td style=\"color:green;\">Green</td>";
    for ($n=0;$n<$TOTAL_CELLS-2;$n++)
{
echo "<td width=\"2px\" style=\"padding:0;margin:0;background-color:#ccffcc;\"> </td>";
    }
echo "<td style=\"color:red;text-align:right;\">Ungreen</td></tr>\n";
echo "<tr style=\"height:25px;\">\n";

for ($n=0;$n<$num_of_green_cells;$n++)
{echo "<td width=\"2px\" style=\"padding:0;margin:0;background-color:green;\"> </td>";
}
for ($n=0;$n<$TOTAL_CELLS-$num_of_green_cells;$n++){
echo "<td width=\"2px\" style=\"padding:0;margin:0;background-color:red;\"> </td>";
 }
echo "</tr></table>\n";


//$TOTAL_CELLS=300;  // total number of cells in thermometer table
$all_number=$row_all_number["thecount"];
$good_number=$row_good_number["thecount"];
echo "<br>all_number: ".$all_number;
echo "<br>good_number: ".$good_number;
echo "<br>num_of_green_cells: ".$num_of_green_cells;

echo "<table border=1 align=center color=white>";
echo "<tr><td style=\"color:green;\">Green</td>";
    for ($n=0;$n<$TOTAL_CELLS-2;$n++)
{
echo "<td width=\"1px\" style=\"padding:0;margin:0;background-color:white;\"> </td>";
    }
echo "<td style=\"color:red;text-align:right;\">Ungreen</td></tr>\n";
echo "<tr style=\"height:25px;\">\n";

for ($n=0;$n<$num_of_green_cells;$n++)
{echo "<td width=\"1px\" style=\"padding:0;margin:0;background-color:green;\"> </td>";
}
for ($n=0;$n<$TOTAL_CELLS-$num_of_green_cells;$n++){
echo "<td width=\"1px\" style=\"padding:0;margin:0;background-color:red;\"> </td>";
 }
echo "</tr></table>\n";







$str_bill = "SELECT votes.vote_type_id, mtx.desired_vote_type_id, vote_types.vote ";
    $str_bill .= ",legislation_date, legislation_name,description,votes.legislation_id ";
    $str_bill .= "FROM tbl_votes votes, tbl_legislation legislation ";
    $str_bill .=  ",tbl_vote_types vote_types ";
    $str_bill .= ", mtx_legis_party_desired_vote_types mtx ";
    $str_bill .= "WHERE votes.legislation_id = legislation.id ";
    $str_bill .= "and vote_types.id=votes.vote_type_id ";
    $str_bill .= "and  mtx.legislation_id=legislation.id  ";
    $str_bill .= "AND votes.voter_id =" . $voter_id. " "; 
    $str_bill .= "order by legislation_date";
    $str_bill .= ";";



//    echo $str_bill;

    $sql_bill = mysqli_query($link, $str_bill);
    $bill_count = mysqli_num_rows($sql_bill);
  //  echo "bill_count:" . $bill_count;
    


    echo "<table class=bottomtable>\n";
    while($row_votes = mysqli_fetch_assoc($sql_bill)){
   	if ($row_votes["vote_type_id"] == $row_votes["desired_vote_type_id"]) {
           $span = " style=\"background-color:green;\"";
	} else {
           $span=" style=\"background-color:red;\"";
	}
	
	$vote_text = "<td ".$span. ">".$row_votes["vote"]."</td>";
	$name_text = "<a href='bill_detail.php?legislation_id=".$row_votes["legislation_id"]."'>".$row_votes["legislation_name"]."</a>";

	echo "<tr><td>" . $row_votes["legislation_date"] . "</td><td>";
	echo $name_text."</td><td>" . $row_votes["description"]."</td>\n";
	echo $vote_text;



	echo "</td></tr>\n";
    }  // while votes
    echo "</table>\n";
    /* free result set */
    mysqli_free_result($sql_voter);
    mysqli_free_result($sql_bill);
    mysqli_close(); // do this for tidyness


    // now to leave PHP and go back to straight HTML

    ?>
  </table>
</body>
</html>
