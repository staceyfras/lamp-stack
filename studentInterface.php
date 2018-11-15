<html>
<head>
    <title>Student Portal</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>

<body>
    <p>
        <a href="index.html" style="color:white">RETURN HOME</a> | <a href="info.html" style="color:white">INFO</a> 
    </p>
    <h2>Student Portal</h2><br>
    <!-- Going to add in buttons that change query or append to it -->
    <form action="studentInterface.php" method="post">
        SSN: <input type="text" name="SSNQuery">
        <input type="submit" value="SUBMIT">
    </form>
    <br>

    <!-- Good example of form that is based on a query -->
    <form action="studentInterface.php" method="post">
        First Name: <input type="text" name="pFName">
        <input type="submit" value="SUBMIT">
    </form>
    <br>
    <form action="studentInterface.php" method="post">
        Student CWID: <input type="text" name="cwid">
        <input type="submit" value="SUBMIT">
    </form>


    <!-------
    Below php connects to sql db, contains a function that converts sql query to html tables, our current query, closes db, and and finishes our mainform table. 
    -->
    <?php

            // Create connection
            $conn = new mysqli("localhost", "cs332a1");
            //Check connection. Quit if failed.
            if ($conn->connect_errno) { 
              echo "failed to connect to MySql: (" . $conn->connect_errno . ")" . $conn->connect_error;
              exit("Terminating php script"); // this should quit the php script
            }
            // TO DO: Have a null outpull too.

            // echo "Connected successfully, currently displays PROFESSORS Table"; 
            
            
            //sql_to_html_table converts sql results to html table
            function sql_to_html_table($conn, $delim="\n") {
                  // starting table
                  $htmltable =  "<table style='border: 1px solid white'>" . $delim ;   
                  $counter   = 0 ;
                  // putting in lines
                  while( $row = $conn->fetch_assoc() ) {
                    if ( $counter===0 ) {
                  // table header
                  $htmltable .=   "<tr style='border: 1px solid white'>"  . $delim;
                  foreach ($row as $key => $value ) {
                      $htmltable .=   "<th style='border: 1px solid white'>" . $key . "</th>"  . $delim ;
                  }
                  $htmltable .=   "</tr>"  . $delim ; 
                  $counter = 22;
                } 
                  // table body
                  $htmltable .=   "<tr style='border: 1px solid white'>"  . $delim ;
                  foreach ($row as $key => $value ) {
                      $htmltable .=   "<td style='border: 1px solid yellow'>" . $value . "</td>"  . $delim ;
                  }
                  $htmltable .=   "</tr>"   . $delim ;
              }
              // closing table
              $htmltable .=   "</table>"   . $delim ; 
              // return
              return( $htmltable ) ; 
            }//END FUNCTION
            
            //Query
            if( isset($_POST['SSNQuery']) ) {
                $stringOfQuery="SELECT * FROM PROFESSORS ";
                $stringOfQuery .= "where pSSN = '".$_POST['SSNQuery']."'";
            } 
            //These if statements are needed to determine which form was filled
            if( isset($_POST['pFName']) ) {
                $stringOfQuery="SELECT * FROM PROFESSORS ";
                $stringOfQuery .= "where pFName = '".$_POST['pFName']."'";
            } 
            //retrieve results with current Query
            $sqlresult = $conn->query( $stringOfQuery ) ; 
            
            mysqli_close($conn);
    
            //connect and enter mainform div ie yellow console 
            echo "<div style='text-align:left' class='table'>"; 
            echo "CURRENT CWID:"; 
            echo $_POST["cwid"]; 
            echo "<br> <div style='width: 1000px' class='cell mainform'>"; 
            echo sql_to_html_table( $sqlresult, $delim="\n" ) ;
            echo "</div>"; 
            echo "</div>"; 
            ?>

        <br>
        <div style="text-align:left" class='table'>
            CURRENT CWID:
            <?php echo $_POST["cwid"]; ?>
            <div style='padding-top: 100px' class='cell mainform'>
                <?php echo $_POST["cwid"]; ?>

            </div>
        </div>
</body>

</html>
