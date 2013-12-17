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
<?php
// here we capture a variable from the sending page form 
$title = $_POST["title"];
// now set up the database connection
$mysql_link = mysql_connect("localhost", "jholland", "p@ssword!@#");
mysql_select_db("homeint_jholland", $mysql_link) or die("Unable to select the database...");
// now create a sql command
$sql_names = "insert into names (title) values ('$title') ;";
//echo "test:".$sql_names; // print it on screen to ensure that the variable came through - if you do this comment the header below
// run the command
mysql_query($sql_names, $mysql_link);
// go back to where you came from
header ("location:index.php");
?>
