<?php
$TOKEN = "INSERT_RANDOM_TOKEN_HERE";
# Capture JSON content
$input=json_decode(file_get_contents('php://input'), true);
# Check if correct TOKEN passed or else redirect to Google
if($input['token'] != $TOKEN) {
  header('Location: http://www.google.com/');
  exit;
}
switch ($input['type']) {
  
case 'Raspberry_Pi':
  if ($input['action'] == "toggle") {
    $output=shell_exec("echo '/opt/air_purifier.sh on'");
    exit;
  }
}
?>
