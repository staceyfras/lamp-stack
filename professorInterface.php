<html>

<head>
    <title>Professor Portal</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>

<body>

    <p>
        <a href="index.html" style="color:white">HOME</a> | <a href="info.html" style="color:white">INFO</a> | <a href="http://ecs.fullerton.edu/cs332a20/studentInterface.php" style="color:white">STUDENT INTERFACE</a> | <a href="http://ecs.fullerton.edu/cs332a20/professorInterface.php" style="color:white">PROFESSOR INTERFACE</a>
    </p>

    <form action="professorInterface.php" method="post">
        Professor SSN: <input type="text" name="ssn">
        <input type="submit" value="SUBMIT">
    </form>

    <div style="text-align:left" class='table'>
        CURRENT SSN:
        <?php echo $_POST["ssn"]; ?>
        <div style="padding-top: 100px " class='cell mainform'>
            Hello
            <?php echo $_POST["ssn"]; ?>


        </div>
    </div>


</body>

</html>
