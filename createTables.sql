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
USE cs332a18;

/*
Currently does not drop all tables due to foreign key restraints
*/
--DROP TABLE IF EXISTS professors, departments, courses, students, degrees_professors, prereq_courses, minors_in, majors_in, sections, meeting_days, records


CREATE TABLE professors 
  ( 
     pSSN          INT(9) PRIMARY KEY, 
     pFName        VARCHAR(50) NOT NULL, 
     pLName        VARCHAR(50) NOT NULL, 
     pStreet       VARCHAR(50) NOT NULL, 
     pCity         VARCHAR(50) NOT NULL, 
     pState        CHAR(2) NOT NULL, 
     pZip          INT(6) NOT NULL, 
     pSex          ENUM('M','F'), 
     pPhone        VARCHAR(25) NOT NULL, 
     pTitle        ENUM('Dr','Sr','Jr','Mrs','Mr','Ms')
  ); 


CREATE TABLE departments
  ( 
     dNum           INT(3) PRIMARY KEY, 
     dName          VARCHAR(20) NOT NULL, 
     dPhone         VARCHAR(25) NOT NULL, 
     dOffice        VARCHAR(10) NOT NULL,
     dChairperson   INT(9), 
      FOREIGN KEY (dChairperson) REFERENCES professors(pSSN)
      ON DELETE CASCADE ON UPDATE NO ACTION
  ); 
 

CREATE TABLE courses
  ( 
     cNum            INT(5) PRIMARY KEY, 
     cDeptNum        INT(3) NOT NULL,
     cTitle          VARCHAR(50) NOT NULL, 
     cTextbook       VARCHAR(50), 
     cUnits          INT(1) NOT NULL,
      FOREIGN KEY (cDeptNum) REFERENCES departments(dNum)
      ON DELETE CASCADE ON UPDATE NO ACTION
  ); 
  

CREATE TABLE students
  ( 
     sCWID           INT(8) PRIMARY KEY, 
     sFName          VARCHAR(20) NOT NULL, 
     sLName          VARCHAR(20) NOT NULL, 
     sPhone          VARCHAR(20) NOT NULL, 
     sStreet         VARCHAR(50) NOT NULL, 
     sCity           VARCHAR(50) NOT NULL,
     sState          CHAR(2) NOT NULL, 
     sZip            INT(6) NOT NULL
  ); 


CREATE TABLE degrees_professors 
  ( 
     degreeName      VARCHAR(50) NOT NULL, 
     degreeProfSSN   INT(9),
      FOREIGN KEY(degreeProfSSN) REFERENCES professors(pSSN) 
      ON DELETE CASCADE ON UPDATE NO ACTION,
      UNIQUE (degreeName, degreeProfSSN)
     
  ); 

CREATE TABLE prereq_courses 
  (   
     prqNum          INT(5),
      FOREIGN KEY (prqNum) REFERENCES courses(cNum)
      ON DELETE CASCADE ON UPDATE NO ACTION,
     prqOfNum        INT(5), 
      FOREIGN KEY (prqOfNum) REFERENCES courses(cNum)
      ON DELETE CASCADE ON UPDATE NO ACTION,
      UNIQUE (prqNum, prqOfNum)
      
  ); 

/* CONSIDER: include check that major != minor (make two tables into one)
? Or provide a check during user input process... */
CREATE TABLE minors_in 
  ( 
     minDepNum        INT(3) NOT NULL,
      FOREIGN KEY(minDepNum) REFERENCES departments(dNum) 
      ON DELETE CASCADE ON UPDATE NO ACTION,
     minCWID          INT(8) NOT NULL, 
      FOREIGN KEY(minCWID) REFERENCES students(sCWID)
      ON DELETE CASCADE ON UPDATE NO ACTION,
      UNIQUE (minDepNum, minCWID)
     
  ); 

CREATE TABLE majors_in
  ( 
     majDepNum        INT(3) NOT NULL,
      FOREIGN KEY(majDepNum) REFERENCES departments(dNum) 
      ON DELETE CASCADE ON UPDATE NO ACTION,
     majCWID          INT(8) NOT NULL, 
      FOREIGN KEY(majCWID) REFERENCES students(sCWID)
      ON DELETE CASCADE ON UPDATE NO ACTION,
     UNIQUE (majDepNum, majCWID)
     
  );   

CREATE TABLE sections 
  ( 
     sNum             INT(4) PRIMARY KEY, 
     sCourseNum       INT(5),
      FOREIGN KEY(sCourseNum) REFERENCES courses(cNum)
      ON DELETE CASCADE ON UPDATE NO ACTION,
     sProfSSN         INT(9), 
      FOREIGN KEY(sProfSSN) REFERENCES professors(pSSN) 
      ON DELETE CASCADE ON UPDATE NO ACTION,
     sClassroom       VARCHAR(10) NOT NULL, 
     sSeats           INT(3) NOT NULL, 
     sBeginTime       TIME NOT NULL, 
     sEndTime         TIME NOT NULL  
     
  ); 

CREATE TABLE meeting_days 
  (
    mSectionNum       INT(4),
      FOREIGN KEY(mSectionNum) REFERENCES sections(sNum)
      ON DELETE CASCADE ON UPDATE NO ACTION,
    mDays             ENUM('Mon','Tues','Wed','Thurs','Fri','Sat'),
    UNIQUE (mSectionNum, mDays)
  );

CREATE TABLE records
  ( 
     rCWID           INT(8), 
       FOREIGN KEY(rCWID) REFERENCES students(sCWID)
       ON DELETE CASCADE ON UPDATE NO ACTION,
     rSecNum         INT(4) PRIMARY KEY,
       FOREIGN KEY(rSecNum) REFERENCES sections(sNum)
       ON DELETE CASCADE ON UPDATE NO ACTION, 
     rGrade          ENUM('A+', 'A', 'A-', 'B+', 'B', 'B-', 'C+', 
                          'C', 'C-', 'D+', 'D', 'D-', 'F') 
  ); 
