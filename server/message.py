

header("Content-type: application/json");
$key = "key";
$path_parts = explode("/", $_SERVER['PATH_INFO']);
$path = $path_parts[ count($path_parts)-1 ];
$success = "0";
$hash = "";

if ($path == "form") {
   $msg = $_POST['message'];
   $hash = $_POST['hash'];
   $hmac_hash = hash_hmac('sha256', $msg, $key);
   if ($hmac_hash == $hash) { 
      $success = "1";
   } 
} elseif ($path == "body") {
  $msg = $HTTP_RAW_POST_DATA;
  //echo $msg;
  $headers = getallheaders();
  $hash = $headers['Hash'];
  $hmac_hash = hash_hmac('sha256', $msg, $key);
  if ($hmac_hash == $hash){
     $success =   "1";
  }

}

echo "{\"success\":\"".$success."\", \"hash\":\"".$hash."\"}\n";

?>