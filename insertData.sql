/* 
Kyle Guss
Stacey Frasier
John Zavala
________________________________
Inserts data to database

Reqs:
30 enrollment records
4 courses
6 sections
*/ 

INSERT INTO PROFESSORS(pSSN, pFName, pLName, pStreet, pCity, pState, pZip, pSex, pPhone, pTitle)
VALUES		(666666666, "Clippers", "Thunder", "15 Stage College Lane", "Fullerton", "CA", 92831, "M", "(800)5555555", "Dr");

INSERT INTO DEGREES(degreeProfSSN, degreeName)
VALUES		(666666666, "Mathematics");

INSERT INTO COURSES(cDepNum, cNum, cTitle, cTextbook, cUnits)
VALUES		(123, 12345, "Calculus II", "Calculus II, For Dumbies", 3);

INSERT INTO SECTIONS(sNum, sCourseNum, sProfSSN, sClassroom, sDays, sSeats, sBeginTime, sEndTime)
VALUES		(1234, 12345, 123456789, "MH401", "MWF", 30, '4:30', '5:30');

INSERT INTO PREREQUISITES(prereqCourseNum, prereqOfCourseNum)
VALUES		("12344", "12345");

INSERT INTO STUDENTS(sCWID, sDepNum, sFName, sLName, sPhone, sStreet, sCity, sState, sZip)
VALUES		(12345678, 12345, "Kyle", "Guss", "(949)9992222", "1000 Pictor Ct", "Trabuco Canyon", "CA", 92679);

INSERT INTO MINORS(mDepNum, mStudentCWID)
VALUES		(65423, 12345678);

INSERT INTO RECORDS(rCWID, rSecNum, rCourseNum, rGrade)
VALUES      (12345678, 1234, 33212, 'B');