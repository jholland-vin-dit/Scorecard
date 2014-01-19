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

$page_name="login.php";
$page_title = "Voter Scorecard Login";
?>
<?php  include 'header.php'; ?>
<?php  $submitted_username = '';
    
    // This if statement checks to determine whether the login form has been submitted
    // If it has, then the login code is run, otherwise the form is displayed
    if(!empty($_POST))
    {

        // This query retreives the user's information from the database using
        // their username.
        $query = "
            SELECT
                id,
                username,
                password
            FROM users
            WHERE
                username = '" . $_POST['username'] . "'";  
        
        // The parameter values
        $query_params = array(
            ':username' => $_POST['username']
        );
            // Execute the query against the database

$sql_query = mysqli_query($link, $query);


    $row = mysqli_fetch_assoc($sql_query);
        $login_ok = false;
        
            $check_password = hash('sha256', $_POST['password'] );

            if($check_password === $row['password'])
            {
                $login_ok = true;
            }
?>

<table width="600px" class="bottomtablenowidth">
<tr><td align="center"><span style="font-size:large;">Login</span></td></tr>
i<span 
<tr><td>
<form action="login.php" method="post">
    <table class="bottomtablenowidth"><tr><td>Username:</td><td>
    <input type="text" name="username" value="<?php echo $submitted_username; ?>" />
    </td></tr>
    <tr><td>Password:</td><td>
    <input type="password" name="password" value="" />
    </td></tr><tr><td colspan="2" align="center">
    <input type="submit" value="Login" /></td></tr>
</form>
<form action="logout.php" method="post">
	<tr><td colspan="2" align="center"><input type="submit" value="Logout" /></td></tr>
</form>
</table>

<?php        
        if($login_ok)
        {
            $_SESSION['user'] = $row['username'];
	    if ($row['username'] == 'root'){
	    $_SESSION['root'] = 'root';
}

        	echo "<table class=\"bottomtablenowidth\" style=\"border:0;\"><tr><td><span style=\"color:red;\"><h3> User \"" . $_SESSION['user'] . "\" logged in successfully. <br><br><br> Congratulations! You have logged in successfully." . 
" To add or edit a bill, click on \"Return to front page\" in blue at the top of this screen, then choose the bill's Issue area. You will see Add Legislation button on the top right of each Issue page, and Edit at the top right of each
bill. </span>";    
 echo "<br><br>At any time, click on any blue text for related information, or to move to another page.<br></td></tr></table>";
        }
        else
        {
            // Tell the user they failed
            print("<table class=\"bottomtablenowidth\" style=\"border:0;\"><td><td><h1><span style=\"color:red;\">Login Failed. </span></h1></td></tr></table>");

if(isset($_SESSION['user']))
  unset($_SESSION['user']);
            
        }
    }
    
?>
<form action="chpasswd.php" method="post">
<br><br><h3>Change password</h3>
<table class="bottomtablenowidth"><tr><td>
Username:</td><td> <input type="text" name="username" value="" > </td></tr>
<tr><td>Old Password:</td><td> <input type="password" name="oldpassword" value="" > </td><tr>
<tr><td>New Password: </td><td><input type="password" name="newpassword1" value=""></td</tr>
<tr><td>New Password(confirm): </td><td><input type="password" name="newpassword2" value=""></td></tr>
<tr><td colspan="2" align="center"><input type="submit" value="Change password"></td></tr>
</table>
</form>
</td></tr></table>
</body>
</html>
