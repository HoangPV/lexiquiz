-- MySQL Queries to Create Tables with Relationships
CREATE DATABASE lexiquiz;
USE lexiquiz;

-- Create User Table
CREATE TABLE User
(
    UserID   INT PRIMARY KEY,
    Username VARCHAR(255) NOT NULL,
    Email    VARCHAR(255)
);

-- Create QuizSession Table
CREATE TABLE QuizSession
(
    QuizID    INT PRIMARY KEY,
    QuizName  VARCHAR(255) NOT NULL,
    StartTime DATETIME,
    EndTime   DATETIME
);

-- Create Question Table
CREATE TABLE Question
(
    QuestionID    INT PRIMARY KEY,
    QuizID        INT,
    QuestionText  TEXT,
    CorrectAnswer VARCHAR(255),
    FOREIGN KEY (QuizID) REFERENCES QuizSession (QuizID)
);

-- Create UserParticipation Table
CREATE TABLE UserParticipation
(
    ParticipationID INT PRIMARY KEY,
    QuizID          INT,
    UserID          INT,
    StartTime       DATETIME,
    EndTime         DATETIME,
    FOREIGN KEY (QuizID) REFERENCES QuizSession (QuizID),
    FOREIGN KEY (UserID) REFERENCES User (UserID)
);

-- Create UserScores Table
CREATE TABLE UserScores
(
    ScoreID         INT PRIMARY KEY,
    ParticipationID INT,
    UserID          INT,
    QuizID          INT,
    Score           INT,
    Timestamp       TIMESTAMP,
    FOREIGN KEY (ParticipationID) REFERENCES UserParticipation (ParticipationID),
    FOREIGN KEY (UserID) REFERENCES User (UserID),
    FOREIGN KEY (QuizID) REFERENCES QuizSession (QuizID)
);

-- Create Leaderboard Table
CREATE TABLE Leaderboard
(
    LeaderboardID INT PRIMARY KEY,
    QuizID        INT,
    UserID        INT,
    UserRank      INT,
    FOREIGN KEY (QuizID) REFERENCES QuizSession (QuizID),
    FOREIGN KEY (UserID) REFERENCES User (UserID)
);

-- Inserting Sample Data into Tables:
INSERT INTO User (UserID, Username, Email)
VALUES (1, 'dieterroark', 'dieter.roark@getkenka.com'),
       (2, 'hoangpv', 'phanvuhoang@gmail.com');


-- Sample data for QuizSession table
INSERT INTO QuizSession (QuizID, QuizName, StartTime, EndTime)
VALUES (1, 'English Vocabulary Quiz', '2024-06-15 10:00:00', '2024-06-15 11:00:00'),
       (2, 'Grammar Quiz', '2024-06-16 14:00:00', '2024-06-16 15:00:00');

-- Sample data for Question table
INSERT INTO Question (QuestionID, QuizID, QuestionText, CorrectAnswer)
VALUES (1, 1, 'What is the synonym of "happy"?', 'joyful'),
       (2, 1, 'What is the capital of France?', 'Paris');

-- Sample data for UserParticipation table
INSERT INTO UserParticipation (ParticipationID, QuizID, UserID, StartTime, EndTime)
VALUES (1, 1, 1, '2024-06-15 10:05:00', '2024-06-15 10:30:00'),
       (2, 1, 2, '2024-06-15 10:10:00', '2024-06-15 10:25:00');


-- Sample data for UserScores table
INSERT INTO UserScores (ScoreID, ParticipationID, UserID, QuizID, Score, Timestamp)
VALUES (1, 1, 1, 1, 90, '2024-06-15 10:30:00'),
       (2, 2, 2, 1, 85, '2024-06-15 10:25:00');


-- Sample data for Leaderboard table
INSERT INTO Leaderboard (LeaderboardID, QuizID, UserID, UserRank)
VALUES (1, 1, 1, 1),
       (2, 1, 2, 2);