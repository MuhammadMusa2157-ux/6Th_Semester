CREATE DATABASE VotingElectionDB;
USE VotingElectionDB;

CREATE TABLE Voter (
    VoterID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL
);

CREATE TABLE Election (
    ElectionID INT AUTO_INCREMENT PRIMARY KEY,
    ElectionType VARCHAR(50) NOT NULL
);

CREATE TABLE Candidate (
    CandidateID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Party VARCHAR(100) NOT NULL,
    ElectionID INT,
    FOREIGN KEY (ElectionID) REFERENCES Election(ElectionID)
);

CREATE TABLE PollingStation (
    PollingStationID INT AUTO_INCREMENT PRIMARY KEY,
    Location VARCHAR(100) NOT NULL
);

CREATE TABLE Vote (
    VoteID INT AUTO_INCREMENT PRIMARY KEY,
    VoterID INT,
    CandidateID INT,
    ElectionID INT,
    PollingStationID INT,
    FOREIGN KEY (VoterID) REFERENCES Voter(VoterID),
    FOREIGN KEY (CandidateID) REFERENCES Candidate(CandidateID),
    FOREIGN KEY (ElectionID) REFERENCES Election(ElectionID),
    FOREIGN KEY (PollingStationID) REFERENCES PollingStation(PollingStationID),
    UNIQUE (VoterID, ElectionID)
);

INSERT INTO Voter (Name) VALUES
('John Doe'),
('Jane Smith'),
('Alice Johnson');

INSERT INTO Election (ElectionType) VALUES
('Presidential'),
('Local');

INSERT INTO Candidate (Name, Party, ElectionID) VALUES
('Bob Brown', 'Party A', 1),
('Carol White', 'Party B', 1),
('David Green', 'Party C', 2);

INSERT INTO PollingStation (Location) VALUES
('City Hall'),
('Community Center');