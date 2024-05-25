create database timetable;
create table staff(
  id INT PRIMARY KEY,
  sname VARCHAR(20), 
  semester INT,
  dept VARCHAR(20),
  sub VARCHAR(20));
 describe table staff;
 SELECT id,sname,semester,dept,sub from staff;
 insert into staff values (1,"gopika",6,"eee","dsp");
 insert into staff values (2,"riya",6,"eee","lic");
  insert into staff values (3,"geetha",6,"eee","analog");

create table class(
  clid INT PRIMARY KEY,
  cname VARCHAR(20),
  semester INT,
  dept VARCHAR(20),
  sub VARCHAR(20),
   id INT,
CONSTRAINT foreinkey  FOREIGN KEY(id) REFERENCES staff(id));
 SELECT * FROM class;  
 insert into class values (1,"TXT",6,"eee","analog","00:45:00",1);
 ALTER TABLE class add
id INT, add
CONSTRAINT FK FOREIGN KEY(id) References staff(id); 
  SHOW INDEX FROM  class; -- show current indices
insert into class values
(1,"sf001",6,"eee","dsp","1"),
(2,"sf001",6,"eee","lic","1"),
(3,"sf001",6,"eee","analog","1");
select s.id,s.sname,c.cname,c.dept,c.sub
from staff as s
inner join class as c
on s.id=c.clid
order by s.id; 
 
select * from class;














