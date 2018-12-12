/* 
Kyle Guss
Stacey Frasier
John Zavala
________________________________
Inserts data to database

Reqs:
8 students
2 departments
3 professors
4 courses
6 sections
20 enrollment records
*/ 
--USE cs332a20;

INSERT INTO professors(pSSN, pFName, pLName, pStreet, pCity, pState, pZip, pSex, pPhone, pTitle)
VALUES		(666666666, "Clippers", "Thunder", "15 Stage College Lane", "Fullerton", "CA", 92831, "M", "8005555555", "Dr");
INSERT INTO professors(pSSN, pFName, pLName, pStreet, pCity, pState, pZip, pSex, pPhone, pTitle)
VALUES		(555555555, "John", "Jones", "33901 Golden Road", "Brea", "CA", 92221, "M", "949-1234567", "Dr");
INSERT INTO professors(pSSN, pFName, pLName, pStreet, pCity, pState, pZip, pSex, pPhone, pTitle)
VALUES		(444444444, "Jason", "Bourne", "1337 Ashburry", "Laguna Beach", "CA", 92629, "M", "949-195-3001", "Dr");

INSERT INTO departments(dNum, dName, dPhone, dOffice, dChairperson)
VALUES		(111, "Computer Science", "7145650101", "CS400", 666666666);
INSERT INTO departments(dNum, dName, dPhone, dOffice, dChairperson)
VALUES		(123, "Math ", "619-148-6015", "MT200", 444444444);

INSERT INTO courses(cNum, cDeptNum, cTitle, cTextbook, cUnits)
VALUES	(12345, 123, "Calculus II", "Calculus II, For Dumbies", 3);
INSERT INTO courses(cNum, cDeptNum, cTitle, cTextbook, cUnits)
VALUES (12344, 123, "Calculus I", "Calculus I, For Dumbies", 3);
INSERT INTO courses(cNum, cDeptNum, cTitle, cTextbook, cUnits)
VALUES	(54321, 111, "CS1A", "Computer Science, For Dumbies", 5);
INSERT INTO courses(cNum, cDeptNum, cTitle, cTextbook, cUnits)
VALUES	(34567, 111, "CS1D", "Advanced Computer debugging", 3);


INSERT INTO students(sCWID, sFName, sLName, sPhone, sStreet, sCity, sState, sZip)
VALUES		(12345678, "Kyle", "Guss", "(949)9992222", "1000 Pictor Ct", "Trabuco Canyon", "CA", 92679);
INSERT INTO students(sCWID, sFName, sLName, sPhone, sStreet, sCity, sState, sZip)
VALUES		(87653211, "Jay ", "Zee", "(949)123-4567", "2000 Victor dr", "Aliso Canyon", "CA", 92641);
INSERT INTO students(sCWID, sFName, sLName, sPhone, sStreet, sCity, sState, sZip)
VALUES		(11748577, "John", "Connor", "(949)147-9874", "3000 Olinda dr", "Dana Point", "CA", 92629);
INSERT INTO students(sCWID, sFName, sLName, sPhone, sStreet, sCity, sState, sZip)
VALUES		(11748578, "Edward", "Snow", "(949)209-9674", "4000 Cordova dr", "Dana Point", "CA", 92629);
INSERT INTO students(sCWID, sFName, sLName, sPhone, sStreet, sCity, sState, sZip)
VALUES		(11748579, "Logan", "Steel", "(949)781-0148", "5000 redwood dr", "Laguna Beach", "CA", 92628);
INSERT INTO students(sCWID, sFName, sLName, sPhone, sStreet, sCity, sState, sZip)
VALUES		(11748580, "Dante", "Mayers", "(949)73-9500", "6000 GreenSnow", "Mission Viejo", "CA", 92639);
INSERT INTO students(sCWID, sFName, sLName, sPhone, sStreet, sCity, sState, sZip)
VALUES		(11748581, "Perry", "Rodgers", "(949)274-2210", "7000 NorthFlag", "Laguna Niguel", "CA", 92629);
INSERT INTO students(sCWID, sFName, sLName, sPhone, sStreet, sCity, sState, sZip)
VALUES		(11748582, "Mike", "Tyson", "(949)048-4744", "8000 Glenwood", "Brea", "CA", 92718);





INSERT INTO degrees_professors(degreeName, degreeProfSSN)
VALUES		("Mathematics", 666666666), ("Physics", 666666666);

INSERT INTO prereq_courses(prqNum, prqOfNum)
VALUES		("12344", "12345");

INSERT INTO minors_in(minDepNum, minCWID)
VALUES		(111, 12345678);

INSERT INTO majors_in(majDepNum, majCWID)
VALUES		(111, 12345678);

INSERT INTO sections(sNum, sCourseNum, sProfSSN, sClassroom, sSeats, sBeginTime, sEndTime)
VALUES		(1234, 12345, 444444444, "MH401", 30, '4:30', '5:30');
INSERT INTO sections(sNum, sCourseNum, sProfSSN, sClassroom, sSeats, sBeginTime, sEndTime)
VALUES		(4321, 12344, 555555555, "MH201", 20, '3:30', '4:30');
INSERT INTO sections(sNum, sCourseNum, sProfSSN, sClassroom, sSeats, sBeginTime, sEndTime)
VALUES		(4320, 12344, 555555555, "CS408", 15, '6:30', '7:30');
INSERT INTO sections(sNum, sCourseNum, sProfSSN, sClassroom, sSeats, sBeginTime, sEndTime)
VALUES		(1233, 12345, 444444444, "HS101", 25, '1:30', '3:30');
INSERT INTO sections(sNum, sCourseNum, sProfSSN, sClassroom, sSeats, sBeginTime, sEndTime)
VALUES		(6665, 34567, 666666666, "BIO207", 10, '7:30', '8:30');
INSERT INTO sections(sNum, sCourseNum, sProfSSN, sClassroom, sSeats, sBeginTime, sEndTime)
VALUES		(6666, 54321, 666666666, "ENG312", 30, '8:30', '9:30');

INSERT INTO meeting_days(mSectionNum, mDays)
VALUES 		(1234, 'Mon'), (1234, 'Wed'), (1234, 'Fri');
INSERT INTO meeting_days(mSectionNum, mDays)
VALUES 		(4321, 'Mon'), (4321, 'Wed'), (4321, 'Fri');
INSERT INTO meeting_days(mSectionNum, mDays)
VALUES 		(4320, 'Mon'), (4320, 'Wed'), (4320, 'Fri');
INSERT INTO meeting_days(mSectionNum, mDays)
VALUES 		(1233, 'Tues'), (1233, 'Thurs'), (1233, 'Sat');
INSERT INTO meeting_days(mSectionNum, mDays)
VALUES 		(6665, 'Tues'), (6665, 'Thurs'), (6665, 'Sat');
INSERT INTO meeting_days(mSectionNum, mDays)
VALUES 		(6666, 'Mon');



INSERT INTO records(rCWID, rSecNum, rGrade)
VALUES      (12345678, 6666, 'B+');
INSERT INTO records(rCWID, rSecNum, rGrade)
VALUES      (87653211, 6666, 'A-');
INSERT INTO records(rCWID, rSecNum, rGrade)
VALUES      (11748577, 6666, 'C+');
INSERT INTO records(rCWID, rSecNum, rGrade)
VALUES      (12345678, 6665, 'B');
INSERT INTO records(rCWID, rSecNum, rGrade)
VALUES      (87653211, 6665, 'B-');
INSERT INTO records(rCWID, rSecNum, rGrade)
VALUES      (12345678, 1233, 'F');
INSERT INTO records(rCWID, rSecNum, rGrade)
VALUES      (12345678, 4320, 'D+');
INSERT INTO records(rCWID, rSecNum, rGrade)
VALUES      (12345678, 4321, 'C-');
INSERT INTO records(rCWID, rSecNum, rGrade)
VALUES      (87653211, 4321, 'A+');
INSERT INTO records(rCWID, rSecNum, rGrade)
VALUES      (11748577, 4321, 'A+');
INSERT INTO records(rCWID, rSecNum, rGrade)
VALUES      (87653211, 1234, 'A-');
INSERT INTO records(rCWID, rSecNum, rGrade)
VALUES      (11748577, 1234, 'A-');
INSERT INTO records(rCWID, rSecNum, rGrade)
VALUES      (11748582, 1234, 'F');
INSERT INTO records(rCWID, rSecNum, rGrade)
VALUES      (12345678, 1234, 'C+');
INSERT INTO records(rCWID, rSecNum, rGrade)
VALUES      (11748579, 1234, 'A-');
INSERT INTO records(rCWID, rSecNum, rGrade)
VALUES      (11748582, 4321, 'B+');
INSERT INTO records(rCWID, rSecNum, rGrade)
VALUES      (11748579, 4321, 'B');
INSERT INTO records(rCWID, rSecNum, rGrade)
VALUES      (11748577, 6665, 'C');
INSERT INTO records(rCWID, rSecNum, rGrade)
VALUES      (11748579, 6665, 'F');
INSERT INTO records(rCWID, rSecNum, rGrade)
VALUES      (11748582, 6665, 'B+');