-- CREATE DATABASE chat;

USE chat;





-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table Messages
-- 
-- ---

DROP TABLE IF EXISTS Messages;
		
CREATE TABLE Messages (
  id INT AUTO_INCREMENT,
  Messages TEXT(30),
  PRIMARY KEY (id)
);

-- ---
-- Table Users
-- 
-- ---

DROP TABLE IF EXISTS Users;
		
CREATE TABLE Users (
  id INT NOT NULL AUTO_INCREMENT,
  Username VARCHAR(200) NOT NULL,
  PRIMARY KEY (id)
);

-- ---
-- Table Room
-- 
-- ---

DROP TABLE IF EXISTS Room;
		
CREATE TABLE Room (
  id INT NULL AUTO_INCREMENT DEFAULT NULL,
  Roomname VARCHAR(200) NOT NULL,
  PRIMARY KEY (id)
);

-- ---
-- Table Messages_User_Room
-- 
-- ---

DROP TABLE IF EXISTS Messages_User_Room;
		
CREATE TABLE Messages_User_Room (
  id INT NOT NULL AUTO_INCREMENT,
  MessagesID INT NOT NULL,
  UserID INT NOT NULL,
  RoomID INT NOT NULL,
  PRIMARY KEY (id)
);

-- ---
-- Foreign Keys 
-- ---

ALTER TABLE Messages_User_Room ADD FOREIGN KEY (MessagesID) REFERENCES Messages (id);
ALTER TABLE Messages_User_Room ADD FOREIGN KEY (UserID) REFERENCES Users (id);
ALTER TABLE Messages_User_Room ADD FOREIGN KEY (RoomID) REFERENCES Room (id);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE Messages ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE Users ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE Room ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE Messages_User_Room ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO Messages (id,Messages) VALUES
-- (,);
-- INSERT INTO Users (id,Username) VALUES
-- (,);
-- INSERT INTO Room (id,Roomname) VALUES
-- (,);
-- INSERT INTO Messages_User_Room (id,MessagesID,UserID,RoomID) VALUES
-- (,,,);

