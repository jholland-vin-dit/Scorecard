<?php
 /*
 This file is part of Scorecard, Copyright 2013-2014 Dan Robinson and John Holland.

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
$issue_id=$_GET["issue_id"];
$_SESSION["issue_id"]=$issue_id;
$_SESSION["body_id"]=$body_id;

if ($_GET["body_year"] == null) {
    if ($_SESSION["body_year"] <> null){
      $body_year = $_SESSION["body_year"];
    }else{
        $body_year = "2013";
  }
} else {
  $body_year="" + $_GET["body_year"];
}
$_SESSION["body_year"]=$body_year;
?>
<?php
$page_name="index.php";
$page_title = "Voter Scorecard";

$legislation_issues_to_view = ' is not null ';
$heading_clause = ' for all issues ';
?>
<script language="Javascript">
function myfunc(selectObj){
//alert("in myfunc");
if (selectObj.value != ''){
//alert(selectObj.value);
}
selectObj.form.submit();
}
</script>
<?php  include 'header.php'; ?>
<?php  include 'common.php'; ?>


<table class="bottomtable"><tr><td width="65%">
  <?php //include 'http://192.168.61.98/Scorecard/voters_ratings.php' . '?issue_id=0&heading_clause=' . urlencode($heading_clause)   ; 
 
 
 $issue_id = $_GET["issue_id"];


$str_ratings = "select voter_id,last_name,first_name,party_name, district, ";
$str_ratings .= "if(all_votes=0,0,floor(.5+100*(good_votes/all_votes))) percentage ";
$str_ratings .= "from ";
$str_ratings .= "(";
$str_ratings .= "select voters.id voter_id, voters.first_name,voters.last_name, ";
$str_ratings .= "sum(IF(votes.vote_type_id = mtx.desired_vote_type_id,1,0)) good_votes, ";
$str_ratings .= "count(votes.vote_type_id) all_votes, tbl_parties.name party_name, voters.district district ";
$str_ratings .= "from tbl_voters voters  ";
$str_ratings .= "left outer join tbl_parties on voters.party_id = tbl_parties.id    ";
$str_ratings .= "left outer join tbl_votes votes on voters.id = votes.voter_id ";
$str_ratings .= "left outer join tbl_legislation legislation on votes.legislation_id = legislation.id ";
$str_ratings .= "left outer join mtx_legis_party_desired_vote_types mtx on legislation.id = mtx.legislation_id  ";
$str_ratings .= "left join mtx_voters_bodies voters_bodies on voters_bodies.voter_id=voters.id  ";
$str_ratings .= "where voters_bodies.year=" . $body_year ;
$str_ratings .= " and votes.vote_type_id <> -1" ; // N/A's don't count

if ($issue_id <> 0) {
$str_ratings .= " and legislation.issue_id = " . $issue_id ;
}
$str_ratings .= " group by last_name,first_name,party_name, district  ";
$str_ratings .= ")  ";
$str_ratings .= "subquery order by percentage desc, last_name,first_name ; ";


//echo $str_ratings;


$sql_ratings = mysqli_query($link, $str_ratings);

$ratings_count = mysqli_num_rows($sql_ratings);
echo "<table class=\"bottomtablenowidth\"><tr><td>";
echo "<font size=4>Legislators and their ratings ";
echo $_GET["heading_clause"]; 
echo "</font></td><tr></table>";

// print list of voters and their votes
// taking it out of a table so it can be used in other page better
echo "<table  class=\"bottomtablenowidth\">";
while($row_ratings = mysqli_fetch_assoc($sql_ratings)){
  echo "<tr><td><a href=\"voter_detail.php?voter_id=".$row_ratings["voter_id"]."\">" . $row_ratings["first_name"] . " " . $row_ratings["last_name"] .  ", " . $row_ratings["district"] . ", " .  $row_ratings["party_name"] .
 "</a></td><td>"
    . $row_ratings["percentage"] . "% </td><td>" ;
  $TOTAL_CELLS=100;
  $num_of_green_cells = intval($TOTAL_CELLS * $row_ratings["percentage"]/100);
  echo "<table style=\"border-collapse:collapse;\">";
  echo "<tr style=\"height:20px;\">\n";

  for ($n=0;$n<$num_of_green_cells;$n++)
    {echo "<td width=\"1px\" style=\"padding:0;margin:0;background-color:" . $bgcolor1 . ";\"> </td>";
    }
  for ($n=0;$n<$TOTAL_CELLS-$num_of_green_cells;$n++){
    echo "<td width=\"1px\" style=\"padding:0;margin:0;background-color:" . $bgcolor2 . ";\"> </td>";
  }
  echo "</tr></table></td>\n";
  echo "</tr>\n";
}
echo "</table>\n";
 
 
  ?>
</td>
<td width="35%"> 
    <?php 
        /* check connection */
      if (mysqli_connect_errno()) {
  printf("Connect failed: %s\n", mysqli_connect_error());
  exit();
      }
     echo "<br>";
     $sql_issues=
"select issues.title title, subtitle, synopsis, name, issues.id as issue_id, \n" .
"issues.description, issues.pro_environment_vote from tbl_issues issues " . 
" inner join tbl_big_issues big_issues on issues.big_issue_id=big_issues.id " .
" order by issues.title desc ;";
      echo "<table class=\"bottomtablenowidth\">\n";
      echo "<tr><td><font size=\"4\">All Issues</font></td></tr>\n";
    $current_color=$color1;
    $color_toggle=true;

      if ($sql_issues = mysqli_query($link, $sql_issues)) {
        while($row_issues = mysqli_fetch_assoc($sql_issues))

    {
      if (!$color_toggle){
        $current_color=$color1;
        $color_toggle=true;
      }else{
        $current_color=$color2;
        $color_toggle=false;
      }
      
        $str_legislation = "select * from tbl_legislation " .
        "where issue_id = " . $row_issues["issue_id"] . 
        " and tbl_legislation.year = " . $body_year . ";";

      echo "<tr>\n";
        if ($sql_legislation = mysqli_query($link, $str_legislation)){
               echo "<td valign=top bgcolor=".$current_color."><font size=4><b>\n";
            echo "<a href=\"legislation_listing.php?issue_id=".$row_issues["issue_id"]."\">\n";
            echo $row_issues["title"]."</a></b></font>\n";
            echo "</td></tr>\n";
        } // if sql_legislation
       } //while
     } //if
    echo "</table>\n";
  //  mysqli_free_result($sql_voters);
  //  mysqli_free_result($sql_legislation);
  //mysqli_close(); // do this for tidyness
      // now to leave PHP and go back to straight HTML
//echo "end s:" .$_SESSION["body_year"]."<br>";

    ?>

</td></tr></table>


</body>
</html>
