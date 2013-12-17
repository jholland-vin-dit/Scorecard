<?php
echo "<table border=1><tr><td>session key</td><td>value</td></tr>";
foreach ($_SESSION as $key=>$val)
{
echo "<TR><td>".$key."</td><td>".$val."</td></tr>";
}
echo "</table>";
?>