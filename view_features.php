<html>
<head>
</head>
<body>
  <?php
    $link = mysqli_connect("localhost", "root", "", "blinkbox_iOS_test_suite");

    // Check connection
    if($link === false){
      die("ERROR: Could not connect. " . mysqli_connect_error());
    }

    echo "<p id='output_features'>";

    $sql = "SELECT id, name, description FROM feature";
    $result = mysqli_query($link, $sql);

    if (mysqli_num_rows($result) > 0) {
      echo "<table border=1><tr><th>ID</th><th>Name</th><th>Description</th></tr>";
      // output data of each row
      while($row = mysqli_fetch_assoc($result)) {
        echo "<tr><td>".$row["id"]."</td><td>".$row["name"]."</td><td>".$row["description"]."</td></tr>";
      }
    } else {
      echo "0 results";
    }

    echo "</table>";

    echo "</p>";

    mysqli_close($link)
  ?>
</body>
</html>