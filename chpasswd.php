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

$page_name="chpasswd.php";
$page_title = "Voter Scorecard Change Password Action";
?>
<?php  include 'header.php'; // need this for db connection ?>
<?php  $submitted_username = '';
    
    if(!empty($_POST))
    {
//    echo $_POST['username'] . "<br>";
  //  echo $_POST['oldpassword'] . "<br>";
//    echo $_POST['newpassword1'] . "<br>";
//    echo $_POST['newpassword2'] . "<br>";
        // This query retrieves the user's information from the database using
        // their username.
        $query = "
            SELECT
                id,
                username,
                password
            FROM users
            WHERE
                username = '" . $_POST['username'] . "'";  
  //      echo $query;

            // Execute the query against the database

	    $sql_query = mysqli_query($link, $query);


	    $row = mysqli_fetch_assoc($sql_query);
	    $login_ok = false;
        
            $check_password = hash('sha256', $_POST['oldpassword'] );
//	    	    echo "<br>" . $check_password;
//	    echo "<br>" . $row['password'];
//	    echo "<br>" . $row['username'];	
            if($check_password === $row['password'])
            {
                $login_ok = true;
            }
        
        if($login_ok)
	        {
		if ($_POST['newpassword1'] === $_POST['newpassword2']) {
			   // passwords match and new password checks out

		           $query = " UPDATE  users   set " .  
			         "password='" . hash('sha256', $_POST['newpassword1']) . "'" .
				 "WHERE  username = '" . $_POST['username'] . "'";  
        

				// Execute the query against the database
		    //		echo $query;
				$sql_query = mysqli_query($link, $query);

				echo "password changed.";


	    }
	    else 
	    { print "passwords don't match";
	    }
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

