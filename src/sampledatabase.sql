 create database   tablegeneration;
 CREATE TABLE  class (
    classid INT PRIMARY KEY,
    clasname VARCHAR(10),
    deptname VARCHAR(10),
    semester INT
);
ALTER TABLE class ADD INDEX(semester);
CREATE TABLE IF NOT EXISTS staff (
    staffid INT PRIMARY KEY,
    staffname VARCHAR(20),
    subj VARCHAR(20),
    semester INT,
    FOREIGN KEY (semester) REFERENCES class(semester)
);
CREATE TABLE IF NOT EXISTS timetable (
    timetableid INT AUTO_INCREMENT PRIMARY KEY,
    classid INT,
    staffid INT,
    day VARCHAR(10),
    time TIME,
    FOREIGN KEY (classid) REFERENCES class(classid),
    FOREIGN KEY (staffid) REFERENCES staff(staffid)
);
INSERT INTO class (classid, clasname, deptname, semester) VALUES
(1, "ee101", "EEE", 6),
(2, "ee102", "EEE", 6);
INSERT INTO staff (staffid, staffname, subj, semester) VALUES 
(1, "Tharan", "DBMS", 6),
(2, "Riya", "lic", 6),
(3, "Rithan", "circuits", 6);
DELIMITER //

CREATE PROCEDURE GenerateTimetable() 
BEGIN 
    DECLARE currentDay VARCHAR(10); 
    DECLARE currentTime TIME; 
    DECLARE periodCounter INT; 
    DECLARE dayCounter INT; 
    DECLARE maxPeriodsPerDay INT DEFAULT 8; 
    DECLARE done INT DEFAULT 0; 
    DECLARE classid_var INT; 
    DECLARE staffid_var INT; 
    
    DECLARE class_cursor CURSOR FOR SELECT classid FROM class; 
    DECLARE staff_cursor CURSOR FOR SELECT staffid FROM staff; 
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1; 
    
    SET currentDay = 'Monday'; 
    SET currentTime = '08:45:00'; 
    SET periodCounter = 1; 
    SET dayCounter = 0; 
    
    OPEN class_cursor; 
    read_class: LOOP 
        FETCH class_cursor INTO classid_var; 
        IF done THEN 
            LEAVE read_class; 
        END IF; 
        
        SET done = 0; 
        OPEN staff_cursor; 
        read_staff: LOOP 
            FETCH staff_cursor INTO staffid_var; 
            IF done THEN 
                LEAVE read_staff; 
            END IF; 
            
            
            UPDATE timetable
            SET day = currentDay, time = currentTime
            WHERE classid = classid_var AND staffid = staffid_var;
           
            IF ROW_COUNT() = 0 THEN
                INSERT INTO timetable (classid, staffid, day, time)
                VALUES (classid_var, staffid_var, currentDay, currentTime);
            END IF;
            
            SET currentTime = ADDTIME(currentTime, '01:00:00'); 
            SET periodCounter = periodCounter + 1; 
            
            IF periodCounter > maxPeriodsPerDay THEN 
                SET periodCounter = 1; 
                SET dayCounter = dayCounter + 1; 
                
                CASE dayCounter 
                    WHEN 1 THEN SET currentDay = 'Tuesday'; 
                    WHEN 2 THEN SET currentDay = 'Wednesday'; 
                    WHEN 3 THEN SET currentDay = 'Thursday'; 
                    WHEN 4 THEN SET currentDay = 'Friday'; 
                    ELSE SET dayCounter = 0; SET currentDay = 'Monday'; 
                END CASE; 
                 SET currentTime = '08:45:00'; 
            END IF; 
        END LOOP; 
        CLOSE staff_cursor; 
    END LOOP; 
    CLOSE class_cursor; 
END //

DELIMITER ;
CALL GenerateTimetable();

SELECT c.classid, c.clasname, s.staffname,s.subj, t.day, t.time
FROM class AS c
INNER JOIN staff AS s ON c.semester = s.semester
INNER JOIN timetable AS t ON c.classid = t.classid AND s.staffid = t.staffid;

 
