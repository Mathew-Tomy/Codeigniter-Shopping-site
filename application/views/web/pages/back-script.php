<?php

define('DB_SERVER','localhost');
define('DB_USER','root');
define('DB_PASS' ,'');
define('DB_NAME', 'shopping');
$con = mysqli_connect(DB_SERVER,DB_USER,DB_PASS,DB_NAME);
// Check connection
if (mysqli_connect_errno())
{
 echo "Failed to connect to MySQL: " . mysqli_connect_error();
}
if (isset($_GET['term'])) {
     
   $query = "SELECT * FROM tbl_product WHERE product_title LIKE '{$_GET['term']}%' LIMIT 25";
    $result = mysqli_query($con, $query);
 
    if (mysqli_num_rows($result) > 0) {
     while ($user = mysqli_fetch_array($result)) {
      $res[] = $user['product_title'];
     }
    } else {
      $res = array();
    }
    //return json res
    echo json_encode($res);
}
?>