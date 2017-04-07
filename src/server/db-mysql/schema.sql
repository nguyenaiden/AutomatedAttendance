DROP DATABASE IF EXISTS AutomatedAttendance;

CREATE DATABASE AutomatedAttendance;

USE AutomatedAttendance;

CREATE TABLE users (
  id int NOT NULL AUTO_INCREMENT,
  name NOT NULL varchar(50),
  email NOT NULL varchar(50),
  photo varchar(200),
  type NOT NULL varchar(50) DEFAULT 'student',
  PRIMARY KEY (id)
);

CREATE TABLE classes (
  id int NOT NULL AUTO_INCREMENT,
  name NOT NULL varchar(50),
  PRIMARY KEY (id)
);

CREATE TABLE AttendanceRecord (
  id int NOT NULL AUTO_INCREMENT,
  date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  status NOT NULL varchar(50)
  PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS class_user (
  id int NOT NULL AUTO_INCREMENT,
  classId int NOT NULL,
  userID int NOT NULL,
  PRIMARY KEY (id)
);

ALTER TABLE class_user ADD FOREIGN KEY (classid)
REFERENCES classes(id);
ALTER TABLE class_user ADD FOREIGN KEY (userid)
REFERENCES users(id);
ALTER TABLE AttendanceRecord ADD FOREIGN KEY (classUser)
REFERENCES class_user(id);