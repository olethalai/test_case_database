<?php
/* Attempt MySQL server connection. Assuming you are running MySQL
server with default setting (user 'root' with no password) */
$link = mysqli_connect("localhost", "root", "", "blinkbox_iOS_test_suite");

// Check connection
if($link === false){
    die("ERROR: Could not connect. " . mysqli_connect_error());
}

// Escape user inputs for security
$feature_name = mysqli_real_escape_string($link, $_POST['feature_name']);
$scenario_name = mysqli_real_escape_string($link, $_POST['scenario_title']);
$scenario_description = mysqli_real_escape_string($link, $_POST['scenario_description']);

// Create scenario using feature ID
$sql = "INSERT INTO scenario (title, description, feature_id) SELECT '$scenario_name' as title, '$scenario_description' as description, id as feature_id FROM feature WHERE name = '$feature_name'";
if(mysqli_query($link, $sql)){
    echo "Scenario record added successfully.\n";
} else{
    echo "ERROR: Could not execute $sql. " . mysqli_error($link);
}
$scenario_id = mysqli_insert_id($link);

// Then create steps using scenario ID
$steps = explode("\n", $_POST['steps']);
foreach ($steps as $step) {
  $sql = "INSERT INTO step (description, scenario_id) VALUES ('$step', $scenario_id)";
  if(mysqli_query($link, $sql)){
      echo "Step record added successfully.\n";
  } else{
      echo "ERROR: Could not execute $sql. " . mysqli_error($link);
  }
}

// close connection
mysqli_close($link);
?>
<html>

<head>
</head>

<body>
  <p>
    <a href="index.html">Home</a>
  </p>
</body>

</html>
