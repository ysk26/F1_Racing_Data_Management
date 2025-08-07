CREATE TABLE Racer (
    Racer_ID INT IDENTITY(1000,1) PRIMARY KEY,
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
    Circuit_ID INT IDENTITY(100,1) PRIMARY KEY,
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
    PS_ID INT IDENTITY(1,10) PRIMARY KEY,
    Team_ID INT NOT NULL,
    Tire_Change_Time TIME,
    PS_Fueling_Time TIME,
    Racer_Change_Time TIME,
    Repair_Time TIME,
    Total_Time TIME,
    FOREIGN KEY (Team_ID) REFERENCES Team(Team_ID)
);

CREATE TABLE Team (
    Team_ID INT IDENTITY(1,1) PRIMARY KEY,
    Team_Name VARCHAR(255) NOT NULL,
    Team_Owner_F_Name VARCHAR(255),
    Team_Owner_L_Name VARCHAR(255) NOT NULL,
    Team_No_Of_Drivers VARCHAR(255) 
);

CREATE TABLE Sponsor (
    Sponsor_ID INT IDENTITY(10,1) PRIMARY KEY,
    Team_ID INT NOT NULL,
    Sponsor_F_Name VARCHAR(255),
    Sponsor_L_Name VARCHAR(255) NOT NULL,
    Sponsor_Contract_Duration INT,
    Amount DECIMAL(10, 2) NOT NULL,
    Basic_Terms TEXT,
    FOREIGN KEY (Team_ID) REFERENCES Team(Team_ID)
);

CREATE TABLE Coach (
    Coach_ID INT IDENTITY(1,1) PRIMARY KEY,
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
    Race_ID INT IDENTITY(500,1) PRIMARY KEY,
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
    Championship_ID INT IDENTITY(200,1) PRIMARY KEY,
    Season_ID INT NOT NULL,
    Season_Name VARCHAR(255),
    Winner_F_Name VARCHAR(255),
    Winner_L_Name VARCHAR(255) NOT NULL,
    Runner_F_Name VARCHAR(255),
    Runner_L_Name VARCHAR(255) NOT NULL
);

CREATE TABLE Car (
    Car_ID INT IDENTITY(400,1) PRIMARY KEY,
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
    Family_ID INT IDENTITY(1501,1) PRIMARY KEY,
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
    FOREIGN KEY (Racer_ID) REFERENCES Racer(Racer_ID)
);

CREATE TABLE Laps (
    Lap_Number INT IDENTITY(1101,1) PRIMARY KEY,
    Race_ID INT NOT NULL,
    Winning_Team VARCHAR(255),
    Winning_Lap_Time TIME,
    FOREIGN KEY (Race_ID) REFERENCES Race(Race_ID)
);

CREATE TABLE Technical_Staff (
    Staff_ID INT IDENTITY(1701,1) PRIMARY KEY,
    Team_ID INT,
    Domain VARCHAR(255),
    First_Name VARCHAR(255),
    Last_Name VARCHAR(255),
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
    Winning_Team VARCHAR(255),
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

---Inserting Data
-- Inserting data into the Racer table
INSERT INTO Racer (Team_ID, Car_ID, Championship_ID, Racer_F_Name, Racer_L_Name, Address_1, Address_2, City, State, Zip_Code, Phone_Area_Code, Phone_Number, Racer_Nationality)
VALUES 
(1, 1, 1, 'John', 'Doe', '123 Main St', '', 'Raceville', 'Racingstate', '54321', '777', '555-7777', 'American'),
(2, 2, 1, 'Jane', 'Smith', '456 Speedway Blvd', '', 'Speedy City', 'Fastland', '98765', '888', '555-8888', 'British'),
(3, 3, 1, 'Michael', 'Johnson', '789 Raceway Ln', '', 'Zoomtown', 'Quickville', '12345', '999', '555-9999', 'German'),
(4, 4, 1, 'Maria', 'Garcia', '101 Racing Rd', '', 'Racerville', 'Speedstate', '23456', '111', '555-1111', 'Spanish'),
(5, 5, 1, 'Alex', 'Martinez', '202 Speed Blvd', '', 'Race City', 'Quickland', '34567', '222', '555-2222', 'Italian'),
(6, 6, 1, 'Sophia', 'Lee', '303 Quick Lane', '', 'Fastville', 'Speedstate', '45678', '333', '555-3333', 'French'),
(7, 7, 1, 'Daniel', 'Wong', '404 Speedy Rd', '', 'Velocitytown', 'Quickstate', '56789', '444', '555-4444', 'Japanese'),
(8, 8, 1, 'Emma', 'Chen', '505 Fastway Ave', '', 'Rapid City', 'Speedland', '67890', '555', '555-5555', 'Chinese'),
(9, 9, 1, 'Liam', 'Kim', '606 Acceleration Blvd', '', 'Quickville', 'Speedstate', '78901', '666', '555-6666', 'Korean'),
(10, 10, 1, 'Olivia', 'Nguyen', '707 Rush St', '', 'Speedtopia', 'Fastland', '89012', '777', '555-7777', 'Vietnamese');

-- Inserting data into the Circuit table (Already provided in previous script)

-- Inserting data into the Pit_Stop table
INSERT INTO Pit_Stop (Team_ID, Tire_Change_Time, PS_Fueling_Time, Racer_Change_Time, Repair_Time, Total_Time)
VALUES 
(1, '00:02:30', '00:04:00', '00:01:45', '00:00:30', '00:08:45'),
(2, '00:02:45', '00:03:45', '00:01:30', '00:00:45', '00:08:45'),
(3, '00:02:15', '00:04:30', '00:01:40', '00:00:35', '00:09:00'),
(4, '00:02:20', '00:04:15', '00:01:35', '00:00:40', '00:08:50'),
(5, '00:02:35', '00:03:30', '00:01:25', '00:00:50', '00:08:20'),
(6, '00:02:25', '00:04:15', '00:01:50', '00:00:25', '00:08:55'),
(7, '00:02:40', '00:03:45', '00:01:30', '00:00:45', '00:08:40'),
(8, '00:02:30', '00:03:30', '00:01:20', '00:00:55', '00:08:15'),
(9, '00:02:20', '00:04:00', '00:01:55', '00:00:20', '00:09:15'),
(10, '00:02:15', '00:04:15', '00:01:40', '00:00:35', '00:08:45');

-- Inserting data into the Team table (Already provided in previous script)
INSERT INTO Team (Team_Name, Team_Owner_F_Name, Team_Owner_L_Name, Team_No_Of_Drivers)
VALUES 
('Team A', 'John', 'Doe', '2'),
('Team B', 'Jane', 'Smith', '1'),
('Team C', 'Michael', 'Johnson', '3'),
('Team D', 'Robert', 'Williams', '2'),
('Team E', 'Sarah', 'Brown', '1'),
('Team F', 'David', 'Jones', '3'),
('Team G', 'Emily', 'Miller', '2'),
('Team H', 'James', 'Wilson', '1'),
('Team I', 'Emma', 'Moore', '3'),
('Team J', 'Daniel', 'Anderson', '2');

select * from Team

-- Inserting data into the Sponsor table
INSERT INTO Sponsor (Team_ID, Sponsor_F_Name, Sponsor_L_Name, Sponsor_Contract_Duration, Amount, Basic_Terms)
VALUES 
(1, 'ABC Motors', 'Inc.', 2, 50000.00, 'Exclusive branding on cars and team apparel'),
(2, 'Speedy Auto', 'Group', 3, 75000.00, 'Co-branded advertising campaigns'),
(3, 'FastTrack', 'Racing', 2, 60000.00, 'Prominent logo placement on cars and website'),
(4, 'Racing Dynamics', 'Corp.', 3, 80000.00, 'Title sponsor for championship events'),
(5, 'Velocity Racing', 'Ltd.', 2, 55000.00, 'Product placement and event hospitality'),
(6, 'Rapid Motorsports', 'LLC', 2, 60000.00, 'Social media promotions and PR events'),
(7, 'QuickSpeed', 'Enterprises', 3, 70000.00, 'Branding on team uniforms and equipment'),
(8, 'Rush Racing', 'Co.', 2, 60000.00, 'Exclusive sponsor of pit stop activities'),
(9, 'Accelerate', 'Racing', 2, 55000.00, 'Official partner for team merchandise'),
(10, 'FastLane', 'Motors', 3, 75000.00, 'Joint marketing initiatives and sponsor events');

-- Inserting data into the Coach table
INSERT INTO Coach (Team_ID, Coach_F_Name, Coach_L_Name, Address_1, Address_2, City, State, Zip_Code, Phone_Area_Code, Phone_Number, Coach_Expertise)
VALUES 
(1, 'David', 'Johnson', '123 Coach Ave', '', 'Coachingville', 'Coachingstate', '54321', '777', '555-7777', 'Technical Strategies'),
(2, 'Sarah', 'Anderson', '456 Speedy Coach Blvd', '', 'Fast City', 'Quickland', '98765', '888', '555-8888', 'Driver Development'),
(3, 'Michael', 'Brown', '789 Racing Coach Ln', '', 'Raceway City', 'Speedland', '12345', '999', '555-9999', 'Team Management'),
(4, 'Jessica', 'Taylor', '101 Coach Rd', '', 'Coachville', 'Speedstate', '23456', '111', '555-1111', 'Performance Analysis'),
(5, 'James', 'White', '202 Fastway Blvd', '', 'Fast City', 'Speedland', '34567', '222', '555-2222', 'Strategy and Tactics'),
(6, 'Emily', 'Clark', '303 Coaching Lane', '', 'Quickville', 'Quickland', '45678', '333', '555-3333', 'Race Engineering'),
(7, 'Matthew', 'Young', '404 Quick Coach St', '', 'Speedville', 'Faststate', '56789', '444', '555-4444', 'Technical Support'),
(8, 'Sophie', 'Harris', '505 Racing Coach Ave', '', 'Speedway City', 'Quickland', '67890', '555', '555-5555', 'Motivational Coaching'),
(9, 'Daniel', 'Garcia', '606 Acceleration Blvd', '', 'Racerville', 'Quickstate', '78901', '666', '555-6666', 'Data Analysis'),
(10, 'Emma', 'Lewis', '707 Quick Coach Rd', '', 'Quicktown', 'Speedland', '89012', '777', '555-7777', 'Fitness Training');

-- Inserting data into the Race table (Already provided in previous script)
INSERT INTO Race (Circuit_ID, Championship_ID, Race_Date, Winner_F_Name, Runner_F_Name, Temperature)
VALUES 
(1, 1, '2023-02-10', 'Lewis', 'Max', 28.5),
(2, 1, '2023-05-20', 'Max', 'Sebastian', 26.8),
(3, 1, '2024-01-05', 'Sebastian', 'Lewis', 31.2),
(4, 1, '2023-08-15', 'Daniel', 'Valtteri', 29.0),
(5, 1, '2023-11-30', 'Valtteri', 'Charles', 30.7),
(6, 1, '2024-03-25', 'Charles', 'Carlos', 27.3),
(7, 1, '2023-06-12', 'Carlos', 'Lando', 29.8),
(8, 1, '2023-10-05', 'Lando', 'Fernando', 28.1),
(9, 1, '2024-01-20', 'Fernando', 'Kimi', 29.5),
(10, 1, '2023-09-05', 'Kimi', 'Daniel', 30.9);

-- Inserting data into the Championship table
INSERT INTO Championship (Season_ID, Season_Name, Winner_F_Name, Winner_L_Name, Runner_F_Name, Runner_L_Name)
VALUES 
(1, '2024 Season', 'John', 'Doe', 'Jane', 'Smith'),
(2, '2023 Season', 'Michael', 'Johnson', 'Maria', 'Garcia'),
(3, '2022 Season', 'Alex', 'Martinez', 'Sophia', 'Lee'),
(4, '2021 Season', 'Daniel', 'Wong', 'Emma', 'Chen'),
(5, '2020 Season', 'Liam', 'Kim', 'Olivia', 'Nguyen');

-- Inserting data into the Car table (Already provided in previous script)
INSERT INTO Engine (Car_ID, Engine_Part_ID, Part_Name, Count)
VALUES 
(1, 1, 'Turbocharger', 2),
(2, 2, 'Hybrid System', 1),
(3, 3, 'NA Engine', 1),
(4, 4, 'Turbocharged V10', 2),
(5, 5, 'Hybrid V8', 1),
(6, 6, 'V6 Naturally Aspirated', 1),
(7, 7, 'V12 Hybrid', 2),
(8, 8, 'V8 Naturally Aspirated', 1),
(9, 9, 'V10 Naturally Aspirated', 1),
(10, 10, 'Turbocharged V12', 2);

-- Inserting data into the Family table
INSERT INTO Family (Racer_ID, First_Name, Last_Name, Address_1, Address_2, City, State, Zip_Code, Phone_Area_Code, Phone_Number)
VALUES 
(1, 'John Jr.', 'Doe', '123 Main St', '', 'Raceville', 'Racingstate', '54321', '777', '555-7777'),
(2, 'Emily', 'Smith', '456 Speedway Blvd', '', 'Speedy City', 'Fastland', '98765', '888', '555-8888'),
(3, 'Michael Jr.', 'Johnson', '789 Raceway Ln', '', 'Zoomtown', 'Quickville', '12345', '999', '555-9999'),
(4, 'Maria Jr.', 'Garcia', '101 Racing Rd', '', 'Racerville', 'Speedstate', '23456', '111', '555-1111'),
(5, 'Alex Jr.', 'Martinez', '202 Speed Blvd', '', 'Race City', 'Quickland', '34567', '222', '555-2222'),
(6, 'Sophia Jr.', 'Lee', '303 Quick Lane', '', 'Fastville', 'Speedstate', '45678', '333', '555-3333'),
(7, 'Daniel Jr.', 'Wong', '404 Speedy Rd', '', 'Velocitytown', 'Quickstate', '56789', '444', '555-4444'),
(8, 'Emma Jr.', 'Chen', '505 Fastway Ave', '', 'Rapid City', 'Speedland', '67890', '555', '555-5555'),
(9, 'Liam Jr.', 'Kim', '606 Acceleration Blvd', '', 'Quickville', 'Speedstate', '78901', '666', '555-6666'),
(10, 'Olivia Jr.', 'Nguyen', '707 Rush St', '', 'Speedtopia', 'Fastland', '89012', '777', '555-7777');

-- Inserting data into the Laps table
INSERT INTO Laps (Race_ID, Winning_Team, Winning_Lap_Time)
VALUES 
(1, 'Team A', '00:01:30'),
(2, 'Team B', '00:01:35'),
(3, 'Team C', '00:01:40'),
(4, 'Team D', '00:01:45'),
(5, 'Team E', '00:01:50');

-- Inserting data into the Technical_Staff table
INSERT INTO Technical_Staff (Team_ID, Domain, First_Name, Last_Name)
VALUES 
(1, 'Engineering', 'David', 'Johnson'),
(2, 'Data Analysis', 'Sarah', 'Anderson'),
(3, 'Race Strategy', 'Michael', 'Brown'),
(4, 'Performance Analysis', 'Jessica', 'Taylor'),
(5, 'Race Engineering', 'James', 'White'),
(6, 'Technical Support', 'Emily', 'Clark'),
(7, 'Coaching', 'Matthew', 'Young'),
(8, 'Fitness Training', 'Sophie', 'Harris'),
(9, 'Data Analysis', 'Daniel', 'Garcia'),
(10, 'Race Engineering', 'Emma', 'Lewis');

-- Inserting data into the Engine table
INSERT INTO Engine (Car_ID, Engine_Part_ID, Part_Name, Count)
VALUES 
(1, 1, 'Turbocharger', 2),
(2, 2, 'Piston Assembly', 4),
(3, 3, 'Cylinder Head', 1),
(4, 4, 'Fuel Injector', 3),
(5, 5, 'Crankshaft', 2),
(6, 6, 'Camshaft', 1),
(7, 7, 'Oil Pump', 2),
(8, 8, 'Intake Manifold', 3),
(9, 9, 'Exhaust System', 1),
(10, 10, 'Engine Control Unit', 2);

-- Inserting data into the Wheel table
INSERT INTO Wheel (Car_ID, Wheel_Part_ID, Part_Name, Count)
VALUES 
(1, 11, 'Alloy Wheel', 8),
(2, 12, 'Tire Pressure Sensor', 4),
(3, 13, 'Wheel Hub Assembly', 2),
(4, 14, 'Wheel Bearing', 6),
(5, 15, 'Wheel Stud', 8),
(6, 16, 'Wheel Nut', 4),
(7, 17, 'Valve Stem', 6),
(8, 18, 'Wheel Spacer', 2),
(9, 19, 'Rim Tape', 4),
(10, 20, 'Center Cap', 8);

-- Inserting data into the Body table
INSERT INTO Body (Car_ID, Body_Part_ID, Part_Name, Count)
VALUES 
(1, 21, 'Front Bumper', 1),
(2, 22, 'Rear Bumper', 1),
(3, 23, 'Side Skirt', 2),
(4, 24, 'Hood', 1),
(5, 25, 'Trunk Lid', 1),
(6, 26, 'Fender', 2),
(7, 27, 'Grille', 1),
(8, 28, 'Spoiler', 1),
(9, 29, 'Headlight Assembly', 2),
(10, 30, 'Taillight Assembly', 1);
