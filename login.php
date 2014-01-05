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
            //$check_password =  $_POST['password'] ;
            if($check_password === $row['password'])
            {
                $login_ok = true;
            }
        
        if($login_ok)
        {
            $_SESSION['user'] = $row['username'];

        	echo "<br> user: " . $_SESSION['user'] . " logged in successfully <br>";    
        }
        else
        {
            // Tell the user they failed
            print("Login Failed.");

if(isset($_SESSION['user']))
  unset($_SESSION['user']);
            
        }
    }
    
?>
<h1>Login</h1>
<form action="login.php" method="post">
    Username:<br />
    <input type="text" name="username" value="<?php echo $submitted_username; ?>" />
    <br /><br />
    Password:<br />
    <input type="password" name="password" value="" />
    <br /><br />
    <input type="submit" value="Login" />
</form>
<form action="logout.php" method="post">
	<input type="submit" value="Logout" />
</form>
</body>
</html>
