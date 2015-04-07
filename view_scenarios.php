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

    echo "<p id='output_scenarios'>";

    // Get all features
    $feature_sql = "SELECT id, name, description FROM feature";
    $feature_result = mysqli_query($link, $feature_sql);

    if (mysqli_num_rows($feature_result) > 0) {
      // Output data of each feature row
      while($feature_row = mysqli_fetch_assoc($feature_result)) {
        echo "<p id='".$feature_row["name"]."'>";
        echo "<h2 class='feature_heading'>".$feature_row["id"].": ".$feature_row["name"]."</h2>";
        echo $feature_row["description"];

        // Get all scenarios for this feature
        $scenario_sql = "SELECT id, title, description FROM scenario WHERE scenario.feature_id = ".$feature_row["id"];
        $scenario_result = mysqli_query($link, $scenario_sql);
        // Output data of each scenario row
        while($scenario_row = mysqli_fetch_assoc($scenario_result)) {
          echo "<h3 class='scenario_heading'>".$scenario_row["title"]."</h3>";
          if($scenario_row["description"] != "") {
            echo $scenario_row["description"]."<br/>";
          }

          // Get all steps for this scenario
          $step_sql = "SELECT description FROM step WHERE step.scenario_id = ".$scenario_row["id"];
          $step_result = mysqli_query($link, $step_sql);
          // Output data of each step row
          while($step_row = mysqli_fetch_assoc($step_result)) {
            echo $step_row["description"]."<br/>";
          }
        }
        echo "</p>";
      }
    } else {
      echo "0 feature results";
    }

    mysqli_close($link)
  ?>
  <p>
    <a href="index.html">Home</a>
  </p>
</body>
</html>
