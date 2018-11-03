<html>

<head>
    <title>Student Portal</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>

<body>
    <p>
        <a href="index.html" style="color:white">HOME</a> | <a href="info.html" style="color:white">INFO</a> | <a href="http://ecs.fullerton.edu/cs332a20/studentInterface.php" style="color:white">STUDENT INTERFACE</a> | <a href="http://ecs.fullerton.edu/cs332a20/professorInterface.php" style="color:white">PROFESSOR INTERFACE</a>
    </p>

    <form action="studentInterface.php" method="post">
        Student CWID: <input type="text" name="cwid">
        <input type="submit" value="SUBMIT">
    </form>
    <?php
        $servername = "ecs.fullerton.edu/cs322a20";
        $username = "cs332a20";
        $password = "mypassword";

        // Create connection
        $conn = mysqli_connect($servername, $username, $password);

        // Check connection
        if (!$conn) {
            die("Connection failed: " . mysqli_connect_error());
        } else {
            echo "Connected successfully";
        }

    ?>
        <div style="text-align:left" class='table'>
            CURRENT CWID:
            <?php echo $_POST["cwid"]; ?>
            <div style="padding-top: 100px" class='cell mainform'>
                Hello


            </div>
        </div>

</body>

</html>
