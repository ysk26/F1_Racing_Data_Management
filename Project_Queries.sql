create database F1RacingDB

USE F1RacingDB

create database F1RacingDataBase

USE F1RacingDataBase
-- Racer Entity
CREATE TABLE Racer (
    Racer_ID INT PRIMARY KEY,
    Circuit_ID INT,
    Racer_Name VARCHAR(255),
    Racer_Address VARCHAR(255),
    Racer_Phone_Number VARCHAR(15),
    Racer_Nationality VARCHAR(50),
    FOREIGN KEY (Circuit_ID) REFERENCES Circuits(Circuit_ID)
);

select * from Racer;

-- Circuits Entity
--add circuitsteam many to many table
CREATE TABLE Circuits (
    Circuit_ID INT PRIMARY KEY,
    Circuit_Location VARCHAR(255),
    Circuit_Track_Layout VARCHAR(255),
    Circuit_Lap_Records VARCHAR(255),
    Circuit_Historical_Data VARCHAR(255)
);

-- Pit Stop Entity
CREATE TABLE PitStop (
    PS_ID INT PRIMARY KEY,
    PS_Timing DATETIME,
    PS_Tire_Changes INT,
    PS_Fueling DECIMAL(10, 2)
);

-- Team Entity
-- Team Entity
CREATE TABLE Team (
    Team_ID INT PRIMARY KEY,
    Team_Name VARCHAR(255),
    Team_Coach VARCHAR(255),
    Team_Drivers VARCHAR(255),
    Team_Technical_Staff VARCHAR(255),
    PS_ID INT UNIQUE,  -- Adding a unique constraint for one-to-one relationship
    FOREIGN KEY (PS_ID) REFERENCES PitStop(PS_ID) --pitstop one to one relation
);


-- Sponsor Entity
CREATE TABLE Sponsor (
    Sponsor_ID INT PRIMARY KEY,
    Team_ID INT,
    Sponsor_Name VARCHAR(255),
    Sponsorship_Level VARCHAR(50),
    Sponsor_Contract_Duration INT,
    Sponsor_Financial_Terms VARCHAR(255),
    Sponsor_Promotional_Obligations VARCHAR(255),
    FOREIGN KEY (Team_ID) REFERENCES Team(Team_ID)
);

-- Coach Entity
-- Coach Entity
CREATE TABLE Coach (
    Coach_ID INT PRIMARY KEY,
    Coach_Name VARCHAR(255),
    Coach_Expertise VARCHAR(255),
    Coaching_Contact VARCHAR(15),
    Coaching_Feedback VARCHAR(255),
    Coach_Team_ID INT,  -- Foreign key referencing Team_ID in the Team table
    FOREIGN KEY (Coach_Team_ID) REFERENCES Team(Team_ID)
);


-- Race Entity
-- Race Entity
CREATE TABLE Race (
    Race_ID INT PRIMARY KEY,
    Race_Date DATE,
    Race_Location VARCHAR(255),
    Race_Circuit INT,
	Race_Championship INT,
	Race_Car INT,
    Race_Weather_Conditions VARCHAR(255),
    Race_Results VARCHAR(255),
    FOREIGN KEY (Race_Circuit) REFERENCES Circuits(Circuit_ID),
	FOREIGN KEY (Race_Championship) REFERENCES Championship(Championship_ID),
	FOREIGN KEY (Race_Car) REFERENCES Car(Car_ID) -- Corrected reference to Car table
);


-- Championship Entity
CREATE TABLE Championship (
    Championship_ID INT PRIMARY KEY,
    Championship_Season INT,
    Championship_Points_System VARCHAR(255),
    Championship_Race_Schedule VARCHAR(255),
    Team_ID INT,  -- Foreign key referencing Team_ID in the Team table
    FOREIGN KEY (Team_ID) REFERENCES Team(Team_ID)
);


-- Car Entity
CREATE TABLE Car (
    Car_ID INT PRIMARY KEY,
    Team_ID INT,
    Car_Chassis_Number VARCHAR(255),
    Car_Engine_Type VARCHAR(255),
    Car_Wheel_Specifications VARCHAR(255),
    Car_Body_Modifications VARCHAR(255),
    Car_Performance_Data VARCHAR(255),
    FOREIGN KEY (Team_ID) REFERENCES Team(Team_ID)
);


-- Inserting sample data into the Racer table
INSERT INTO Racer (Racer_ID, Racer_Name, Racer_Address, Racer_Phone_Number, Racer_Nationality)
VALUES
(1, 'John Doe', '123 Main St', '123-456-7890', 'USA'),
(2, 'Jane Smith', '456 Elm St', '987-654-3210', 'UK'),
(3, 'Michael Johnson', '789 Oak St', '555-123-4567', 'Germany'),
(4, 'Emily Brown', '321 Pine St', '111-222-3333', 'France'),
(5, 'David Wilson', '567 Maple St', '999-888-7777', 'Australia'),
(6, 'Sarah Taylor', '987 Cedar St', '444-555-6666', 'Canada'),
(7, 'Robert Martinez', '654 Birch St', '777-666-5555', 'Italy'),
(8, 'Emma Garcia', '876 Spruce St', '222-333-4444', 'Spain'),
(9, 'William Anderson', '135 Oakwood St', '666-777-8888', 'Brazil'),
(10, 'Olivia Jones', '246 Walnut St', '333-444-5555', 'Japan');

-- Inserting sample data into the Circuits table
INSERT INTO Circuits (Circuit_ID, Circuit_Location, Circuit_Track_Layout, Circuit_Lap_Records, Circuit_Historical_Data)
VALUES
(1, 'Monaco', 'Street Circuit', '1:12:342', 'Monaco GP history'),
(2, 'Silverstone', 'Grand Prix Circuit', '1:25:892', 'Silverstone GP history'),
(3, 'Spa-Francorchamps', 'Circuit de Spa-Francorchamps', '1:42:553', 'Spa GP history'),
(4, 'Monza', 'Autodromo Nazionale Monza', '1:20:089', 'Monza GP history'),
(5, 'Interlagos', 'Autódromo José Carlos Pace', '1:11:345', 'Interlagos GP history');

-- Inserting sample data into the PitStop table
INSERT INTO PitStop (PS_ID, PS_Timing, PS_Tire_Changes, PS_Fueling)
VALUES
(1, '2024-04-15 09:00:00', 2, 45.75),
(2, '2024-04-15 09:15:00', 3, 60.20),
(3, '2024-04-15 09:30:00', 1, 35.50),
(4, '2024-04-15 09:45:00', 4, 75.90),
(5, '2024-04-15 10:00:00', 2, 50.00),
(6, '2024-04-15 10:15:00', 3, 65.30),
(7, '2024-04-15 10:30:00', 1, 30.80),
(8, '2024-04-15 10:45:00', 4, 80.60),
(9, '2024-04-15 11:00:00', 2, 55.00),
(10, '2024-04-15 11:15:00', 3, 70.40);

-- Inserting sample data into the Team table
INSERT INTO Team (Team_ID, Team_Name, Team_Coach, Team_Drivers, Team_Technical_Staff, PS_ID)
VALUES
(1, 'Team Alpha', 'John Smith', 'Driver 1, Driver 2', 'Tech 1, Tech 2', 1),
(2, 'Team Beta', 'Jane Johnson', 'Driver 3, Driver 4', 'Tech 3, Tech 4', 2),
(3, 'Team Gamma', 'Michael Brown', 'Driver 5, Driver 6', 'Tech 5, Tech 6', 3),
(4, 'Team Delta', 'Emily Wilson', 'Driver 7, Driver 8', 'Tech 7, Tech 8', 4),
(5, 'Team Epsilon', 'David Garcia', 'Driver 9, Driver 10', 'Tech 9, Tech 10', 5),
(6, 'Team Zeta', 'Sarah Martinez', 'Driver 11, Driver 12', 'Tech 11, Tech 12', 6),
(7, 'Team Theta', 'Robert Taylor', 'Driver 13, Driver 14', 'Tech 13, Tech 14', 7),
(8, 'Team Iota', 'Emma Anderson', 'Driver 15, Driver 16', 'Tech 15, Tech 16', 8),
(9, 'Team Kappa', 'William Jones', 'Driver 17, Driver 18', 'Tech 17, Tech 18', 9),
(10, 'Team Lambda', 'Olivia Brown', 'Driver 19, Driver 20', 'Tech 19, Tech 20', 10);

-- Inserting sample data into the Sponsor table
INSERT INTO Sponsor (Sponsor_ID, Team_ID, Sponsor_Name, Sponsorship_Level, Sponsor_Contract_Duration, Sponsor_Financial_Terms, Sponsor_Promotional_Obligations)
VALUES
(1, 1, 'Sponsor 1', 'Gold', 2, 'Financial terms for Sponsor 1', 'Promotional obligations for Sponsor 1'),
(2, 2, 'Sponsor 2', 'Silver', 3, 'Financial terms for Sponsor 2', 'Promotional obligations for Sponsor 2'),
(3, 3, 'Sponsor 3', 'Bronze', 1, 'Financial terms for Sponsor 3', 'Promotional obligations for Sponsor 3'),
(4, 4, 'Sponsor 4', 'Platinum', 4, 'Financial terms for Sponsor 4', 'Promotional obligations for Sponsor 4'),
(5, 5, 'Sponsor 5', 'Gold', 2, 'Financial terms for Sponsor 5', 'Promotional obligations for Sponsor 5'),
(6, 6, 'Sponsor 6', 'Silver', 3, 'Financial terms for Sponsor 6', 'Promotional obligations for Sponsor 6'),
(7, 7, 'Sponsor 7', 'Bronze', 1, 'Financial terms for Sponsor 7', 'Promotional obligations for Sponsor 7'),
(8, 8, 'Sponsor 8', 'Platinum', 4, 'Financial terms for Sponsor 8', 'Promotional obligations for Sponsor 8'),
(9, 9, 'Sponsor 9', 'Gold', 2, 'Financial terms for Sponsor 9', 'Promotional obligations for Sponsor 9'),
(10, 10, 'Sponsor 10', 'Silver', 3, 'Financial terms for Sponsor 10', 'Promotional obligations for Sponsor 10');

-- Inserting sample data into the Coach table
INSERT INTO Coach (Coach_ID, Coach_Name, Coach_Expertise, Coaching_Contact, Coaching_Feedback, Coach_Team_ID)
VALUES
(1, 'Coach 1', 'Expertise 1', '123-456-7890', 'Feedback for Coach 1', 1),
(2, 'Coach 2', 'Expertise 2', '987-654-3210', 'Feedback for Coach 2', 2),
(3, 'Coach 3', 'Expertise 3', '555-123-4567', 'Feedback for Coach 3', 3),
(4, 'Coach 4', 'Expertise 4', '111-222-3333', 'Feedback for Coach 4', 4),
(5, 'Coach 5', 'Expertise 5', '999-888-7777', 'Feedback for Coach 5', 5),
(6, 'Coach 6', 'Expertise 6', '444-555-6666', 'Feedback for Coach 6', 6),
(7, 'Coach 7', 'Expertise 7', '777-666-5555', 'Feedback for Coach 7', 7),
(8, 'Coach 8', 'Expertise 8', '222-333-4444', 'Feedback for Coach 8', 8),
(9, 'Coach 9', 'Expertise 9', '666-777-8888', 'Feedback for Coach 9', 9),
(10, 'Coach 10', 'Expertise 10', '333-444-5555', 'Feedback for Coach 10', 10);

-- Inserting sample data into the Race table
INSERT INTO Race (Race_ID, Race_Date, Race_Location, Race_Circuit, Race_Championship, Race_Car, Race_Weather_Conditions, Race_Results)
VALUES
(1, '2024-04-15', 'Monaco', 1, 1, 1, 'Sunny', 'Results for Race 1'),
(2, '2024-04-16', 'Silverstone', 2, 1, 2, 'Cloudy', 'Results for Race 2'),
(3, '2024-04-17', 'Spa-Francorchamps', 3, 1, 3, 'Rainy', 'Results for Race 3'),
(4, '2024-04-18', 'Monza', 4, 1, 4, 'Sunny', 'Results for Race 4'),
(5, '2024-04-19', 'Interlagos', 5, 1, 5, 'Cloudy', 'Results for Race 5'),
(6, '2024-04-20', 'Monaco', 1, 1, 6, 'Rainy', 'Results for Race 6'),
(7, '2024-04-21', 'Silverstone', 2, 1, 7, 'Sunny', 'Results for Race 7'),
(8, '2024-04-22', 'Spa-Francorchamps', 3, 1, 8, 'Cloudy', 'Results for Race 8'),
(9, '2024-04-23', 'Monza', 4, 1, 9, 'Rainy', 'Results for Race 9'),
(10, '2024-04-24', 'Interlagos', 5, 1, 10, 'Sunny', 'Results for Race 10');



-- Inserting sample data into the Championship table
INSERT INTO Championship (Championship_ID, Championship_Season, Championship_Points_System, Championship_Race_Schedule, Team_ID)
VALUES
(1, 2024, 'Points System 1', 'Schedule 1', 1),
(2, 2024, 'Points System 1', 'Schedule 1', 2),
(3, 2024, 'Points System 1', 'Schedule 1', 3),
(4, 2024, 'Points System 1', 'Schedule 1', 4),
(5, 2024, 'Points System 1', 'Schedule 1', 5),
(6, 2024, 'Points System 1', 'Schedule 1', 6),
(7, 2024, 'Points System 1', 'Schedule 1', 7),
(8, 2024, 'Points System 1', 'Schedule 1', 8),
(9, 2024, 'Points System 1', 'Schedule 1', 9),
(10, 2024, 'Points System 1', 'Schedule 1', 10);

-- Inserting sample data into the Car table
INSERT INTO Car (Car_ID, Team_ID, Car_Chassis_Number, Car_Engine_Type, Car_Wheel_Specifications, Car_Body_Modifications, Car_Performance_Data)
VALUES
(1, 1, 'Chassis Number 1', 'Engine Type 1', 'Wheel Specs 1', 'Body Mods 1', 'Performance Data 1'),
(2, 2, 'Chassis Number 2', 'Engine Type 2', 'Wheel Specs 2', 'Body Mods 2', 'Performance Data 2'),
(3, 3, 'Chassis Number 3', 'Engine Type 3', 'Wheel Specs 3', 'Body Mods 3', 'Performance Data 3'),
(4, 4, 'Chassis Number 4', 'Engine Type 4', 'Wheel Specs 4', 'Body Mods 4', 'Performance Data 4'),
(5, 5, 'Chassis Number 5', 'Engine Type 5', 'Wheel Specs 5', 'Body Mods 5', 'Performance Data 5'),
(6, 6, 'Chassis Number 6', 'Engine Type 6', 'Wheel Specs 6', 'Body Mods 6', 'Performance Data 6'),
(7, 7, 'Chassis Number 7', 'Engine Type 7', 'Wheel Specs 7', 'Body Mods 7', 'Performance Data 7'),
(8, 8, 'Chassis Number 8', 'Engine Type 8', 'Wheel Specs 8', 'Body Mods 8', 'Performance Data 8'),
(9, 9, 'Chassis Number 9', 'Engine Type 9', 'Wheel Specs 9', 'Body Mods 9', 'Performance Data 9'),
(10, 10, 'Chassis Number 10', 'Engine Type 10', 'Wheel Specs 10', 'Body Mods 10', 'Performance Data 10');


select car.Car_Chassis_Number, team.Team_Name 
from car, team
where car.Team_ID = team.Team_ID
