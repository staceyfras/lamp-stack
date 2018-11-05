/* 
Kyle Guss
Stacey Frasier
John Zavala
________________________________
Creates database for University information

Data sizes:
SSN         = 9 digits
CWID        = 8 digits
COURSES     = 5 digits
SECTIONS    = 4 digits
DEPARTMENTS = 3 digits
*/ 
USE cs332a20;

/*
Currently does not drop all tables due to foreign key restraints
*/
DROP TABLE IF EXISTS PROFESSORS, STUDENTS, COURSES, SECTIONS, DEPARTMENTS, MINORS, RECORDS, DEGREES, PREREQUISITES, MINORS;


CREATE TABLE PROFESSORS 
  ( 
     pSSN        INT(9) NOT NULL, 
     pFName      VARCHAR(50) NOT NULL, 
     pLName      VARCHAR(50) NOT NULL, 
     pStreet     VARCHAR(50) NOT NULL, 
     pCity       VARCHAR(50) NOT NULL, 
     pState      CHAR(2) NOT NULL, 
     pZip        INT(6) NOT NULL, 
     pSex        ENUM('M','F'), 
     pPhone      VARCHAR(25) NOT NULL, 
     pTitle      ENUM('Dr','Sr','Jr','Mrs','Mr','Ms'), 
     PRIMARY KEY(pSSN) 
  ); 
/*
PROFESSORS EXAMPLE
____________________
123456789
Kyle
Guss
111 College Road
Fullerton
CA
92831
M
(800)5551111
Dr
*/

CREATE TABLE DEPARTMENTS 
  ( 
     dNum          INT(3) NOT NULL, 
     dName         VARCHAR(20) NOT NULL, 
     dPhone        INT(10) NOT NULL, 
     dOffice       VARCHAR(10) NOT NULL, 
     dChairmanSSN  INT(9) NOT NULL, 
     PRIMARY KEY(dNum, dChairmanSSN), 
     FOREIGN KEY(dChairmanSSN) REFERENCES PROFESSORS(pSSN) 
  ); 
/*
DEPARTMENTS EXAMPLE
____________________
1234
Mathematics
(800)5551111
MH400
123456789
*/  


CREATE TABLE STUDENTS
  ( 
     sCWID              INT(8) NOT NULL, 
     studentDepNum INT(3) NOT NULL, 
     sFName        VARCHAR(20) NOT NULL, 
     sLName         VARCHAR(20) NOT NULL, 
     sPhone             VARCHAR(20) NOT NULL, 
     sStreet            VARCHAR(50) NOT NULL, 
     sCity              VARCHAR(50) NOT NULL,
     sState             CHAR(2) NOT NULL, 
     sZip               INT(6) NOT NULL,
     PRIMARY KEY(sCWID, studentDepNum), 
     FOREIGN KEY(studentDepNum) REFERENCES DEPARTMENTS(dNum) 
  ); 
/*
STUDENTS EXAMPLE
____________________
88888888
11111
Kyle
Guss
(800)1110011
2000 College Place
Fullerton
CA
92831
*/

CREATE TABLE COURSES 
  ( 
     cNum               INT(5) NOT NULL, 
     cDepNum            INT(3) NOT NULL, 
     cTitle             VARCHAR(50) NOT NULL, 
     cTextbook          VARCHAR(50) NOT NULL, 
     cUnits             INT(1) NOT NULL, 
     cPrereqNum         INT(5) NOT NULL,
     PRIMARY KEY(cNum, cDepNum), 
     FOREIGN KEY(cDepNum) REFERENCES DEPARTMENTS(dNum)
  ); 
/*
COURSES EXAMPLE
____________________
11111
1234
Mathematics
Calculus for Dumbies
3
*/    

CREATE TABLE SECTIONS 
  ( 
     sNum           INT(4) NOT NULL, 
     sCourseNum     INT(5) NOT NULL, 
     sProfSSN       INT(9) NOT NULL, 
     sClassroom     VARCHAR(10) NOT NULL, 
     sDays          CHAR(10) NOT NULL, 
     sSeats         INT(3) NOT NULL, 
     sBeginTime     VARCHAR(10) NOT NULL, 
     sEndTime       VARCHAR(10) NOT NULL, 
     PRIMARY KEY(sNum, sCourseNum), 
     FOREIGN KEY(sCourseNum) REFERENCES COURSES(cNum), 
     FOREIGN KEY(sProfSSN) REFERENCES PROFESSORS(pSSN) 
  ); 
/*
SECTIONS EXAMPLE
____________________
0001
12345
123456789
MH420
MWF
13
4:30
5:30
*/    



CREATE TABLE DEGREES 
  ( 
     degreeName           VARCHAR(50) NOT NULL, 
     degreeProfSSN INT(9) NOT NULL, 
     PRIMARY KEY(degreeName, degreeProfSSN), 
     FOREIGN KEY(degreeProfSSN) REFERENCES PROFESSORS(pSSN) 
  ); 
/*
DEGREES EXAMPLE
____________________
Mathematics
123456789
*/



CREATE TABLE RECORDS
  ( 
     rCWID           INT(8) NOT NULL, 
     rGrade          VARCHAR(10) NOT NULL, 
     rSecNum         INT(4) NOT NULL, 
     rCourseNum      INT(5) NOT NULL, 
     PRIMARY KEY(rSecNum, rCWID, rCourseNum), 
     FOREIGN KEY(rSecNum) REFERENCES SECTIONS(sNum), 
     FOREIGN KEY(rCWID) REFERENCES STUDENTS(sCWID), 
     FOREIGN KEY(rCourseNum) REFERENCES COURSES(cNum) 
  ); 
/*
RECORDS EXAMPLE
____________________
88888888
A+
1234
12345
*/      



CREATE TABLE PREREQUISITES 
  (   
     prereqCourseNum INT(5) NOT NULL, 
     prereqOfCourseNum INT(5) NOT NULL,
     PRIMARY KEY(prereqCourseNum), 
     FOREIGN KEY(prereqCourseNum) REFERENCES COURSES(cNum) 
  ); 
/*
PREREQUISITES EXAMPLE
____________________
12345
*/    



CREATE TABLE MINORS 
  ( 
     mDepNum INT(3) NOT NULL, 
     mStudentCWID      INT(8) NOT NULL, 
     PRIMARY KEY(mDepNum, mStudentCWID), 
     FOREIGN KEY(mStudentCWID) REFERENCES STUDENTS(sCWID), 
     FOREIGN KEY(mDepNum) REFERENCES DEPARTMENTS(dNum) 
  );    

