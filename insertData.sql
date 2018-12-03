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

INSERT INTO professors(pSSN, pFName, pLName, pStreet, pCity, pState, pZip, pSex, pPhone, pTitle)
VALUES		(666666666, "Clippers", "Thunder", "15 Stage College Lane", "Fullerton", "CA", 92831, "M", "8005555555", "Dr");
INSERT INTO professors(pSSN, pFName, pLName, pStreet, pCity, pState, pZip, pSex, pPhone, pTitle)
VALUES		(666666666, "John", "Jones", "33901 Golden Road", "Brea", "CA", 92221, "M", "949-1234567", "Dr");
INSERT INTO professors(pSSN, pFName, pLName, pStreet, pCity, pState, pZip, pSex, pPhone, pTitle)
VALUES		(666666666, "Jason", "Bourne", "1337 Ashburry", "Laguna Beach", "CA", 92629, "M", "949-195-3001", "Dr");

INSERT INTO departments(dNum, dName, dPhone, dOffice, dChairperson)
VALUES		(111, "Computer Science", "7145650101", "CS400", 666666666);
INSERT INTO departments(dNum, dName, dPhone, dOffice, dChairperson)
VALUES		(111, "Math ", "619-148-6015", "MT200", 123456789);

INSERT INTO courses(cNum, cDeptNum, cTitle, cTextbook, cUnits)
VALUES	(12345, 111, "Calculus II", "Calculus II, For Dumbies", 3);
INSERT INTO courses(cNum, cDeptNum, cTitle, cTextbook, cUnits)
VALUES (12344, 111, "Calculus I", "Calculus I, For Dumbies", 3);
INSERT INTO courses(cNum, cDeptNum, cTitle, cTextbook, cUnits)
VALUES	(54321, 222, "CS1A", "Computer Science, For Dumbies", 5);
INSERT INTO courses(cNum, cDeptNum, cTitle, cTextbook, cUnits)
VALUES	(12345, 222, "CS1D", "Advanced Computer debugging", 3);




INSERT INTO students(sCWID, sFName, sLName, sPhone, sStreet, sCity, sState, sZip)
VALUES		(12345678, "Kyle", "Guss", "(949)9992222", "1000 Pictor Ct", "Trabuco Canyon", "CA", 92679);
INSERT INTO students(sCWID, sFName, sLName, sPhone, sStreet, sCity, sState, sZip)
VALUES		(8765321, "Jay ", "Zee", "(949)123-4567", "2000 Victor dr", "Aliso Canyon", "CA", 92641);
INSERT INTO students(sCWID, sFName, sLName, sPhone, sStreet, sCity, sState, sZip)
VALUES		(01748578, "John", "Connor", "(949)147-9874", "3000 Olinda dr", "Dana Point", "CA", 92629);
INSERT INTO students(sCWID, sFName, sLName, sPhone, sStreet, sCity, sState, sZip)
VALUES		(01748578, "Edward", "Snow", "(949)209-9674", "4000 Cordova dr", "Dana Point", "CA", 92629);
INSERT INTO students(sCWID, sFName, sLName, sPhone, sStreet, sCity, sState, sZip)
VALUES		(01748578, "Logan", "Steel", "(949)781-0148", "5000 redwood dr", "Laguna Beach", "CA", 92628);
INSERT INTO students(sCWID, sFName, sLName, sPhone, sStreet, sCity, sState, sZip)
VALUES		(01748578, "Dante", "Mayers", "(949)73-9500", "6000 GreenSnow", "Mission Viejo", "CA", 92639);
INSERT INTO students(sCWID, sFName, sLName, sPhone, sStreet, sCity, sState, sZip)
VALUES		(01748578, "Perry", "Rodgers", "(949)274-2210", "7000 NorthFlag", "Laguna Niguel", "CA", 92629);
INSERT INTO students(sCWID, sFName, sLName, sPhone, sStreet, sCity, sState, sZip)
VALUES		(01748578, "Mike", "Tyson", "(949)048-4744", "8000 Glenwood", "Brea", "CA", 92718);





INSERT INTO degrees_professors(degreeName, degreeProfSSN)
VALUES		("Mathematics", 666666666), ("Physics", 666666666);

INSERT INTO prereq_courses(prqNum, prqOfNum)
VALUES		("12344", "12345");

INSERT INTO minors_in(minDepNum, minCWID)
VALUES		(111, 12345678);

INSERT INTO majors_in(majDepNum, majCWID)
VALUES		(111, 12345678);

INSERT INTO sections(sNum, sCourseNum, sProfSSN, sClassroom, sSeats, sBeginTime, sEndTime)
VALUES		(1234, 12345, 666666666, "MH401", 30, '4:30', '5:30');
INSERT INTO sections(sNum, sCourseNum, sProfSSN, sClassroom, sSeats, sBeginTime, sEndTime)
VALUES		(4321, 54321, 555555555, "MH201", 20, '3:30', '4:30');
INSERT INTO sections(sNum, sCourseNum, sProfSSN, sClassroom, sSeats, sBeginTime, sEndTime)
VALUES		(1111, 13520, 777777777, "CS408", 15, '6:30', '7:30');
INSERT INTO sections(sNum, sCourseNum, sProfSSN, sClassroom, sSeats, sBeginTime, sEndTime)
VALUES		(2222, 02531, 888888888, "HS101", 25, '1:30', '3:30');
INSERT INTO sections(sNum, sCourseNum, sProfSSN, sClassroom, sSeats, sBeginTime, sEndTime)
VALUES		(3333, 10485, 999999999, "BIO207", 10, '7:30', '8:30');
INSERT INTO sections(sNum, sCourseNum, sProfSSN, sClassroom, sSeats, sBeginTime, sEndTime)
VALUES		(4444, 58401, 111111111, "ENG312", 30, '8:30', '9:30');

INSERT INTO meeting_days(mSectionNum, mDays)
VALUES 		(1234, 'Mon'), (1234, 'Wed'), (1234, 'Fri');
INSERT INTO meeting_days(mSectionNum, mDays)
VALUES 		(4321, 'Mon'), (4321, 'Wed'), (4321, 'Fri');
INSERT INTO meeting_days(mSectionNum, mDays)
VALUES 		(1111, 'Mon'), (1111, 'Wed'), (1111, 'Fri');
INSERT INTO meeting_days(mSectionNum, mDays)
VALUES 		(2222, 'TU'), (2222, 'TH'), (2222, 'SAT');
INSERT INTO meeting_days(mSectionNum, mDays)
VALUES 		(3333, 'TU'), (3333, 'TH'), (3333, 'SAT');
INSERT INTO meeting_days(mSectionNum, mDays)
VALUES 		(4444, 'Mon');



INSERT INTO records(rCWID, rSecNum, rGrade)
VALUES      (12345678, 1234, 'B');
INSERT INTO records(rCWID, rSecNum, rGrade)
VALUES      (87654321, 1234, 'A');
INSERT INTO records(rCWID, rSecNum, rGrade)
VALUES      (41748578, 1234, 'C');
INSERT INTO records(rCWID, rSecNum, rGrade)
VALUES      (102147848, 4321, 'B');
INSERT INTO records(rCWID, rSecNum, rGrade)
VALUES      (96302548, 4321, 'B');
INSERT INTO records(rCWID, rSecNum, rGrade)
VALUES      (74103598, 4321, 'F');
INSERT INTO records(rCWID, rSecNum, rGrade)
VALUES      (74812590, 1111, 'D');
INSERT INTO records(rCWID, rSecNum, rGrade)
VALUES      (74811007, 1111, 'C');
INSERT INTO records(rCWID, rSecNum, rGrade)
VALUES      (74812771, 1111, 'A');
INSERT INTO records(rCWID, rSecNum, rGrade)
VALUES      (71487652, 2222, 'A');
INSERT INTO records(rCWID, rSecNum, rGrade)
VALUES      (74817410, 2222, 'A');
INSERT INTO records(rCWID, rSecNum, rGrade)
VALUES      (74819630, 2222, 'A');
INSERT INTO records(rCWID, rSecNum, rGrade)
VALUES      (34811110, 3333, 'F');
INSERT INTO records(rCWID, rSecNum, rGrade)
VALUES      (24811110, 3333, 'C');
INSERT INTO records(rCWID, rSecNum, rGrade)
VALUES      (74147050, 3333, 'A');
INSERT INTO records(rCWID, rSecNum, rGrade)
VALUES      (96301478, 4444, 'B');
INSERT INTO records(rCWID, rSecNum, rGrade)
VALUES      (36874180, 4444, 'B');
INSERT INTO records(rCWID, rSecNum, rGrade)
VALUES      (25847805, 4444, 'C');
INSERT INTO records(rCWID, rSecNum, rGrade)
VALUES      (71482050, 4444, 'F');
INSERT INTO records(rCWID, rSecNum, rGrade)
VALUES      (96301452, 4444, 'B');
