<?php



$link = mysqli_connect("localhost","scorecarduser",  "", "scorecard");

//$link = mysqli_connect("localhost", "v1n-d1t", "v1n-d1tGreen", "homeint_votes_dev");



/* check connection */
if (mysqli_connect_errno()) {
    printf("Connect failed: %s\n", mysqli_connect_error());
    exit();
}
?>
