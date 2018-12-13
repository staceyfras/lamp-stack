<html>

<head>
    <title>Professor Portal -- Results</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>

<body>
    <p>
        <a href="index.html" style="color:white">
        RETURN HOME
      </a> |
        <a href="professorPortal.html" style="color:white">
        BACK TO PORTAL
      </a> |
        <a href="info.html" style="color:white">
        INFO
      </a>
    </p>
    <br>
    <?php
    // Create connection for csuf server
    //param@ conn(server, user, password, database_name)
    $conn = new mysqli("ecsmysql", "cs332a20", "hievoosi", "cs332a20");
    //$conn = new mysqli("localhost", "root", "", "cs332a19");
    //Check connection. Quit if failed.
    if ($conn->connect_error) {
      echo "failed to connect to MySql: " . $conn->connect_error;
      exit("Terminating..."); // this should quit the php script
    }
    function get_query($conn)
    {
      //Query: Display classes of given professor SSN
      if (isset($_POST["ssnQuery"])) {
        $ssn = $_POST["ssnQuery"];
        $stringOfQuery = "SELECT cTitle, sClassroom, sBeginTime, sEndTime, mSectionNum, mDays from sections INNER JOIN professors on sections.sProfSSN = professors.pSSN INNER JOIN courses on sections.sCourseNum = courses.cNum INNER JOIN meeting_days on sections.sNum=meeting_days.mSectionNum WHERE professors.pSSN=${ssn};";
        $sqlresult = $conn->query($stringOfQuery);
        if($sqlresult->num_rows <= 0) {
          printf("Error: %s\n", $conn->error);
        }
      }
      //Query: Count grades of course section
      if (isset($_POST["cnumGrade"]) && isset($_POST["snumGrade"])){
        $course = $_POST["cnumGrade"];
        $section = $_POST["snumGrade"];
      //placeholder function
        $stringOfQuery = "SELECT cTitle, sNum, rGrade, COUNT(rGrade) FROM sections INNER JOIN courses on sCourseNum=Cnum INNER JOIN records on sNum = rSecNum WHERE cNum=${course} AND sNum=${section} group by rGrade;";
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
      $conn->close();
      ?>
        </div>
</body>

</html>
