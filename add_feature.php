<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Add Feature Form</title>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    </head>
    <body>
        <form action="insert_feature.php" method="post">
            <p>
                <label for="featureName">Feature:</label>
                <input type="text" name="feature_name" id="input_feature_name" required>
            </p>
            <p>
                <label for="featureDescription">Feature Description:</label>
                <input type="text" name="feature_description" id="input_feature_description">
            </p>
            <input type="submit" value="Add Feature" id="submit_feature">
        </form>
        <p>
            <a href="index.html">Home</a>
        </p>
    </body>
</html>
