<html>
<head>
    <title>Student Portal</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>

<body>
  <p>
            <a href="index.html" style="color:white">
                RETURN HOME
            </a>
            |
            <a href="studentPortal.html" style="color:white">
                 RETURN STUDENT PORTAL
            </a>
            |
            <a href="info.html" style="color:white">
                INFO
            </a>
  </p>
  <?php

    // Create connection for csuf server
    //conn = new mysqli("ecsmysql", "cs332a20", "hievoosi", "database_name")

    $conn = new mysqli("localhost", "root", "", "cs332a18");
    //Check connection. Quit if failed.
    if ($conn->connect_errno) {
        echo "failed to connect to MySql: (" . $conn->connect_errno . ")" . $conn->connect_error;
        exit("Terminating..."); // this should quit the php script
    }

    function get_query($conn)
    {
        if (isset($_POST['cwidQuery'])) {
            $stringOfQuery = "SELECT * FROM STUDENTS WHERE sCWID = '" . $_POST['cwidQuery'] . "'";
            $sqlresult = $conn->query($stringOfQuery);
        }
        //These if statements are needed to determine which form was filled
        if (isset($_POST['classQuery'])) {
            //placeholder function
            $stringOfQuery = "SELECT * FROM STUDENTS ";
            $stringOfQuery .= "where sFName = '" . $_POST['nameQuery'] . "'";
            $sqlresult = $conn->query($stringOfQuery);
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

        <div style="text-align:left" class='table'>
              <?php echo "YOUR CWID:"; ?>
              <?php echo $_POST["cwidQuery"]; ?>
          <div style='width: 1000px' class='cell mainform'>

  <?php
    $sqlresult = get_query($conn);
    if ($sqlresult != null) { echo sql_to_html_table($sqlresult, $delim = "\n"); } 
    else { echo "Failed to print" . "\n"; }
    mysqli_close($conn);
  ?>
          </div>
        </div>
</body>
</html>

