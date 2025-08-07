create database F1RACINGDB1

use F1RACINGDB1

CREATE TABLE Racer (
    Racer_ID INT PRIMARY KEY,
    Team_ID INT NOT NULL,
    Car_ID INT NOT NULL,
    Championship_ID INT NOT NULL,
    Racer_F_Name VARCHAR(255) NOT NULL,
    Racer_L_Name VARCHAR(255) NOT NULL,
    Address_1 VARCHAR(255),
    Address_2 VARCHAR(255),
    City VARCHAR(255),
    State VARCHAR(255),
    Zip_Code VARCHAR(10),
    Phone_Area_Code VARCHAR(5),
    Phone_Number VARCHAR(15),
    Racer_Nationality VARCHAR(255),
    FOREIGN KEY (Team_ID) REFERENCES Team(Team_ID),
    FOREIGN KEY (Car_ID) REFERENCES Car(Car_ID),
    FOREIGN KEY (Championship_ID) REFERENCES Championship(Championship_ID)
);

CREATE TABLE Circuit (
    Circuit_ID INT PRIMARY KEY,
    Address_1 VARCHAR(255),
    Address_2 VARCHAR(255),
    City VARCHAR(255),
    State VARCHAR(255),
    Zip_Code VARCHAR(10) NOT NULL,
    Circuit_Temperature FLOAT,
    Circuit_Track_Layout VARCHAR(255),
    Circuit_Construction_Date DATE NOT NULL
);

CREATE TABLE Pit_Stop (
    PS_ID INT PRIMARY KEY,
    Team_ID INT NOT NULL,
    Tire_Change_Time TIME,
    PS_Fueling_Time TIME,
    Racer_Change_Time TIME,
    Repair_Time TIME,
    Total_Time TIME,
    FOREIGN KEY (Team_ID) REFERENCES Team(Team_ID)
);

CREATE TABLE Team (
    Team_ID INT PRIMARY KEY,
    Team_Name VARCHAR(255) NOT NULL,
    Team_Owner_F_Name VARCHAR(255),
    Team_Owner_L_Name VARCHAR(255) NOT NULL,
    Team_No_Of_Drivers VARCHAR(255) 
);

CREATE TABLE Sponsor (
    Sponsor_ID INT PRIMARY KEY,
    Team_ID INT NOT NULL,
    Sponsor_F_Name VARCHAR(255),
    Sponsor_L_Name VARCHAR(255) NOT NULL,
    Sponsor_Contract_Duration INT,
    Amount DECIMAL(10, 2) NOT NULL,
    Basic_Terms TEXT,
    FOREIGN KEY (Team_ID) REFERENCES Team(Team_ID)
);

CREATE TABLE Coach (
    Coach_ID INT PRIMARY KEY,
    Team_ID INT NOT NULL,
    Coach_F_Name VARCHAR(255) NOT NULL,
    Coach_L_Name VARCHAR(255) NOT NULL,
    Address_1 VARCHAR(255),
    Address_2 VARCHAR(255),
    City VARCHAR(255),
    State VARCHAR(255),
    Zip_Code VARCHAR(10),
    Phone_Area_Code VARCHAR(5),
    Phone_Number VARCHAR(15),
    Coach_Expertise VARCHAR(255) NOT NULL,
    FOREIGN KEY (Team_ID) REFERENCES Team(Team_ID)
);

CREATE TABLE Race (
    Race_ID INT PRIMARY KEY,
    Circuit_ID INT NOT NULL,
    Championship_ID INT NOT NULL,
    Race_Date DATE,
    Winner_F_Name VARCHAR(255) NOT NULL,
    Runner_F_Name VARCHAR(255) NOT NULL,
    Temperature FLOAT,
    FOREIGN KEY (Circuit_ID) REFERENCES Circuit(Circuit_ID),
    FOREIGN KEY (Championship_ID) REFERENCES Championship(Championship_ID)
);

CREATE TABLE Championship (
    Championship_ID INT PRIMARY KEY,
    Season_ID INT NOT NULL,
    Season_Name VARCHAR(255),
    Winner_F_Name VARCHAR(255),
    Winner_L_Name VARCHAR(255) NOT NULL,
    Runner_F_Name VARCHAR(255),
    Runner_L_Name VARCHAR(255) NOT NULL
);

CREATE TABLE Car (
    Car_ID INT PRIMARY KEY,
    Team_ID INT NOT NULL,
    Car_Chassis_Number VARCHAR(255) NOT NULL,
    Car_Engine_Type VARCHAR(255),
    Car_Wheel_Specifications VARCHAR(255),
    Car_Body_Modifications TEXT,
    Car_Performance_Data TEXT,
    FOREIGN KEY (Team_ID) REFERENCES Team(Team_ID)
);


--Multi-Valued 
CREATE TABLE Family (
    Family_ID INT,
    Racer_ID INT NOT NULL,
    First_Name VARCHAR(255) NOT NULL,
    Last_Name VARCHAR(255) NOT NULL,
    Address_1 VARCHAR(255),
    Address_2 VARCHAR(255),
    City VARCHAR(255),
    State VARCHAR(255),
    Zip_Code VARCHAR(10),
    Phone_Area_Code VARCHAR(5),
    Phone_Number VARCHAR(15),
	PRIMARY KEY (Family_ID, Racer_ID),
    FOREIGN KEY (Racer_ID) REFERENCES Racer(Racer_ID)
);

CREATE TABLE Laps (
    Lap_Number INT,
    Race_ID INT NOT NULL,
    Winning_Team VARCHAR(255),
    Winning_Lap_Time TIME,
	PRIMARY KEY (Lap_Number, Race_ID),
    FOREIGN KEY (Race_ID) REFERENCES Race(Race_ID)
);

CREATE TABLE Technical_Staff (
    Staff_ID INT,
    Team_ID INT,
    Domain VARCHAR(255),
    First_Name VARCHAR(255),
    Last_Name VARCHAR(255),
	PRIMARY KEY (Staff_ID,Team_ID),
    FOREIGN KEY (Team_ID) REFERENCES Team(Team_ID)
);


CREATE TABLE Engine (
    Car_ID INT PRIMARY KEY,
    Engine_Part_ID INT,
    Part_Name VARCHAR(255),
    Count INT,
    FOREIGN KEY (Car_ID) REFERENCES Car(Car_ID)
);

CREATE TABLE Wheel (
    Car_ID INT PRIMARY KEY,
    Wheel_Part_ID INT,
    Part_Name VARCHAR(255),
    Count INT,
    FOREIGN KEY (Car_ID) REFERENCES Car(Car_ID)
);

CREATE TABLE Body (
    Car_ID INT PRIMARY KEY,
    Body_Part_ID INT,
    Part_Name VARCHAR(255),
    Count INT,
    FOREIGN KEY (Car_ID) REFERENCES Car(Car_ID)
);

CREATE TABLE Racer_Coach (
    Racer_ID INT,
    Coach_ID INT,
    PRIMARY KEY (Racer_ID, Coach_ID),
    FOREIGN KEY (Racer_ID) REFERENCES Racer(Racer_ID),
    FOREIGN KEY (Coach_ID) REFERENCES Coach(Coach_ID)
);

select * from coach;

CREATE TABLE Champ_Team (
    Team_ID INT,
    Championship_ID INT,
    PRIMARY KEY (Team_ID, Championship_ID),
    FOREIGN KEY (Team_ID) REFERENCES Team(Team_ID),
    FOREIGN KEY (Championship_ID) REFERENCES Championship(Championship_ID)
);

CREATE TABLE Circuit_Team (
    Circuit_ID INT,
    Team_ID INT,
    PRIMARY KEY (Circuit_ID, Team_ID),
    FOREIGN KEY (Circuit_ID) REFERENCES Circuit(Circuit_ID),
    FOREIGN KEY (Team_ID) REFERENCES Team(Team_ID)
);

CREATE TABLE Parts(
	Part_Type VARCHAR(255) PRIMARY KEY,
	Classification VARCHAR(255) 
);

ALTER TABLE CAR 
ADD Part_Type VARCHAR(255);

ALTER TABLE CAR
ADD FOREIGN KEY (Part_Type) REFERENCES Parts(Part_Type)


--insert

INSERT INTO Team (Team_ID, Team_Name, Team_Owner_F_Name, Team_Owner_L_Name, Team_No_Of_Drivers)
VALUES (1, 'Red Bull Racing', 'Christian', 'Horner', '2'),
       (2, 'Mercedes-AMG Petronas Formula One Team', 'Toto', 'Wolff', '2'),
       (3, 'Scuderia Ferrari', 'Mattia', 'Binotto', '2'),
       (4, 'McLaren Racing', 'Zak', 'Brown', '2'),
       (5, 'Alpine F1 Team', 'Laurent', 'Rossi', '2'),
       (6, 'Aston Martin F1 Team', 'Lawrence', 'Stroll', '2'),
       (7, 'Alfa Romeo Racing Orlen', 'Fred', 'Vasseur', '2'),
       (8, 'Haas F1 Team', 'Gene', 'Haas', '2'),
       (9, 'Williams Racing', 'Jost', 'Capito', '2'),
       (10, 'Uralkali Haas F1 Team', 'Dmitry', 'Mazepin', '2');

INSERT INTO Championship (Championship_ID, Season_ID, Season_Name, Winner_F_Name, Winner_L_Name, Runner_F_Name, Runner_L_Name)
VALUES (200, 1, '2022 FIA Formula One World Championship', 'Lewis', 'Hamilton', 'Max', 'Verstappen'),
       (201, 2, '2023 FIA Formula One World Championship', 'Max', 'Verstappen', 'Lewis', 'Hamilton'),
       (202, 3, '2024 FIA Formula One World Championship', 'Charles', 'Leclerc', 'Max', 'Verstappen'),
       (203, 4, '2025 FIA Formula One World Championship', 'Max', 'Verstappen', 'Charles', 'Leclerc'),
       (204, 5, '2026 FIA Formula One World Championship', 'Lando', 'Norris', 'Daniel', 'Ricciardo'),
       (205, 6, '2027 FIA Formula One World Championship', 'Mick', 'Schumacher', 'Nikita', 'Mazepin'),
       (206, 7, '2028 FIA Formula One World Championship', 'Valtteri', 'Bottas', 'Lando', 'Norris'),
       (207, 8, '2029 FIA Formula One World Championship', 'George', 'Russell', 'Lewis', 'Hamilton'),
       (208, 9, '2030 FIA Formula One World Championship', 'Fernando', 'Alonso', 'Sebastian', 'Vettel'),
       (209, 10, '2031 FIA Formula One World Championship', 'Pierre', 'Gasly', 'Max', 'Verstappen');


INSERT INTO Circuit (Circuit_ID, Address_1, City, State, Zip_Code, Circuit_Temperature, Circuit_Track_Layout, Circuit_Construction_Date)
VALUES (100, '123 Main St', 'Melbourne', 'Victoria', '3000', 25.5, 'Street Circuit', '2020-01-01'),
       (101, '456 Elm St', 'Monza', 'Lombardy', '20052', 30.0, 'Permanent Circuit', '2000-05-15'),
       (102, '789 Oak St', 'Suzuka', 'Mie Prefecture', '510-0295', 28.2, 'Grand Prix Circuit', '1987-11-01'),
       (103, '321 Pine St', 'Shanghai', 'Shanghai', '200051', 26.8, 'Permanent Circuit', '2004-07-01'),
       (104, '654 Maple St', 'Austin', 'Texas', '78617', 32.1, 'Circuit of the Americas', '2012-10-21'),
       (105, '987 Cedar St', 'Monte Carlo', 'Monaco', '98000', 28.5, 'Street Circuit', '1929-04-14'),
       (106, '147 Elmwood Ave', 'Baku', 'Baku', '1000', 30.9, 'Street Circuit', '2016-06-17'),
       (107, '258 Oakwood Dr', 'Sakhir', 'Central Governorate', '1744', 32.7, 'Permanent Circuit', '2004-04-04'),
       (108, '369 Walnut Ln', 'Sao Paulo', 'Sao Paulo', '05503-001', 26.3, 'Autodromo Jose Carlos Pace', '1940-05-12'),
       (109, '741 Cherry Blvd', 'Silverstone', 'Northamptonshire', 'NN12 8TN', 23.8, 'Grand Prix Circuit', '1948-10-02');


INSERT INTO Car (Car_ID, Team_ID, Car_Chassis_Number, Car_Engine_Type, Car_Wheel_Specifications, Car_Body_Modifications, Car_Performance_Data)
VALUES (400, 1, 'RB001', 'Renault', 'Pirelli 18"', 'Aero package', 'Performance stats ok'),
       (401, 2, 'W11', 'Mercedes', 'Pirelli 18"', 'Technical upgrades', 'Performance stats not ok'),
       (402, 3, 'SF21', 'Ferrari', 'Pirelli 18"', 'Body refinements', 'Performance stats ok'),
       (403, 4, 'MCL35M', 'Mercedes', 'Pirelli 18"', 'Chassis improvements', 'Performance stats ok'),
       (404, 5, 'A522', 'Renault', 'Pirelli 18"', 'Aero package', 'Performance stats not ok'),
       (405, 6, 'AMR22', 'Mercedes', 'Pirelli 18"', 'Technical upgrades', 'Performance stats ok'),
       (406, 7, 'C42', 'Ferrari', 'Pirelli 18"', 'Body refinements', 'Performance stats ok'),
       (407, 8, 'VF-22', 'Ferrari', 'Pirelli 18"', 'Chassis improvements', 'Performance stats not ok'),
       (408, 9, 'FW44', 'Renault', 'Pirelli 18"', 'Aero package', 'Performance stats not ok'),
       (409, 10, 'VF-23', 'Ferrari', 'Pirelli 18"', 'Technical upgrades', 'Performance stats ok');

INSERT INTO Pit_Stop (PS_ID, Team_ID, Tire_Change_Time, PS_Fueling_Time, Racer_Change_Time, Repair_Time, Total_Time)
VALUES (1, 1, '00:02:30', '00:01:00', '00:00:30', '00:00:20', '00:04:20'),
       (2, 2, '00:02:20', '00:01:10', '00:00:25', '00:00:15', '00:04:10'),
       (3, 3, '00:02:25', '00:01:05', '00:00:28', '00:00:18', '00:04:16'),
       (4, 4, '00:02:35', '00:00:55', '00:00:32', '00:00:22', '00:04:24'),
       (5, 5, '00:02:28', '00:01:02', '00:00:27', '00:00:17', '00:04:14'),
       (6, 6, '00:02:22', '00:01:08', '00:00:26', '00:00:16', '00:04:12'),
       (7, 7, '00:02:32', '00:00:58', '00:00:31', '00:00:21', '00:04:22'),
       (8, 8, '00:02:27', '00:01:03', '00:00:29', '00:00:19', '00:04:18'),
       (9, 9, '00:02:33', '00:00:57', '00:00:33', '00:00:23', '00:04:26'),
       (10, 10, '00:02:23', '00:01:07', '00:00:24', '00:00:14', '00:04:08');

INSERT INTO Sponsor (Sponsor_ID, Team_ID, Sponsor_F_Name, Sponsor_L_Name, Sponsor_Contract_Duration, Amount, Basic_Terms)
VALUES (10, 1, 'John', 'Doe', 3, 1000000.00, 'Promotional activities, logo placement'),
       (11, 2, 'Jane', 'Smith', 2, 750000.00, 'Marketing events, advertising'),
       (12, 3, 'Mark', 'Johnson', 5, 1500000.00, 'Exclusive branding, social media campaigns'),
       (13, 4, 'Emily', 'Brown', 4, 1200000.00, 'Product endorsements, PR activities'),
       (14, 5, 'Chris', 'Williams', 3, 900000.00, 'Digital marketing, sponsor logos'),
       (15, 6, 'Sarah', 'Davis', 2, 700000.00, 'Corporate hospitality, brand visibility'),
       (16, 7, 'Michael', 'Martinez', 5, 1600000.00, 'Title sponsor, media coverage'),
       (17, 8, 'Jessica', 'Garcia', 4, 1300000.00, 'Event sponsorships, advertising campaigns'),
       (18, 9, 'David', 'Rodriguez', 3, 950000.00, 'Branding opportunities, promotional events'),
       (19, 10, 'Rachel', 'Miller', 2, 800000.00, 'Marketing partnerships, advertising slots');


INSERT INTO Coach (Coach_ID, Team_ID, Coach_F_Name, Coach_L_Name, Address_1, City, State, Zip_Code, Phone_Area_Code, Phone_Number, Coach_Expertise)
VALUES (1, 1, 'Alex', 'Smith', '123 Coach St', 'London', 'England', 'SW1A 1AA', '020', '12345678', 'Technical strategy'),
       (2, 2, 'James', 'Johnson', '456 Coach Ave', 'Berlin', 'Germany', '10115', '030', '87654321', 'Race tactics'),
       (3, 3, 'Emma', 'Williams', '789 Coach Blvd', 'Paris', 'France', '75001', '01', '98765432', 'Team management'),
       (4, 4, 'Andrew', 'Brown', '321 Coach Ln', 'Rome', 'Italy', '00184', '06', '23456789', 'Driver coaching'),
       (5, 5, 'Sophia', 'Martinez', '654 Coach Dr', 'Madrid', 'Spain', '28001', '91', '34567890', 'Technical support'),
       (6, 6, 'Daniel', 'Garcia', '987 Coach Rd', 'Lisbon', 'Portugal', '1200-109', '21', '45678901', 'Performance analysis'),
       (7, 7, 'Olivia', 'Rodriguez', '147 Coach Blvd', 'Amsterdam', 'Netherlands', '1012 HV', '020', '56789012', 'Strategic planning'),
       (8, 8, 'Michaela', 'Miller', '258 Coach Ln', 'Brussels', 'Belgium', '1000', '02', '67890123', 'Team development'),
       (9, 9, 'Isabella', 'Anderson', '369 Coach Dr', 'Vienna', 'Austria', '1010', '01', '78901234', 'Resource management'),
       (10, 10, 'Nathan', 'Wilson', '741 Coach Rd', 'Dublin', 'Ireland', 'D01 P8C9', '01', '89012345', 'Technical expertise');


INSERT INTO Racer (Racer_ID, Team_ID, Car_ID, Championship_ID, Racer_F_Name, Racer_L_Name, Address_1, City, State, Zip_Code, Phone_Area_Code, Phone_Number, Racer_Nationality)
VALUES (1000, 1, 400, 200, 'Max', 'Verstappen', '123 Racer St', 'London', 'England', 'SW1A 1AA', '020', '12345678', 'Dutch'),
       (1001, 2, 401, 201, 'Lewis', 'Hamilton', '456 Racer Ave', 'Berlin', 'Germany', '10115', '030', '87654321', 'British'),
       (1002, 3, 402, 202, 'Charles', 'Leclerc', '789 Racer Blvd', 'Paris', 'France', '75001', '01', '98765432', 'Monégasque'),
       (1003, 4, 403, 203, 'Lando', 'Norris', '321 Racer Ln', 'Rome', 'Italy', '00184', '06', '23456789', 'British'),
       (1004, 5, 404, 204, 'Fernando', 'Alonso', '654 Racer Dr', 'Madrid', 'Spain', '28001', '91', '34567890', 'Spanish'),
       (1005, 6, 405, 205, 'Sebastian', 'Vettel', '987 Racer Rd', 'Lisbon', 'Portugal', '1200-109', '21', '45678901', 'German'),
       (1006, 7, 406, 206, 'Valtteri', 'Bottas', '147 Racer Blvd', 'Amsterdam', 'Netherlands', '1012 HV', '020', '56789012', 'Finnish'),
       (1007, 8, 407, 207, 'Daniel', 'Ricciardo', '258 Racer Ln', 'Brussels', 'Belgium', '1000', '02', '67890123', 'Australian'),
       (1008, 9, 408, 208, 'George', 'Russell', '369 Racer Dr', 'Vienna', 'Austria', '1010', '01', '78901234', 'British'),
       (1009, 10, 409, 209, 'Pierre', 'Gasly', '741 Racer Rd', 'Dublin', 'Ireland', 'D01 P8C9', '01', '89012345', 'French');


INSERT INTO Family (Family_ID, Racer_ID, First_Name, Last_Name, Address_1, City, State, Zip_Code, Phone_Area_Code, Phone_Number)
VALUES (1501, 1000, 'Emma', 'Verstappen', '123 Family St', 'London', 'England', 'SW1A 1AA', '020', '12345678'),
       (1502, 1001, 'Nicole', 'Hamilton', '456 Family Ave', 'Berlin', 'Germany', '10115', '030', '87654321'),
       (1503, 1002, 'Sophie', 'Leclerc', '789 Family Blvd', 'Paris', 'France', '75001', '01', '98765432'),
       (1504, 1003, 'Ethan', 'Norris', '321 Family Ln', 'Rome', 'Italy', '00184', '06', '23456789'),
       (1505, 1004, 'Carlos', 'Alonso', '654 Family Dr', 'Madrid', 'Spain', '28001', '91', '34567890'),
       (1506, 1005, 'Maximilian', 'Vettel', '987 Family Rd', 'Lisbon', 'Portugal', '1200-109', '21', '45678901'),
       (1507, 1006, 'Isabelle', 'Bottas', '147 Family Blvd', 'Amsterdam', 'Netherlands', '1012 HV', '020', '56789012'),
       (1508, 1007, 'Lucas', 'Ricciardo', '258 Family Ln', 'Brussels', 'Belgium', '1000', '02', '67890123'),
       (1509, 1008, 'Amelia', 'Russell', '369 Family Dr', 'Vienna', 'Austria', '1010', '01', '78901234'),
       (1510, 1009, 'Gabriel', 'Gasly', '741 Family Rd', 'Dublin', 'Ireland', 'D01 P8C9', '01', '89012345');


INSERT INTO Race (Race_ID, Circuit_ID, Championship_ID, Race_Date, Winner_F_Name, Runner_F_Name, Temperature)
VALUES (500, 100, 200, '2022-03-20', 'Max', 'Lewis', 28.5),
       (501, 101, 201, '2023-09-10', 'Max', 'Lewis', 31.2),
       (502, 102, 202, '2024-06-25', 'Charles', 'Max', 29.8),
       (503, 103, 203, '2025-04-13', 'Max', 'Charles', 27.4),
       (504, 104, 204, '2026-11-02', 'Lando', 'Daniel', 33.0),
       (505, 105, 205, '2027-08-17', 'Mick', 'Nikita', 30.5),
       (506, 106, 206, '2028-05-21', 'Valtteri', 'Lando', 28.9),
       (507, 107, 207, '2029-03-05', 'George', 'Lewis', 32.2),
       (508, 108, 208, '2030-10-30', 'Fernando', 'Sebastian', 26.7),
       (509, 109, 209, '2031-07-14', 'Pierre', 'Max', 30.1);

INSERT INTO Laps (Lap_Number, Race_ID, Winning_Team, Winning_Lap_Time)
VALUES (1101, 500, 'Red Bull Racing', '00:01:30'),
       (1102, 501, 'Mercedes-AMG Petronas Formula One Team', '00:01:25'),
       (1103, 502, 'Scuderia Ferrari', '00:01:28'),
       (1104, 503, 'Red Bull Racing', '00:01:32'),
       (1105, 504, 'McLaren Racing', '00:01:20'),
       (1106, 505, 'Alpine F1 Team', '00:01:18'),
       (1107, 506, 'Aston Martin F1 Team', '00:01:23'),
       (1108, 507, 'Alfa Romeo Racing Orlen', '00:01:29'),
       (1109, 508, 'Williams Racing', '00:01:35'),
       (1110, 509, 'Uralkali Haas F1 Team', '00:01:27');


INSERT INTO Technical_Staff (Staff_ID, Team_ID, Domain, First_Name, Last_Name)
VALUES (1701, 1, 'Engineering', 'John', 'Smith'),
       (1702, 2, 'Aerodynamics', 'Jane', 'Doe'),
       (1703, 3, 'Data Analysis', 'Mark', 'Johnson'),
       (1704, 4, 'Mechanics', 'Emily', 'Brown'),
       (1705, 5, 'Performance', 'Chris', 'Williams'),
       (1706, 6, 'Strategy', 'Sarah', 'Davis'),
       (1707, 7, 'Technical', 'Michael', 'Martinez'),
       (1708, 8, 'Operations', 'Jessica', 'Garcia'),
       (1709, 9, 'Development', 'David', 'Rodriguez'),
       (1710, 10, 'Testing', 'Rachel', 'Miller');


INSERT INTO Engine (Car_ID, Engine_Part_ID, Part_Name, Count)
VALUES (400, 1001, 'Turbocharger', 2),
       (401, 1002, 'Piston Assembly', 4),
       (402, 1003, 'Cylinder Head', 3),
       (403, 1004, 'Fuel Injector', 6),
       (404, 1005, 'Crankshaft', 2),
       (405, 1006, 'Camshaft', 3),
       (406, 1007, 'Exhaust Manifold', 2),
       (407, 1008, 'Intake Valve', 4),
       (408, 1009, 'Engine Block', 3),
       (409, 1010, 'Oil Pump', 2);


INSERT INTO Wheel (Car_ID, Wheel_Part_ID, Part_Name, Count)
VALUES (400, 2001, 'Alloy Wheel', 12),
       (401, 2002, 'Tire', 20),
       (402, 2003, 'Rim', 16),
       (403, 2004, 'Hubcap', 18),
       (404, 2005, 'Spoke', 20),
       (405, 2006, 'Valve Stem', 24),
       (406, 2007, 'Wheel Bearing', 14),
       (407, 2008, 'Wheel Nut', 20),
       (408, 2009, 'Wheel Balancer', 2),
       (409, 2010, 'Wheel Aligner', 2);


INSERT INTO Body (Car_ID, Body_Part_ID, Part_Name, Count)
VALUES (400, 3001, 'Front Bumper', 2),
       (401, 3002, 'Rear Bumper', 2),
       (402, 3003, 'Hood', 2),
       (403, 3004, 'Fender', 4),
       (404, 3005, 'Door', 4),
       (405, 3006, 'Quarter Panel', 4),
       (406, 3007, 'Trunk Lid', 2),
       (407, 3008, 'Grille', 2),
       (408, 3009, 'Roof Panel', 2),
       (409, 3010, 'Window Glass', 6);


-- Inserting data into the Racer_Coach table
INSERT INTO Racer_Coach (Racer_ID, Coach_ID)
VALUES 
(1000, 1),
(1001, 2),
(1002, 3),
(1003, 4),
(1004, 5),
(1005, 6),
(1006, 7),
(1007, 8),
(1008, 9),
(1009, 10);

-- Inserting data into the Champ_Team table
INSERT INTO Champ_Team (Team_ID, Championship_ID, Winning_Team)
VALUES 
(1, 200, 'Team A'),
(2, 201, 'Team B'),
(3, 202, 'Team C'),
(4, 203, 'Team D'),
(5, 204, 'Team E'),
(6, 205, 'Team F'),
(7, 206, 'Team G'),
(8, 207, 'Team H'),
(9, 208, 'Team I'),
(10, 209, 'Team J');

-- Inserting data into the Circuit_Team table
INSERT INTO Circuit_Team (Circuit_ID, Team_ID)
VALUES 
(100, 1),
(101, 2),
(102, 3),
(103, 4),
(104, 5),
(105, 6),
(106, 7),
(107, 8),
(108, 9),
(109, 10);

select * from circuit
select * from wheel




--REPORT 1: To analyze team performance and related data
/*This report provides an analysis of team performance and related data in Formula One racing. 
It includes details such as team names, pit stop times for tire changes and refueling, coach expertise, 
car engine types, and car wheel specifications. By joining information from multiple tables, the report 
offers insights into how different aspects such as coaching expertise and car specifications may influence 
team performance during races.*/
SELECT T.Team_Name, P.Tire_Change_Time, P.PS_Fueling_Time, C.Coach_Expertise, CR.Car_Engine_Type, 
CR.Car_Wheel_Specifications
FROM Team T
JOIN Pit_Stop P ON T.Team_ID = P.Team_ID
JOIN Coach C ON T.Team_ID = C.Team_ID
JOIN Car CR ON T.Team_ID = CR.Team_ID;


--REPORT 2: To analyze sponsorship engagement and team performance
/*This report provides information about sponsorship engagement and team performance in Formula One racing. 
It includes details such as sponsor names, team names, championship seasons, and the winning/runner-up racers for 
each season. The data is presented in descending order based on championship seasons, offering insights into 
sponsor-team relationships and performance trends over time.*/
SELECT S.Sponsor_ID, S.Sponsor_F_Name, S.Sponsor_L_Name, T.Team_Name, C.Season_Name, C.Winner_F_Name, C.Runner_F_Name
FROM Sponsor S
JOIN Team T ON S.Team_ID = T.Team_ID
JOIN Championship C ON S.Team_ID = C.Season_ID
ORDER BY C.Season_Name DESC;

-- Report 3: To analyze pit stop efficiency
/*This report shows how fast each team completes different tasks during a pit stop. 
Teams that finish these tasks quickly are usually better at managing pit stops, which can make a big difference 
in how well they do in races. This report helps teams see where they can make their pit stops faster and improve 
how well they race overall.*/
SELECT T.Team_Name, PS.Tire_Change_Time, PS.PS_Fueling_Time, PS.Racer_Change_Time, PS.Repair_Time, PS.Total_Time
FROM Team T
LEFT JOIN Pit_Stop PS ON T.Team_ID = PS.Team_ID
ORDER BY PS.Total_Time ASC;

-- Report 4: To analyze sponsorship contracts
/*This query retrieves data related to sponsorship contracts, including the team name, sponsor details, 
contract duration, and sponsorship amount. It provides insights into the financial relationships between 
teams and sponsors, helping to evaluate the significance of sponsorships in Formula One racing.*/
SELECT T.Team_Name, S.Sponsor_F_Name, S.Sponsor_L_Name, S.Sponsor_Contract_Duration, S.Amount
FROM Team T
JOIN Sponsor S ON T.Team_ID = S.Team_ID
ORDER BY S.Amount DESC;




