<html>

<head>
    <title>Student Portal -- Results</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>

<body>
    <p>
        <a href="index.html" style="color:white">
                RETURN HOME
            </a> |
        <a href="studentPortal.html" style="color:white">
                BACK TO PORTAL
            </a> |
        <a href="info.html" style="color:white">
                INFO
            </a>
    </p>
    <br>
    <?php
        // Create connection for csuf server
        // param @ conn(server, user, password, database_name)
        $conn = new mysqli("ecsmysql", "cs332a20", "hievoosi", "cs332a20");
        //$conn = new mysqli("localhost", "root", "", "cs332a19");
        //Check connection. Quit if failed.
        if ($conn->connect_errno) {
            echo "failed to connect to MySql: (" . $conn->connect_errno . ")" . $conn->connect_error;
            exit("Terminating..."); // this should quit the php script
        }
        function get_query($conn)
        {
            //Query: Display Grades + Classes of given CWID
            if (isset($_POST["cwidQuery"])) {
                $cwid = $_POST["cwidQuery"];
                $stringOfQuery = "SELECT cTitle, rSecNum, rGrade from records INNER JOIN sections on records.rSecNum = sections.Snum INNER JOIN courses on sections.sCourseNum = courses.cNum WHERE records.rCWID =${cwid};";
                $sqlresult = $conn->query($stringOfQuery);
                if($sqlresult->num_rows <= 0) {
                  printf("Error: %s\n", $conn->error);
                }
            }
            //Query: Display sections available of a given course
            if (isset($_POST["courseQuery"])) {
            //placeholder function
                $course = $_POST["courseQuery"];
                $stringOfQuery = "SELECT * from sections INNER JOIN courses WHERE cNum =${course};";
                $sqlresult = $conn->query($stringOfQuery);
                if($sqlresult->num_rows <= 0) {
                  printf("Error: %s\n", $conn->error);
                }
            }
            return $sqlresult;
        }
        function sql_to_html_table($result, $delim = "\n")
        {
        // starting table
        $htmltable = "<table style='border: 1px solid white'>" . $delim;
        $counter = 0;
        // putting in lines
        while ( $row = $result->fetch_assoc() ) {
            if ($counter == 0) {
        // table header
                $htmltable .= "<tr style='border: 1px solid white'>" . $delim;
                foreach ($row as $key => $value) {
                    $htmltable .= "<th style='border: 1px solid white'>" . $key . "</th>" . $delim;
                }
                $htmltable .= "</tr>" . $delim;
                $counter++;
            }
        // table body
            $htmltable .= "<tr style='border: 1px solid white'>" . $delim;
            foreach ($row as $key => $value) {
                $htmltable .= "<td style='border: 1px solid yellow'>" . $value . "</td>" . $delim;
            }
            $htmltable .= "</tr>" . $delim;
        }
            // closing table
        $htmltable .= "</table>" . $delim;
        // return
        $result->free();
        return ($htmltable);
        } //END FUNCTION
        ?>
        <h3>Results</h3>
        <div style="text-align:left" class='table'>
            <?php
            $sqlresult = get_query($conn);
            if ($sqlresult != null) { echo sql_to_html_table($sqlresult, $delim = "\n"); }
            else { echo "Failed to print" . "\n"; }
            mysqli_close($conn);
            ?>
        </div>
</body>

</html>
