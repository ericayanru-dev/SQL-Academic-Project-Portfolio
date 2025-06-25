-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema University
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `University` ;

-- -----------------------------------------------------
-- Schema University
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `University` DEFAULT CHARACTER SET utf8 ;
USE `University` ;

-- -----------------------------------------------------
-- Table `University`.`College`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `University`.`College` ;

CREATE TABLE IF NOT EXISTS `University`.`College` (
  `College_id` INT NOT NULL,
  `college_name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`College_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `University`.`Department`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `University`.`Department` ;

CREATE TABLE IF NOT EXISTS `University`.`Department` (
  `Department_id` INT NOT NULL,
  `department_name` VARCHAR(45) NOT NULL,
  `department_code` VARCHAR(45) NOT NULL,
  `College_id` INT NOT NULL,
  PRIMARY KEY (`Department_id`),
  INDEX `fk_Department_College1_idx` (`College_id` ASC) VISIBLE,
  CONSTRAINT `fk_Department_College1`
    FOREIGN KEY (`College_id`)
    REFERENCES `University`.`College` (`College_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `University`.`Course`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `University`.`Course` ;

CREATE TABLE IF NOT EXISTS `University`.`Course` (
  `Course_id` INT NOT NULL,
  `course_num` INT NOT NULL,
  `course_title` VARCHAR(45) NOT NULL,
  `credits` INT NOT NULL,
  `Department_id` INT NOT NULL,
  PRIMARY KEY (`Course_id`),
  INDEX `fk_Course_Department1_idx` (`Department_id` ASC) VISIBLE,
  CONSTRAINT `fk_Course_Department1`
    FOREIGN KEY (`Department_id`)
    REFERENCES `University`.`Department` (`Department_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `University`.`Faculty`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `University`.`Faculty` ;

CREATE TABLE IF NOT EXISTS `University`.`Faculty` (
  `Faculty_id` INT NOT NULL,
  `fname` VARCHAR(45) NOT NULL,
  `lname` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Faculty_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `University`.`Term`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `University`.`Term` ;

CREATE TABLE IF NOT EXISTS `University`.`Term` (
  `Term_id` INT NOT NULL,
  `term` ENUM('Fall', 'Winter') NOT NULL,
  `year` INT NOT NULL,
  PRIMARY KEY (`Term_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `University`.`Section`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `University`.`Section` ;

CREATE TABLE IF NOT EXISTS `University`.`Section` (
  `Section_id` INT NOT NULL,
  `section_number` INT NOT NULL,
  `capacity` INT NOT NULL,
  `Course_id` INT NOT NULL,
  `Faculty_id` INT NOT NULL,
  `Term_id` INT NOT NULL,
  PRIMARY KEY (`Section_id`),
  INDEX `fk_Section_Course1_idx` (`Course_id` ASC) VISIBLE,
  INDEX `fk_Section_Faculty1_idx` (`Faculty_id` ASC) VISIBLE,
  INDEX `fk_Section_Term1_idx` (`Term_id` ASC) VISIBLE,
  CONSTRAINT `fk_Section_Course1`
    FOREIGN KEY (`Course_id`)
    REFERENCES `University`.`Course` (`Course_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Section_Faculty1`
    FOREIGN KEY (`Faculty_id`)
    REFERENCES `University`.`Faculty` (`Faculty_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Section_Term1`
    FOREIGN KEY (`Term_id`)
    REFERENCES `University`.`Term` (`Term_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `University`.`Student`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `University`.`Student` ;

CREATE TABLE IF NOT EXISTS `University`.`Student` (
  `Student_id` INT NOT NULL,
  `fname` VARCHAR(45) NOT NULL,
  `lname` VARCHAR(45) NOT NULL,
  `dob` DATE NOT NULL,
  `gender` ENUM('M', 'F') NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `state` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Student_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `University`.`Enrollment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `University`.`Enrollment` ;

CREATE TABLE IF NOT EXISTS `University`.`Enrollment` (
  `Student_id` INT NOT NULL,
  `Section_id` INT NOT NULL,
  PRIMARY KEY (`Student_id`, `Section_id`),
  INDEX `fk_Student_has_Section_Section1_idx` (`Section_id` ASC) VISIBLE,
  INDEX `fk_Student_has_Section_Student_idx` (`Student_id` ASC) VISIBLE,
  CONSTRAINT `fk_Student_has_Section_Student`
    FOREIGN KEY (`Student_id`)
    REFERENCES `University`.`Student` (`Student_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Student_has_Section_Section1`
    FOREIGN KEY (`Section_id`)
    REFERENCES `University`.`Section` (`Section_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

use university;

insert into college (college_id, college_name)
values
(1,"College of Physical Science and Engineering"),
(2,"College of Business and Communication"),
(3,"College of Language and Letters");
select * from college;


insert into department (Department_id, department_name, department_code, College_id)
values
(1, "Computer Information Technology", "ITM", 1),
(2, "Economics", "ECON", 2),
(3, "Humanities and Philosophy","HUM", 3);
select * from department;


insert into course (Course_id, course_num, course_title,credits, Department_id)
values
(1, 111, "Intro to Databases", 3, 1),
(2, 388, "Econometrics", 4, 2),
(3, 150, "Micro Economics", 3, 2),
(4, 376, "Classical Heritage", 2, 3);
select * from course;


insert into faculty (faculty_id, fname, lname)
values
(1, "Marty", "Morring"),
(2, "Nate", "Norris"),
(3, "Ben", "Barrus"),
(4, "John", "Jensen"),
(5, "Bill", "Barney");
select * from faculty;


insert into term(Term_id, term, year)
values
(1, "Fall", 2019),
(2, "Winter",2018);
 select * from term;

insert into section (Section_id, section_number, capacity, Course_id, Faculty_id, Term_id)
values
(1, 1, 30, 1, 1, 1),
(2, 1, 50, 3, 2, 1),
(3, 2, 50, 3, 2, 1),
(4, 1, 35, 2, 3, 1),
(5, 1, 30, 4, 4, 1),
(6, 2, 30, 1, 1, 2),
(7, 3, 35, 1, 5, 2),
(8, 1, 50, 3, 2, 2),
(9, 2, 50, 3, 2, 2),
(10, 1, 30, 4, 4, 2);
select * from section;


insert into student (student_id,fname,lname,dob,gender,city,state)
values
(1, "Paul", "Miller", "1996-02-22" , "M", "Dallas", "TX"),
(2, "Katie", "Smith", "1995-07-22" , "F", "Provo", "UT"),
(3, "Kelly", "Jones", "1998-06-22" , "F", "Provo", "UT"),
(4, "Devon", "Merrill", "2000-07-22" , "M", "Mesa", "AZ"),
(5, "Mandy", "Murdock", "1996-11-22" , "F", "Topeka", "KS"),
(6, "Alece", "Adams", "1997-05-22" , "F", "Rigby", "ID"),
(7, "Bryce", "Carlson", "1997-11-22" ,"M", "Bozeman", "MT"),
(8, "Preston", "Larsen", "1996-09-22" , "M", "Decatur", "TN"),
(9, "Julia", "Madsen", "1998-09-22" , "F", "Rexburg", "ID"),
(10, "Susan", "Sorensen", "1998-08-09" , "F", "Mesa", "AZ");
select * from student;

insert into enrollment(Student_id,Section_id)
values
(6,7),
(7,6),
(7,8),
(7,10),
(4,5),
(9,9),
(2,4),
(3,4),
(5,4),
(5,5),
(1,1),
(1,3),
(8,9),
(10,6);
select * from enrollment;

-- 1
-- Students, and their birthdays, of students born in September.
select fname, lname, date_format(dob,'%M %d, %Y') as "sept Birthdays"
from student
where month(dob) = 9
order by lname;

-- 2
-- Student's age in years and days as of Jan. 5, 2017. Sorted from oldest to youngest. 
select lname, fname, floor(datediff('2017-01-05',dob)/365) as "years", 
mod(datediff('2017-01-05',dob),365) as "day", 
concat(floor(datediff('2017-01-05',dob)/365),  " - Yrs, ",
mod(datediff('2017-01-05',dob),365), " - Days")
from student
order by dob asc;

-- 3
-- Students taught by John Jensen. Sorted by student's last name
select s.fname, s.lname
from student s
join enrollment e
on s.student_id = e.student_id
join section se
on e.section_id = se.section_id
join faculty f
on se.faculty_id = f.faculty_id
where f.fname = "John" and f.lname = "Jensen"
order by s.lname;


-- 4
-- Instructors Bryce will have in Winter 2018. Sort by the faculty's last name.
select f.fname, f.lname
from student s
join enrollment e
on s.student_id = e.student_id
join section se
on e.section_id = se.section_id
join faculty f
on se.faculty_id = f.faculty_id
where s.fname =  "Bryce"
order by f.lname asc;

-- 5
-- Students that take Econometrics in Fall 2019. Sort by student last name.
select s.fname, s.lname
from student s
join enrollment e
on s.student_id = e.student_id
join section se
on e.section_id = se.section_id
join course c
on c.course_id = se.course_id
join term t
on t.term_id = se.term_id
where course_title ="Econometrics" and term = "Fall" and year = 2019
order by s.lname asc;

-- 6
-- Report showing all of Bryce Carlson's courses for Winter 2018. 
-- Sort by the name of the course.
select department_code, course_num, course_title as "name"
from department d
join course c
on d.Department_id = c.Department_id
join section s
on c.Course_id = s.Course_id
join term t
on s.Term_id = t.Term_id
join enrollment e
on s.section_id = e.section_id
join student su
on e.student_id = su.student_id
where su.fname = "Bryce" and su.lname = "Carlson" and term = "Winter" and year = 2018
order by course_title;

-- 7
-- The number of students enrolled for Fall 2019
select t.term, t.year, count(s.fname) as "enrollment"
from student s
join enrollment e
on s.student_id = e.student_id
join section se
on e.section_id= se.section_id
join term t
on se.term_id = t.term_id
where term = "Fall" and year = 2019;

-- 8
-- The number of courses in each college. Sort by college name.
select college_name as "college", count(course_title) as "courses"
from college c
join department d
on c.college_id = d.college_id
join course co
on d.Department_id = co.Department_id
group by college_name
order by college_name;

-- 9
-- The total number of students each professor can teach in Winter 2018. 
select f.fname, f.lname, sum(capacity) as "Teaching Capacity"
from faculty f
join section s
on f.faculty_id = s.faculty_id
join term t
on s.term_id = t.term_id
where t.year = 2018 and t.term = "winter"
group by f.fname, f.lname
order by sum(capacity);

-- 10
-- Each student's total credit load for Fall 2019, but only students with a credit 
-- load greater than three.
select s.lname, s.fname, sum(c.credits) as "credits"
from student s
join enrollment e
on s.student_id = e.student_id
join section se
on e.section_id = se.section_id
join term t
on se.term_id = t.term_id
join course c
on se.course_id = c.course_id
where term = "fall" and year = 2019
group by s.lname, s.fname
having sum(c.credits)> 3
order by sum(c.credits) desc;


