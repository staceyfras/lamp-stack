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

    <?php
        $servername = "ecsmysql";
        $username = "cs332a20"; 
        $password = "mypassword"; //change to server pass

        // Create connection
        $conn = mysqli_connect($servername, $username, $password);
        
        // Check connection
        if (!$conn) {
            die("Connection failed: " . mysqli_connect_error());
        } else {
            //connect and enter mainform div ie yellow console
            echo "Connected successfully";
            print <div style="text-align:left" class='table'>;
            print CURRENT CWID:
            echo $_POST["cwid"];
            print <div style="padding-top: 100px" class='cell mainform'>
                //entered mainform
                $query="select * from PROFESSORS";
                print "<table> n";


            print </div>
        print </div>
            
        }

    ?>
        <br>
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
