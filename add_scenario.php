<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Add Scenario Form</title>
    </head>
    <body>
        <form action="add_scenario.php" method="post">
            <p>
                <label for="featureList">Feature:</label>
                <?php
                    $link = mysqli_connect("localhost", "root", "", "blinkbox_iOS_test_suite");

                    $sql = "SELECT name FROM feature";
                    $result = mysqli_query($link, $sql);

                    echo "<select name='features' required>";
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
                <label for="scenarioDescription">Feature Description:</label>
                <input type="text" name="scenario_description" id="input_scenario_description">
            </p>
            <p>
                <label for="steps">Steps:</label>
                <textarea rows=7 cols=80 name="steps" id="input_steps" required></textarea>
            </p>
            <input type="submit" value="Add Scenario">
        </form>
    </body>
</html>
