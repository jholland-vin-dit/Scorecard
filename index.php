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


<table class="bottomtable"><tr><td width="65%">
<?php  include 'http://192.168.61.98/Scorecard/voters_ratings.php' . '?issue_id=0&heading_clause=' . urlencode($heading_clause)   ; ?>
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
	  mysqli_free_result($sql_voters);
	  mysqli_free_result($sql_legislation);
mysqli_close(); // do this for tidyness
	    // now to leave PHP and go back to straight HTML
//echo "end s:" .$_SESSION["body_year"]."<br>";

    ?>

</td></tr></table>


</body>
</html>
