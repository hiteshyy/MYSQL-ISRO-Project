create database ISRO;
use ISRO;

-- Missions--
CREATE TABLE Missions (
    MissionID INT PRIMARY KEY,
    Name VARCHAR(100),
    LaunchDate DATE,
    Type VARCHAR(50),
    Status VARCHAR(50)
);

-- Satellites--
CREATE TABLE Satellites (
    SatelliteID INT PRIMARY KEY,
    Name VARCHAR(100),
    LaunchDate DATE,
    MissionID INT,
    FOREIGN KEY (MissionID) REFERENCES Missions(MissionID)
);


-- LaunchVehicles--
CREATE TABLE LaunchVehicles (
    VehicleID INT PRIMARY KEY,
    Name VARCHAR(100),
    Capacity INT,
    Type VARCHAR(50)
);

-- LaunchSites --
CREATE TABLE LaunchSites (
    SiteID INT PRIMARY KEY,
    Name VARCHAR(100),
    Location VARCHAR(100)
);

-- Researchers--
CREATE TABLE Researchers (
    ResearcherID INT PRIMARY KEY,
    Name VARCHAR(100),
    FieldOfStudy VARCHAR(100),
    Email VARCHAR(100)
);

-- ResearchProjects--
CREATE TABLE ResearchProjects (
    ProjectID INT PRIMARY KEY,
    Title VARCHAR(100),
    ResearcherID INT,
    StartDate DATE,
    EndDate DATE,
    FOREIGN KEY (ResearcherID) REFERENCES Researchers(ResearcherID)
);

-- Collaborations--
CREATE TABLE Collaborations (
    CollaborationID INT PRIMARY KEY,
    PartnerName VARCHAR(100),
    ProjectID INT,
    StartDate DATE,
    EndDate DATE,
    FOREIGN KEY (ProjectID) REFERENCES ResearchProjects(ProjectID)
);

-- Payloads--
CREATE TABLE Payloads (
    PayloadID INT PRIMARY KEY,
    Name VARCHAR(100),
    Type VARCHAR(50),
    Weight INT,
    SatelliteID INT,
    FOREIGN KEY (SatelliteID) REFERENCES Satellites(SatelliteID)
);

-- GroundStations--
CREATE TABLE GroundStations (
    StationID INT PRIMARY KEY,
    Name VARCHAR(100),
    Location VARCHAR(100),
    Type VARCHAR(50)
);

-- TrackingData--
CREATE TABLE TrackingData (
    DataID INT PRIMARY KEY,
    SatelliteID INT,
    Timestamp DATETIME,
    Position VARCHAR(100),
    FOREIGN KEY (SatelliteID) REFERENCES Satellites(SatelliteID)
);

-- TechnologyDevelopments--
CREATE TABLE TechnologyDevelopments (
    DevelopmentID INT PRIMARY KEY,
    Description TEXT,
    Year INT,
    ResearcherID INT,
    FOREIGN KEY (ResearcherID) REFERENCES Researchers(ResearcherID)
);

-- Spacecraft--
CREATE TABLE Spacecraft (
    SpacecraftID INT PRIMARY KEY,
    Name VARCHAR(100),
    Type VARCHAR(50),
    LaunchDate DATE,
    MissionID INT,
    FOREIGN KEY (MissionID) REFERENCES Missions(MissionID)
);

-- ScientificInstruments--
CREATE TABLE ScientificInstruments (
    InstrumentID INT PRIMARY KEY,
    Name VARCHAR(100),
    Type VARCHAR(50),
    PayloadID INT,
    FOREIGN KEY (PayloadID) REFERENCES Payloads(PayloadID)
);

-- AstronomicalEvents--
CREATE TABLE AstronomicalEvents (
    EventID INT PRIMARY KEY,
    Name VARCHAR(100),
    Date DATE,
    Description TEXT
);

-- Funding--
CREATE TABLE Funding (
    FundingID INT PRIMARY KEY,
    Source VARCHAR(100),
    Amount DECIMAL(10, 2),
    Year INT
);

-- EducationPrograms--
CREATE TABLE EducationPrograms (
    ProgramID INT PRIMARY KEY,
    Name VARCHAR(100),
    Duration INT,
    Type VARCHAR(50)
);

-- PublicEngagement--
CREATE TABLE PublicEngagement (
    EngagementID INT PRIMARY KEY,
    Activity VARCHAR(100),
    Date DATE,
    Description TEXT
);

-- Publications--
CREATE TABLE Publications (
    PublicationID INT PRIMARY KEY,
    Title VARCHAR(100),
    AuthorID INT,
    PublishedDate DATE,
    FOREIGN KEY (AuthorID) REFERENCES Researchers(ResearcherID)
);

-- Awards--
CREATE TABLE Awards (
    AwardID INT PRIMARY KEY,
    Name VARCHAR(100),
    Year INT,
    RecipientID INT,
    FOREIGN KEY (RecipientID) REFERENCES Researchers(ResearcherID)
);

-- Internships--
CREATE TABLE Internships (
    InternshipID INT PRIMARY KEY,
    Position VARCHAR(100),
    Duration INT,
    ResearcherID INT,
    FOREIGN KEY (ResearcherID) REFERENCES Researchers(ResearcherID)
);

INSERT INTO Missions (MissionID, Name, LaunchDate, Type, Status) VALUES
(1, 'Chandrayaan-1', '2008-10-22', 'Lunar', 'Completed'),
(2, 'Mangalyaan', '2013-11-05', 'Mars', 'Completed'),
(3, 'Chandrayaan-2', '2019-07-22', 'Lunar', 'Completed'),
(4, 'PSLV-C37', '2017-02-15', 'Launch', 'Completed'),
(5, 'NavIC', '2016-12-01', 'Navigation', 'Operational'),
(6, 'Astrosat', '2015-09-28', 'Astronomy', 'Completed'),
(7, 'GSAT-19', '2017-06-05', 'Communication', 'Operational'),
(8, 'RISAT-2BR1', '2019-11-11', 'Remote Sensing', 'Operational'),
(9, 'INSAT-3DR', '2016-09-08', 'Meteorology', 'Operational'),
(10, 'Chandrayaan-3', '2023-07-14', 'Lunar', 'Completed');

INSERT INTO Satellites (SatelliteID, Name, LaunchDate, MissionID) VALUES
(1, 'Moon Impact Probe', '2008-11-12', 1),
(2, 'Mars Orbiter', '2013-09-24', 2),
(3, 'Vikram Lander', '2019-07-22', 3),
(4, 'PSAT', '2017-02-15', 4),
(5, 'NavIC Satellite 1', '2016-12-01', 5),
(6, 'Astrosat', '2015-09-28', 6),
(7, 'GSAT-19', '2017-06-05', 7),
(8, 'RISAT-2BR1', '2019-11-11', 8),
(9, 'INSAT-3DR', '2016-09-08', 9),
(10, 'Chandrayaan-3 Rover', '2023-07-14', 10);

INSERT INTO LaunchVehicles (VehicleID, Name, Capacity, Type) VALUES
(1, 'PSLV', 1000, 'Polar'),
(2, 'GSLV', 2000, 'Geosynchronous'),
(3, 'GSLV Mk III', 4000, 'Geosynchronous'),
(4, 'PSLV-C37', 500, 'Polar'),
(5, 'PSLV-XL', 1400, 'Polar'),
(6, 'GSLV Mk II', 1600, 'Geosynchronous'),
(7, 'PSLV-QL', 1000, 'Polar'),
(8, 'SSLV', 300, 'Launch Vehicle'),
(9, 'GSLV Mk III-D1', 4000, 'Geosynchronous'),
(10, 'PSLV-C29', 600, 'Polar');

INSERT INTO LaunchSites (SiteID, Name, Location) VALUES
(1, 'Satish Dhawan Space Centre', 'Sriharikota'),
(2, 'Thumba Equatorial Rocket Launching Station', 'Thumba'),
(3, 'Sriharikota Range', 'Andhra Pradesh'),
(4, 'SRI', 'Tamil Nadu'),
(5, 'Tanjore Launch Site', 'Tamil Nadu'),
(6, 'Puducherry Launch Site', 'Puducherry'),
(7, 'Gaganyaan Launch Site', 'Sriharikota'),
(8, 'INSAT Ground Station', 'Delhi'),
(9, 'Vikram Sarabhai Space Centre', 'Thiruvananthapuram'),
(10, 'ISRO Propulsion Complex', 'Tamil Nadu');

INSERT INTO Researchers (ResearcherID, Name, FieldOfStudy, Email) VALUES
(1, 'A.P.J. Abdul Kalam', 'Aerospace Engineering', 'apj@isro.gov.in'),
(2, 'Satish Dhawan', 'Rocketry', 'sd@isro.gov.in'),
(3, 'Vikram Sarabhai', 'Space Science', 'vs@isro.gov.in'),
(4, 'K. Sivan', 'Aerospace Engineering', 'ks@isro.gov.in'),
(5, 'R. Aravamudan', 'Satellite Technology', 'ra@isro.gov.in'),
(6, 'Anil Bhardwaj', 'Planetary Science', 'ab@isro.gov.in'),
(7, 'M. Annadurai', 'Satellite Systems', 'ma@isro.gov.in'),
(8, 'Dr. Raghunandan', 'Astrophysics', 'raghu@isro.gov.in'),
(9, 'Dr. R. C. Gupta', 'Geoinformatics', 'rcg@isro.gov.in'),
(10, 'A. N. Mohan', 'Space Applications', 'anm@isro.gov.in');

INSERT INTO ResearchProjects (ProjectID, Title, ResearcherID, StartDate, EndDate) VALUES
(1, 'Mars Orbiter Mission', 2, '2010-08-01', '2013-11-05'),
(2, 'Chandrayaan-2 Mission', 3, '2016-01-01', '2019-07-22'),
(3, 'Astrosat', 6, '2011-06-01', '2015-09-28'),
(4, 'NavIC Development', 5, '2012-01-01', '2016-12-01'),
(5, 'GSAT Series', 7, '2010-05-01', '2017-06-05'),
(6, 'RISAT Development', 4, '2015-01-01', '2019-11-11'),
(7, 'Gaganyaan Mission', 4, '2020-01-01', '2023-07-14'),
(8, 'INSAT Series', 9, '2010-01-01', '2016-09-08'),
(9, 'Satellite Navigation Research', 10, '2014-01-01', '2016-12-01'),
(10, 'Remote Sensing Technology', 1, '2015-01-01', '2020-01-01');

INSERT INTO Collaborations (CollaborationID, PartnerName, ProjectID, StartDate, EndDate) VALUES
(1, 'NASA', 1, '2010-08-01', '2013-11-05'),
(2, 'European Space Agency', 2, '2016-01-01', '2019-07-22'),
(3, 'ISRO-ANTRIX', 3, '2011-06-01', '2015-09-28'),
(4, 'JAXA', 4, '2012-01-01', '2016-12-01'),
(5, 'CNES', 5, '2010-05-01', '2017-06-05'),
(6, 'ROS COSMOS', 6, '2015-01-01', '2019-11-11'),
(7, 'ISRO-ISU', 7, '2020-01-01', '2023-07-14'),
(8, 'CNES-ISRO', 8, '2010-01-01', '2016-09-08'),
(9, 'DRDO', 9, '2014-01-01', '2016-12-01'),
(10, 'ISRO-NASA', 10, '2015-01-01', '2020-01-01');

INSERT INTO Payloads (PayloadID, Name, Type, Weight, SatelliteID) VALUES
(1, 'Mars Orbiter Payload', 'Scientific', 500, 2),
(2, 'Chandrayaan-2 Payload', 'Scientific', 600, 3),
(3, 'Astrosat Instruments', 'Astronomy', 350, 6),
(4, 'GSAT Communication Payload', 'Communication', 200, 7),
(5, 'RISAT Radar', 'Remote Sensing', 250, 8),
(6, 'INSAT Meteorological Payload', 'Meteorology', 300, 9),
(7, 'NavIC Navigation Payload', 'Navigation', 150, 5),
(8, 'Chandrayaan-3 Payload', 'Scientific', 550, 10),
(9, 'GSAT-30 Payload', 'Communication', 400, 7),
(10, 'NavIC Satellite 2', 'Navigation', 160, 5);

INSERT INTO GroundStations (StationID, Name, Location, Type) VALUES
(1, 'ISRO Telemetry, Tracking and Command Network', 'Sriharikota', 'Tracking'),
(2, 'Indian National Satellite Ground Stations', 'Delhi', 'Communication'),
(3, 'Indian Space Science Data Centre', 'Bengaluru', 'Data Center'),
(4, 'ISRO Ground Station', 'Guwahati', 'Remote Sensing'),
(5, 'Vikram Sarabhai Space Centre', 'Thiruvananthapuram', 'Research'),
(6, 'ISRO Propulsion Complex', 'Tamil Nadu', 'Testing'),
(7, 'Tanjore Ground Station', 'Tamil Nadu', 'Tracking'),
(8, 'ISRO Development Centre', 'Bengaluru', 'Development'),
(9, 'Satellite Earth Station', 'Delhi', 'Communication'),
(10, 'Tracking Station', 'Port Blair', 'Tracking');

INSERT INTO TrackingData (DataID, SatelliteID, Timestamp, Position) VALUES
(1, 1, '2008-11-12 10:00:00', '10.0N, 77.0E'),
(2, 2, '2013-09-24 08:30:00', '19.0N, 77.5E'),
(3, 3, '2019-07-22 20:30:00', '16.0N, 76.5E'),
(4, 4, '2017-02-15 09:00:00', '15.0N, 80.0E'),
(5, 5, '2016-12-01 14:00:00', '22.0N, 80.0E'),
(6, 6, '2015-09-28 12:00:00', '8.0N, 77.0E'),
(7, 7, '2017-06-05 15:00:00', '14.0N, 78.0E'),
(8, 8, '2019-11-11 11:00:00', '16.0N, 76.0E'),
(9, 9, '2016-09-08 13:00:00', '18.0N, 80.0E'),
(10, 10, '2023-07-14 16:00:00', '12.0N, 78.0E');

INSERT INTO TechnologyDevelopments (DevelopmentID, Description, Year, ResearcherID) VALUES
(1, 'Launch Vehicle Technology', 2013, 2),
(2, 'Satellite Communication Systems', 2015, 7),
(3, 'Remote Sensing Technology', 2018, 4),
(4, 'Navigation Satellite Systems', 2016, 5),
(5, 'Mars Mission Technology', 2013, 2),
(6, 'Lunar Mission Technologies', 2019, 3),
(7, 'Satellite Launching Technology', 2017, 1),
(8, 'Payload Development', 2020, 6),
(9, 'Earth Observation Technology', 2015, 9),
(10, 'Astrophysics Instruments', 2015, 8);

INSERT INTO Spacecraft (SpacecraftID, Name, Type, LaunchDate, MissionID) VALUES
(1, 'Mangalyaan Orbiter', 'Orbiter', '2013-11-05', 2),
(2, 'Chandrayaan-2 Orbiter', 'Orbiter', '2019-07-22', 3),
(3, 'Astrosat', 'Satellite', '2015-09-28', 6),
(4, 'GSAT-19', 'Communication', '2017-06-05', 7),
(5, 'RISAT-2BR1', 'Remote Sensing', '2019-11-11', 8),
(6, 'INSAT-3DR', 'Meteorological', '2016-09-08', 9),
(7, 'Chandrayaan-3', 'Lander', '2023-07-14', 10),
(8, 'NavIC Satellite 1', 'Navigation', '2016-12-01', 5),
(9, 'GSAT-30', 'Communication', '2020-01-01', 7),
(10, 'NavIC Satellite 2', 'Navigation', '2016-12-01', 5);

INSERT INTO ScientificInstruments (InstrumentID, Name, Type, PayloadID) VALUES
(1, 'Mars Spectrometer', 'Scientific', 1),
(2, 'Chandrayaan-2 Imaging System', 'Imaging', 2),
(3, 'Astrosat X-ray Telescope', 'X-ray', 3),
(4, 'GSAT Communication Equipment', 'Communication', 4),
(5, 'RISAT Radar', 'Radar', 5),
(6, 'INSAT Weather Sensors', 'Meteorological', 6),
(7, 'NavIC Receiver', 'Navigation', 7),
(8, 'Chandrayaan-3 Lander Instruments', 'Scientific', 8),
(9, 'GSAT-30 Payload', 'Communication', 9),
(10, 'NavIC Satellite Receiver', 'Navigation', 10);

INSERT INTO AstronomicalEvents (EventID, Name, Date, Description) VALUES
(1, 'Lunar Eclipse', '2021-05-26', 'Total Lunar Eclipse visible in India'),
(2, 'Solar Eclipse', '2020-06-21', 'Annular Solar Eclipse visible in parts of India'),
(3, 'Meteor Shower', '2022-12-14', 'Geminid Meteor Shower'),
(4, 'Planetary Alignment', '2023-03-12', 'Venus, Jupiter and Mars alignment'),
(5, 'Supermoon', '2022-07-13', 'July Supermoon'),
(6, 'Comet Observation', '2023-01-01', 'Comet C/2023 A1 visibility'),
(7, 'Auroras', '2022-09-30', 'Visible Auroras due to solar storm'),
(8, 'Perseid Meteor Shower', '2023-08-12', 'Annual Perseid Meteor Shower'),
(9, 'Solar Flares', '2023-10-12', 'Solar Flares observed from Sun'),
(10, 'Total Solar Eclipse', '2024-04-08', 'Total Solar Eclipse visible in India');

INSERT INTO Funding (FundingID, Source, Amount, Year) VALUES
(1, 'Government of India', 5000000.00, 2020),
(2, 'International Collaborations', 2000000.00, 2021),
(3, 'Private Sector', 1500000.00, 2019),
(4, 'Research Grants', 1000000.00, 2022),
(5, 'Satellite Launch Revenue', 2500000.00, 2023),
(6, 'Space Research Grants', 3000000.00, 2020),
(7, 'Public Donations', 500000.00, 2021),
(8, 'Global Partnerships', 4000000.00, 2018),
(9, 'R&D Funds', 3500000.00, 2019),
(10, 'International Space Agencies', 6000000.00, 2021);

INSERT INTO EducationPrograms (ProgramID, Name, Duration, Type) VALUES
(1, 'Space Science Program', 6, 'Postgraduate'),
(2, 'Satellite Engineering', 2, 'Diploma'),
(3, 'Aerospace Engineering', 4, 'Bachelor'),
(4, 'Remote Sensing and GIS', 1, 'Certificate'),
(5, 'Astrophysics Research', 3, 'Doctorate'),
(6, 'Space Technology Management', 1, 'Postgraduate'),
(7, 'Robotics in Space', 2, 'Diploma'),
(8, 'Satellite Communication', 1, 'Certificate'),
(9, 'Data Science for Space', 3, 'Masters'),
(10, 'Earth Observation Training', 1, 'Workshop');

INSERT INTO PublicEngagement (EngagementID, Activity, Date, Description) VALUES
(1, 'Science Exhibition', '2023-01-15', 'Exhibition showcasing ISRO achievements'),
(2, 'Open House', '2023-05-20', 'Public open house at ISRO campus'),
(3, 'Space Awareness Program', '2023-03-10', 'Awareness program for school students'),
(4, 'Webinar on Mars Missions', '2023-06-25', 'Online seminar discussing Mars missions'),
(5, 'Astrophysics Workshop', '2023-08-30', 'Workshop for enthusiasts'),
(6, 'Satellite Launch Viewing', '2023-07-14', 'Live viewing of a satellite launch'),
(7, 'Public Lecture Series', '2023-09-12', 'Lecture series by ISRO scientists'),
(8, 'STEM Camp', '2023-10-05', 'Summer camp for aspiring scientists'),
(9, 'Virtual Space Tours', '2023-11-01', 'Virtual tours of ISRO facilities'),
(10, 'Outreach Programs', '2023-04-15', 'Engaging communities in space science');

INSERT INTO Publications (PublicationID, Title, AuthorID, PublishedDate) VALUES
(1, 'The Science of Space Missions', 1, '2018-01-15'),
(2, 'Satellite Technologies in India', 2, '2019-03-22'),
(3, 'Mars Exploration: A Journey', 3, '2020-05-30'),
(4, 'Chandrayaan and Beyond', 4, '2021-07-10'),
(5, 'Remote Sensing Applications', 5, '2022-09-25'),
(6, 'Astrophysics and Satellite Science', 6, '2019-02-12'),
(7, 'The Future of Space Exploration', 7, '2020-11-05'),
(8, 'Indian Satellites: A Comprehensive Guide', 8, '2021-04-08'),
(9, 'Engineering Challenges in Space', 9, '2023-06-20'),
(10, 'The Next Generation of Spacecraft', 10, '2022-10-18');

INSERT INTO Awards (AwardID, Name, Year, RecipientID) VALUES
(1, 'Padma Bhushan', 2020, 1),
(2, 'ISRO Excellence Award', 2021, 2),
(3, 'National Award for Space Science', 2019, 3),
(4, 'Vikram Sarabhai Award', 2023, 4),
(5, 'NASA Distinguished Service Award', 2022, 5),
(6, 'ISRO Lifetime Achievement Award', 2021, 6),
(7, 'Best Research Paper Award', 2020, 7),
(8, 'Innovator of the Year', 2022, 8),
(9, 'Outstanding Contribution to Science', 2021, 9),
(10, 'Global Space Award', 2023, 10);

INSERT INTO Internships (InternshipID, Position, Duration, ResearcherID) VALUES
(1, 'Space Technology Intern', 6, 1),
(2, 'Satellite Operations Intern', 3, 2),
(3, 'Remote Sensing Intern', 2, 3),
(4, 'Astrophysics Research Intern', 4, 4),
(5, 'Engineering Intern', 3, 5),
(6, 'Data Analysis Intern', 2, 6),
(7, 'Communications Intern', 3, 7),
(8, 'Project Management Intern', 2, 8),
(9, 'Software Development Intern', 6, 9),
(10, 'Public Engagement Intern', 4, 10);


SHOW TABLES;

 -- Query Language--
-- DDL (Data Defination Language) (create,alter,drop)
alter table missions
add description varchar(200);
select * from missions;
alter table missions
drop column description;

-- DML (Data Manipulation Langauage) (insert,update,delete)
insert into researchers values (12,'Dr. S. Nambi Narayanan','space technology development','akumar@isro.gov.in');
select * from researchers;
select * from ResearchProjects;
insert into funding values (11,'Tata Trust',500000.00,2024);
select * from funding;
update researchers
set name = 'Dr. Anil Kumar'
where researcherid = 12;
delete from researchers
where researcherid = 12;

-- DQL (Data Query Language) (select)
select * from Spacecraft 
where Type = 'orbiter';


 -- Clauses--
-- SELECT, FROM, WHERE, GROUP BY, HAVING, ORDER BY, INSERT, UPDATE, DELETE, and JOIN,LIMIT
select Name, Year           #select clasue#
from awards;
select * from awards;       #from clause#
select * from awards        #where clause#
where year > 2020;
select amount,count(*) as similarfundsraised       #group by clause#
from funding group by amount;
select amount,avg(amount) as averageamount         #having clauses#
from funding group by amount
having avg(amount) > 500000.00;
select * from funding                 #order by clause#
order by amount desc;
select * from missions                #limit clause#
limit 4 offset 5;
select distinct amount from funding;  #distinct clause#
  
  
  -- Aliases--
                                                                                        
select m.* from missions m;                      #table alias#                            
select missionid as 'mission',launchdate as 'launch'  #coloumn alias#
from missions;
select concat(name,' / ',status) as result        #derived alias#
from missions;


-- Operators--                                                                         
-- arthmetic operators--
select amount+100000 as increasedamount from funding;
select amount-100000 as decereasedamount from funding;
select amount*2 as doubleamount from funding;
select amount/2 as halfamount from funding;

-- Comparison operators--
select * from funding where amount=500000;
select * from internships where researcherid!=10;
select * from funding where amount!=500000;
select * from funding where amount>500000;
select * from funding where amount<1500000;
select * from funding where amount<=1500000;
select * from funding where amount>=1500000;

-- Logical operators--

select * from missions;
select * from missions where missionid = 3 and name='chandrayaan-2';  #And
select * from missions where missionid = 11 or type = 'lunar';        #Or
select * from missions where not missionid = 10;                      #not
select * from missions where not name='Mangalyaan' and missionid = 3; #notand
select * from missions where missionid between 2 and 6;               #betweeen
select * from missions where missionid not between 2 and 6;           #notbetween
select * from missions where missionid = 3 and (name = 'Chandrayaan-2' or name = 'astrosat');

-- string operators--

select * from researchers;
select concat(name,' / ',email) as identityinfo          #concat
from researchers;
select * from researchers                                #like
where name like '%k%';
select * from researchers                                #notlike
where name not like '%k%';
select length(fieldofstudy) as fieldlength               #length
from researchers;
select upper(name) as uppercasename                      #uppercase
from researchers;
select lower(name) as lowercasename                      #lowercase
from researchers;
select substring(name,3,3) as namesubstring              #substring
from researchers;
select replace(fieldofstudy,'Aerospace Engineering','Aerospace') as updatesfieldstudy    #replace
from researchers;
select * from researchers                                 #not null
where name is not null;  
select * from researchers                                 #is null
where name is  null;
select ltrim(fieldofstudy) as trimmedname                 #ltrim
from researchers;
select rtrim(fieldofstudy) as trimmedname                 #rtrim
from researchers;
select trim(fieldofstudy) as trimmedname                  #trim
from researchers;
 
-- Functions--

select * from launchvehicles;
select * from launchvehicles 
order by capacity desc;

alter table launchvehicles add speedofvehicles varchar(50);
update launchvehicles
set speedofvehicles =
    case
       when capacity>2000 then 'boosters'
       when capacity>=1000 then 'fasters'
       else 'slower'
	end
where vehicleid in (1,2,3,4,5,6,7,8,9,10);


 -- Subqueries--
 
select * from funding;
select avg(amount) as avgamount from funding;
select count(*) as noofsource from funding;
select min(amount) as loweramount from funding; 
select max(amount) as maxamount from funding;
select sum(amount) as totalamount from funding;

select * from funding
where amount > (select avg(amount) from funding);

select * from funding
where fundingid in (select fundingid from funding);

select * from funding
where amount!= (select max(amount) from funding);

select * from funding
where amount> (select min(amount) from funding);

-- Joins --

-- Innerjoins--
/* Example: Satellites and Missions
We will use INNER JOIN to fetch satellite names and their corresponding mission names. Only the satellites that are linked to a mission will appear.
*/

select satellites.name as satellitename,missions.name as missionname from satellites
inner join missions
on satellites.missionid = missions.missionid;

-- left join--
/* Example: Satellites and Their Payloads
We will use LEFT JOIN to list all satellites along with their payload information. Satellites without payloads will still be listed, 
but the payload columns will contain NULL values.
*/

select satellites.name as satellitename,payloads.name as payloadname,payloads.type as payloadtype from satellites
left join payloads 
on satellites.satelliteid = payloads.satelliteid;

-- right join
/*
Example: Research Projects and Collaborations
We will use RIGHT JOIN to list all collaborations along with the associated research projects. 
Collaborations without any research project will still be listed, with NULL values for the project-related columns.
*/

select researchprojects.title as projecttitle,collaborations.partnername as partnerorganization from researchprojects
right join collaborations 
on researchprojects.projectid=collaborations.projectid;

-- full join

/*
The first query (LEFT JOIN) retrieves all researchers and their associated awards (if any).
The second query (RIGHT JOIN) retrieves all awards and the researchers who received them.
UNION combines these two sets of results and eliminates duplicates.
This simulates a FULL JOIN, where we see all researchers and all awards, even if there is no match.
*/

select researchers.name as researchername,awards.name as awardname,awards.year as awardyear from researchers
left join awards
on researchers.researcherid = awards.recipientid
union 
select researchers.name as researchername,awards.name as awardname,awards.year as awardyear from researchers
right join awards
on researchers.researcherid = awards.recipientid;

select * from missions;
select * from satellites;

-- update cascade


SHOW CREATE TABLE Satellites;
select 'satellites_ibfk'
FROM information_schema.table_constraints
WHERE table_name = 'Satellites' AND constraint_type = 'FOREIGN KEY';
ALTER TABLE Satellites
DROP foreign key satellites_ibfk_1;

ALTER TABLE Satellites
ADD CONSTRAINT satellites_ibfk_1
FOREIGN KEY (MissionID)
REFERENCES Missions(MissionID)
ON UPDATE CASCADE;

update missions
set missionid = 11
where missionid = 1;


-- user define functions
select * from missions;

-- scalar functions
-- creating a UDF to calculate the duration of a mission in days, given its LaunchDate and the current date.
delimiter //

CREATE FUNCTION GetMissionDuration (MissionID INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE mission_duration INT;
    
    SELECT DATEDIFF(current_date(), LaunchDate) 
    INTO mission_duration
    FROM Missions
    WHERE MissionID = missions.MissionID;
    RETURN mission_duration;
END //

DELIMITER ;

drop function getmissionduration;

-- use
select getmissionduration(7) as missionduration;

select * from satellites;
select * from payloads;

delimiter //

create function getnumberofsatellites(mission_id int)
returns int
deterministic
begin
    declare satellite_count int;
    
    select count(*) into satellite_count
    from satellites
    where missionid = mission_id;
    
    return satellite_count;
end //

delimiter ;

select getnumberofsatellites(2);

