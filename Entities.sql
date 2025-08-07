Attributes:
Racer Entity
1.	Racer_ID (unique identifier, primary KEY)
2.	Team_ID (FK reference Team entity)
Car_ID (FK reference Car entity)
Championship_ID (FK reference Championship entity)
3.	Racer_F_Name
Racer_L_Name
4.	Address_1
Address_2
City
State 
Zip_Code
Phone_Area_Code
5.	Phone_Number
6.	Racer_Nationality


Circuit Entity
1.	Circuit_ID (unique identifier primary key)
Address_1
Address_2
City
State 
Zip_Code
2.	Circuit_Temperature
3.	Circuit_Track_Layout
4.	Circuit_Construction_Date



Pit Stop Entity
1.	PS_ID (unique identifier primary key)
Team_ID (FK reference Team entity)
2.	Tire_Change_Time
4.	PS_Fueling_Time
Racer_Change_Time
Repair_Time
Total_Time

Team Entity
1.	Team_ID (unique identifier primary key)  
2.	Team_Name
3.	Team_Owner_F_Name
Team_Owner_L_Name
4.	Team_Drivers


Sponsor Entity
1.	Sponsor_ID (unique identifier, PK)
Team_ID (FK reference Team Entity)  
3.	Sponsor_F_Name
Sponsor_L_Name
5.	Sponsor_Contract_Duration
6.	Amount
7.	Basic_Terms




Coach Entity
1.	Coach_ID (unique identifier, PK)
Team_ID (FK reference Team Entity) 
3.	Coach_F_Name
Coach_L_Name
4.	Address_1
Address_2
City
State 
Zip_Code
Phone_Area_Code
5.	Phone_Number  
3.	Coach_Expertise



Race Entity
1.	Race_ID (unique identifier, PK)
Circuit_ID (FK reference Circuit Entity)
Championship_ID (FK reference Championship Entity)
2.	Race_Date
3.	Winner_F_Name
Runner_F_Name
Temperature

Championship Entity 
1.	Championship_ID (unique identifier, PK)
Season_ID
Season_Name
2.	Championship_Season
3.	Championship_Points_System
4.	Championship_Race_Schedule

Car Entity  
1.	Car_ID (unique identifier)
2.	Car_Chassis_Number
3.	Car_Engine_Type
4.	Car_Wheel_Specifications
5.	Car_Body_Modifications
6.	Car_Performance_Data

--------------------------------------------------

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

-- Circuits Entity
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
CREATE TABLE Team (
    Team_ID INT PRIMARY KEY,
    Team_Name VARCHAR(255),
    Team_Coach VARCHAR(255),
    Team_Drivers VARCHAR(255),
    Team_Technical_Staff VARCHAR(255)
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
CREATE TABLE Coach (
    Coach_ID INT PRIMARY KEY,
    Coach_Name VARCHAR(255),
    Coach_Expertise VARCHAR(255),
    Coaching_Contact VARCHAR(15),
    Coaching_Feedback VARCHAR(255)
);

-- Race Entity
CREATE TABLE Race (
    Race_ID INT PRIMARY KEY,
    Race_Date DATE,
    Race_Location VARCHAR(255),
    Race_Circuit INT,
    Race_Weather_Conditions VARCHAR(255),
    Race_Results VARCHAR(255),
    FOREIGN KEY (Race_Circuit) REFERENCES Circuits(Circuit_ID)
);

-- Championship Entity
CREATE TABLE Championship (
    Championship_ID INT PRIMARY KEY,
    Championship_Season INT,
    Championship_Points_System VARCHAR(255),
    Championship_Race_Schedule VARCHAR(255)
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
