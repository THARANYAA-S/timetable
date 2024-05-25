create database timetablegeneration;
create table class(
classid INT PRIMARY KEY,
clasname VARCHAR(10),
deptname  VARCHAR(10));
DROP TABLE class;
ALTER TABLE class ADD PRIMARY KEY (classid);
ALTER TABLE  staff ADD PRIMARY KEY ( staffid);

create table class(
classid INT,
clasname VARCHAR(10),
semester INT ,
deptname  VARCHAR(10));
alter table class add index(semester);
create table staff(
staffid INT,
staffname varchar(20),
subj varchar(20),
 semester INT,
FOREIGN KEY( semester)  REFERENCES class( semester));
insert into class values
(1,"ee101",6,"EEE"),
(2,"ee102",6,"EEE");
INSERT INTO staff VALUES 
(1,"Tharan","DBMS",6),
(2,"Riya","lic",6),
(3," Rithan","circuits",6);

CREATE TABLE timetable (
    timetableid INT AUTO_INCREMENT PRIMARY KEY,
     classid INT,
     staffid INT,
     day VARCHAR(10),
    time TIME,
    FOREIGN KEY (classid) REFERENCES class(classid),
    FOREIGN KEY (staffid) REFERENCES staff(staffid)
);
INSERT INTO timetable (classid, staffid, day, time) VALUES
(1, 1, 'Monday', '08:45:00'),
(1, 2, 'Monday', '09:45:00');
SELECT c.classid,c.clasname,c.deptname,s.staffname,s.staffid,t.day,t.time 
from class as c
inner join staff as s on c.classid=s.staffid
inner join timetable as t 
on s.staffid=t.staffid
order by  staffid;




