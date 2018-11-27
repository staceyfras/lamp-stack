/* 
Kyle Guss
Stacey Frasier
John Zavala
________________________________
Inserts data to database

Reqs:
20 enrollment records
4 courses
6 sections
*/ 

INSERT INTO professors(pSSN, pFName, pLName, pStreet, pCity, pState, pZip, pSex, pPhone, pTitle)
VALUES		(666666666, "Clippers", "Thunder", "15 Stage College Lane", "Fullerton", "CA", 92831, "M", "8005555555", "Dr");

INSERT INTO departments(dNum, dName, dPhone, dOffice, dChairperson)
VALUES		(111, "Computer Science", "7145650101", "CS400", 666666666);

INSERT INTO courses(cNum, cDeptNum, cTitle, cTextbook, cUnits)
VALUES	(12345, 111, "Calculus II", "Calculus II, For Dumbies", 3), (12344, 111, "Calculus I", "Calculus I, For Dumbies", 3);

INSERT INTO students(sCWID, sFName, sLName, sPhone, sStreet, sCity, sState, sZip)
VALUES		(12345678, "Kyle", "Guss", "(949)9992222", "1000 Pictor Ct", "Trabuco Canyon", "CA", 92679);

INSERT INTO degrees(degreeName, degreeProfSSN)
VALUES		("Mathematics", 666666666), ("Physics", 666666666);

INSERT INTO prereqs(prqNum, prqOfNum)
VALUES		("12344", "12345");

INSERT INTO minors_in(minDepNum, minCWID)
VALUES		(111, 12345678);

INSERT INTO majors_in(majDepNum, majCWID)
VALUES		(111, 12345678);

INSERT INTO sections(sNum, sCourseNum, sProfSSN, sClassroom, sSeats, sBeginTime, sEndTime)
VALUES		(1234, 12345, 666666666, "MH401", 30, '4:30', '5:30');

INSERT INTO meeting_days(mSectionNum, mDays)
VALUES 		(1234, 'Mon'), (1234, 'Wed'), (1234, 'Fri');

INSERT INTO records(rCWID, rSecNum, rGrade)
VALUES      (12345678, 1234, 'B');
