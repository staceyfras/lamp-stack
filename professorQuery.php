<html>
  <head>
    <title>Professor Portal -- Results</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
  </head>
  <body>
    <p>
      <a href="index.html" style="color:white">
        RETURN HOME
      </a>
      |
      <a href="professorPortal.html" style="color:white">
        BACK TO PORTAL
      </a>
      |
      <a href="info.html" style="color:white">
        INFO
      </a>
    </p>
    <br>
    <?php
    // Create connection for csuf server
    $conn = new mysqli("ecsmysql", "cs332a18", "kexoosei", "cs332a18")
    //$conn = new mysqli("localhost", "root", "", "cs332a18");
    //Check connection. Quit if failed.
    if ($conn->connect_errno) {
    echo "failed to connect to MySql: (" . $conn->connect_errno . ")" . $conn->connect_error;
    exit("Terminating..."); // this should quit the php script
    }
    function get_query($conn)
    {
    //Query: Display classes of given professor SSN
    if (isset($_POST['ssnQuery'])) {
    $stringOfQuery = "SELECT cTitle, sClassroom, sBeginTime, sEndTime, mSectionNum, mDays from SECTIONS INNER JOIN PROFESSORS on SECTIONS.sProfSSN = PROFESSORS.pSSN INNER JOIN COURSES on SECTIONS.sCourseNum = COURSES.cNum INNER JOIN MEETING_DAYS on SECTIONS.sNum=MEETING_DAYS.mSectionNum WHERE Professors.pSSN= '" . $_POST['ssnQuery'] . "'";
    $sqlresult = $conn->query($stringOfQuery);
    }
    //Query: Count grades of course section
    if (isset($_POST['cnumGrade']) && isset($_POST['snumGrade'])){
    //placeholder function
    $stringOfQuery = "SELECT cTitle, sNum, rGrade, COUNT(rGrade) FROM sections INNER JOIN courses on sCourseNum=Cnum INNER JOIN records on sNum = rSecNum WHERE cNum='" . $_POST['cnumGrade'] . "'" . " AND sNum= '" . $_POST['snumGrade'] . "'";
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