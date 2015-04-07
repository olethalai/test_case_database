<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Add Scenario Form</title>
    </head>
    <body>
        <form action="insert_scenario.php" method="post">
            <p>
                <input type="reset" value="Reset form">
            </p>
            <p>
                <label for="featureList">Feature:</label>
                <?php
                    $link = mysqli_connect("localhost", "root", "", "blinkbox_iOS_test_suite");

                    $sql = "SELECT name FROM feature";
                    $result = mysqli_query($link, $sql);

                    echo "<select name='feature_name' id='input_feature_name' required>";
                    echo "<option disabled selected>-- Select a feature --</option>";
                    while ($row = mysqli_fetch_array($result)) {
                        echo "<option value='" . $row['name'] . "'>" . $row['name'] . "</option>";
                    }
                    echo "</select>";
                ?>
            </p>

            <p>
                <label for="scenarioTitle">Scenario Title:</label>
                <input type="text" name="scenario_title" id="input_scenario_title" required>
            </p>
            <p>
                <label for="scenarioDescription">Scenario Description:</label>
                <input type="text" name="scenario_description" id="input_scenario_description">
            </p>
            <p>
                <label for="steps">Steps:</label>
                <textarea rows=7 cols=80 name="steps" id="input_steps" required></textarea>
            </p>
            <input type="submit" value="Add Scenario" id="submit_scenario">
        </form>
        <p>
            <a href="index.html">Home</a>
        </p>
    </body>
</html>
