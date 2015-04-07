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
$feature_description = mysqli_real_escape_string($link, $_POST['feature_description']);

echo "<p id='sql_outcome'>";

// attempt insert query execution
$sql = "INSERT INTO feature (name, description) VALUES ('$feature_name', '$feature_description')";
if(mysqli_query($link, $sql)){
    echo "Feature record added successfully.";
} else{
    echo "ERROR: Could not execute $sql. " . mysqli_error($link);
}

echo "</p>";

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
