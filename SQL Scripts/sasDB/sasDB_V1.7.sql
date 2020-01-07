
-- Accessing the sasDB
  USE sasDB;

  GO

-- CREATING TABLE 1 - CustomerService --
  CREATE TABLE CustomerService (
    CSRecordID INT IDENTITY(1,1),
    EmployeeID AS CAST('EMP' + RIGHT('0000' + CAST(CSRecordID AS VARCHAR(6)), 6) AS CHAR(8)) PERSISTED,
    FirstName VARCHAR(20) NOT NULL,
    MiddleName VARCHAR(25),
    LastName VARCHAR(30) NOT NULL,
    EmailAddress VARCHAR(50) NOT NULL,
    TelephoneNumber CHAR(11) NOT NULL UNIQUE , -- Advice user to insert in regional format 0123-456789
    PRIMARY KEY (CSRecordID, EmployeeID),
    CONSTRAINT CHK_EmailAddress CHECK (EmailAddress LIKE '%_@_%_.__%'), -- check for @ sign and subdomains such as .co.uk
    CONSTRAINT CHK_TelephoneNumber CHECK (TelephoneNumber LIKE '[0-9][0-9][0-9][0-9][.-][0-9][0-9][0-9][0-9][0-9][0-9]')
  )ON CustomerService_Filegroup1

  GO

-- INSERTING DATA TO TABLE 1 - CustomerService --
  INSERT INTO CustomerService (FirstName, MiddleName, LastName, EmailAddress, TelephoneNumber) VALUES
  ('Celesta', 'Bari', 'Micallef', 'bmicallef0@ycombinator.com', '7787-543632'),      -- EmployeeID: EMP000001
  ('Oralie', 'Dari', 'Isworth', 'disworth1@stanford.edu', '2673-946663'),            -- EmployeeID: EMP000002
  ('Kaylee', 'Nikita', 'O''Dougherty', 'nodougherty2@economist.com', '4338-752526'), -- EmployeeID: EMP000003
  ('Verge', 'Garwin', 'Heggadon', 'gheggadon3@wordpress.com', '1929-278548'),        -- EmployeeID: EMP000004
  ('Celinda', 'Kathleen', 'Sloan', 'ksloan4@msu.edu', '4489-554626'),                -- EmployeeID: EMP000005
  ('Markos', 'Nisse', 'Shadbolt', 'nshadbolt5@biglobe.ne.jp', '9908-053740'),        -- EmployeeID: EMP000006
  ('Ailey', 'Norrie', 'Bonafant', 'nbonafant6@java.com', '4728-833503'),             -- EmployeeID: EMP000007
  ('Shay', 'Cynthy', 'Ivanichev', 'civanichev7@statcounter.com', '5814-215201'),     -- EmployeeID: EMP000008
  ('Fons', 'Terrijo', 'Pask', 'tpask8@paginegialle.it', '1089-248186'),              -- EmployeeID: EMP000009
  ('Averill', 'Engracia', 'Skippon', 'eskippon9@printfriendly.com', '5889-012701'),  -- EmployeeID: EMP000010
  ('Darwin', 'Rowena', 'Lindop', 'rlindopa@wufoo.com', '2976-146645'),               -- EmployeeID: EMP000011
  ('Damon', 'Arty', 'Whellans', 'awhellansb@flavors.me', '9942-498261'),             -- EmployeeID: EMP000012
  ('Gery', 'Norma', 'Beverage', 'nbeveragec@youtu.be', '2846-705386'),               -- EmployeeID: EMP000013
  ('Danna', 'Teirtza', 'Colt', 'tcoltd@nps.gov', '8363-569459'),                     -- EmployeeID: EMP000014
  ('Lothaire', 'Eimile', 'McLafferty', 'emclaffertye@tinypic.com', '4977-213145'),   -- EmployeeID: EMP000015
  ('Luca', 'Wyn', 'Cansdill', 'wcansdillf@sina.com.cn', '5746-122216'),              -- EmployeeID: EMP000016
  ('Deerdre', 'Monique', 'Gellately', 'mgellatelyg@apache.org', '3091-246267'),      -- EmployeeID: EMP000017
  ('Michelina', 'Hans', 'Creevy', 'hcreevyh@dmoz.org', '9911-122438'),               -- EmployeeID: EMP000018
  ('Brand', 'Pierson', 'Littledyke', 'plittledykei@parallels.com', '7757-782252'),   -- EmployeeID: EMP000019
  ('Brig', 'Eda', 'Szymonwicz', 'eszymonwiczj@pbs.org', '7371-083264'),              -- EmployeeID: EMP000020
  ('Mycah', 'Efren', 'Mayze', 'emayzek@mlb.com', '5893-769984'),                     -- EmployeeID: EMP000021
  ('Christalle', 'Lynn', 'Goldstraw', 'lgoldstrawl@facebook.com', '1292-758014'),    -- EmployeeID: EMP000022
  ('Humphrey', 'Rem', 'Tournie', 'rtourniem@exblog.jp', '9852-100823'),              -- EmployeeID: EMP000023
  ('Merci', 'Dewie', 'Haymes', 'dhaymesn@patch.com', '4827-103149'),                 -- EmployeeID: EMP000024
  ('Tarah', 'Lisha', 'Prowting', 'lprowtingo@shutterfly.com', '9088-420305'),        -- EmployeeID: EMP000025
  ('Rodney', 'Jeanna', 'Shenfisch', 'jshenfischp@wix.com', '7535-287912'),           -- EmployeeID: EMP000026
  ('Thedrick', 'Franklin', 'Noorwood', 'fnoorwoodq@wordpress.com', '3795-189735'),   -- EmployeeID: EMP000027
  ('Baryram', 'Cathe', 'Mayho', 'cmayhor@blogs.com', '5334-164391'),                 -- EmployeeID: EMP000028
  ('Sallyanne', 'Geri', 'Blackham', 'gblackhams@yale.edu', '5386-989695'),           -- EmployeeID: EMP000029
  ('Lesya', 'Cathi', 'Von Brook', 'cvonbrookt@mail.ru', '8312-188561'),              -- EmployeeID: EMP000030
  ('Dick', 'Geoffry', 'Sumpter', 'gsumpteru@topsy.com', '6191-773913'),              -- EmployeeID: EMP000031
  ('Gaelan', 'Lisle', 'Dike', 'ldikev@google.co.jp', '4687-418593'),                 -- EmployeeID: EMP000032
  ('Darbie', 'Gwendolin', 'Burnitt', 'gburnittw@sina.com.cn', '1816-921376'),        -- EmployeeID: EMP000033
  ('Lorenza', 'Lidia', 'Lippatt', 'llippattx@wikimedia.org', '6384-145293'),         -- EmployeeID: EMP000034
  ('Muriel', 'Florentia', 'Hardware', 'fhardwarey@opera.com', '5363-381676'),        -- EmployeeID: EMP000035
  ('Ginny', 'Alaster', 'Senogles', 'asenoglesz@mysql.com', '1532-098949'),           -- EmployeeID: EMP000036
  ('Yoshi', 'Clarey', 'Siss', 'csiss10@walmart.com', '5873-913399'),                 -- EmployeeID: EMP000037
  ('Desiri', 'Hermon', 'Hawse', 'hhawse11@cnet.com', '4416-471238'),                 -- EmployeeID: EMP000038
  ('Evelina', 'Roxane', 'Pedron', 'rpedron12@parallels.com', '8529-475879'),         -- EmployeeID: EMP000039
  ('Hal', 'Ula', 'Di Antonio', 'udiantonio13@elegantthemes.com', '3736-939642')      -- EmployeeID: EMP000040

  GO

-- CREATING TABLE 2 - StudentType --
  CREATE TABLE StudentType(
    STRecordID INT IDENTITY(1,1),
    StudentTypeID AS CAST('STP' + RIGHT('0000' + CAST(STRecordID AS VARCHAR(6)), 6) AS CHAR(8)) PERSISTED,
    StudentType CHAR(2) NOT NULL,
    PRIMARY KEY (STRecordID,StudentTypeID),
    CONSTRAINT CHK_StudentType CHECK (StudentType ='UG' OR StudentType ='PG')
  )

  GO

-- INSERTING DATA TO TABLE 2 - StudentType --
  INSERT INTO StudentType (StudentType) VALUES
  ('UG'), --Undergraduate Student | StudentTypeID: UG
  ('PG')  --Postgraduate Student  | StudentTypeID: PG

  GO

-- CREATING TABLE 3 - LocationArea --
  CREATE TABLE LocationArea(
    LARecordID INT IDENTITY(1,1),
    LocationAreaID AS CAST('LA' + RIGHT('000000' + CAST(LARecordID AS VARCHAR(6)), 6) AS CHAR(8)) PERSISTED,
    Zipcode VARCHAR(8) NOT NULL,
    City VARCHAR(58) NOT NULL,
    County VARCHAR(26) NOT NULL,
    PRIMARY KEY(LARecordID, LocationAreaID)
  )

  GO

-- INSERTING DATA TO TABLE 3 - LocationArea --
  INSERT INTO LocationArea (Zipcode, City, County) VALUES
  ('OX1 2JD','Oxford','Oxfordshire'),         -- LocationAreaID: LA000001
  ('WC1E 6BT','London','Middlesex'),          -- LocationAreaID: LA000002
  ('CB2 1TN','Cambridge','Cambridgeshire'),   -- LocationAreaID: LA000003
  ('PL4 8AA','Plymouth','Devon')              -- LocationAreaID: LA000004

  GO

-- CREATING TABLE 4 - LocationAddress --
  CREATE TABLE LocationAddress (
    LADDRecordID INT IDENTITY(1,1),
    LocationAddressID AS CAST('LAD' + RIGHT('00000' + CAST(LADDRecordID AS VARCHAR(5)), 5) AS CHAR(8)) PERSISTED,
    LaneAddress VARCHAR(150) NOT NULL,
    laLARecordID INT,
    laLocationAreaID CHAR(8),
    PRIMARY KEY (LADDRecordID, LocationAddressID),
    CONSTRAINT FK_LA_LARecordID_LocationAreaID FOREIGN KEY (laLARecordID, laLocationAreaID) REFERENCES LocationArea(LARecordID, LocationAreaID),
  )

  GO

-- INSERTING DATA TO TABLE 4 - LocationAddress --
  INSERT INTO  LocationAddress (LaneAddress, laLocationAreaID) VALUES
  ('University Offices, Wellington Square','LAD00001'),    -- LocationAddressID: LAD00001
  ('University College London, Gower Street','LAD00002'),  -- LocationAddressID: LAD00002
  ('The Old Schools, Trinity Lane','LAD00003'),            -- LocationAddressID: LAD00003
  ('Drake Circus','LAD00004')                              -- LocationAddressID: LAD00004

  GO

-- CREATING TABLE 5 - StudentContact --
  CREATE TABLE StudentContact(
    NationalInsuranceNumber VARCHAR(9) NOT NULL,
    stSTRecordID INT,
    stStudentTypeID CHAR(8) NOT NULL,
    EmailAddress VARCHAR(50) NOT NULL,
    TelephoneNumber CHAR(11) NOT NULL UNIQUE, -- advise user to insert in regional format 0123-456789
    laddLADDRecordID INT NOT NULL,
    ladLocationAddressID CHAR(8) NOT NULL,
    PRIMARY KEY (NationalInsuranceNumber),
    CONSTRAINT CHK_SC_EmailAddress CHECK (EmailAddress LIKE '%_@_%_.__%'), -- check for @ sign and subdomains such as .co.uk
    CONSTRAINT CHK_SC_TelephoneNumber CHECK (TelephoneNumber LIKE '[0-9][0-9][0-9][0-9][.-][0-9][0-9][0-9][0-9][0-9][0-9]'),
    CONSTRAINT FK_SC_STRecordID FOREIGN KEY (stSTRecordID, stStudentTypeID) REFERENCES StudentType(STRecordID, StudentTypeID),
    CONSTRAINT FK_SC_LocationAddressID FOREIGN KEY (laddLADDRecordID, ladLocationAddressID) REFERENCES LocationAddress(LADDRecordID, LocationAddressID)
  )ON Student_Filegroup4

  GO


-- INSERTING DATA TO TABLE 5 - StudentContact --
  INSERT INTO StudentContact (NationalInsuranceNumber,stSTRecordID,stStudentTypeID,EmailAddress,TelephoneNumber,laddLADDRecordID,ladLocationAddressID)VALUES   -- have more values to be added
  ('WB940276B','1','STP00001','focegep869@sammail.ws','7384-106930','1','LAD00001'),
  ('LP064709C','1','STP00001','conteb@msn.com','9327-782218','2','LAD00002'),
  ('AG646231C','1','STP00001','dvdotnet@mac.com','3006-957941','3','LAD00003'),
  ('RW794588C','1','STP00001','drolsky@yahoo.com','6563-863908','4','LAD00004'),
  ('RB153694C','1','STP00001','parrt@comcast.net','4415-171351','1','LAD00001'),
  ('KS459037D','1','STP00001','fmtbebuck@outlook.com','4445-606670','2','LAD00002'),
  ('CN953687C','1','STP00001','aracne@live.com','5786-276769','3','LAD00003'),
  ('AG671006A','2','STP00002','slanglois@comcast.net','8104-346078','4','LAD00004'),
  ('NZ873662D','2','STP00002','dhwon@optonline.net','1628-074443','1','LAD00001'),
  ('YT428556A','2','STP00002','parasite@comcast.net','4443-901408','2','LAD00002'),
  ('HG747890A','2','STP00002','wortmanj@mac.com','8674-660245','3','LAD00003'),
  ('WW680475B','2','STP00002','dsowsy@me.com','4961-730174','4','LAD00004'),
  ('WE486863D','2','STP00002','qmacro@verizon.net','3145-535549','1','LAD00001'),
  ('BA660327B','2','STP00002','eidac@live.com','9154-536687','2','LAD00002'),
  ('RW874927B','2','STP00002','dcoppit@verizon.net','7921-540744','3','LAD00003')

  GO

-- CREATING TABLE 6 - StudentMobileNumber --
  CREATE TABLE StudentMobileNumber(
    scNationalInsuranceNumber VARCHAR(9) NOT NULL,
    MobileNumber CHAR(11) NOT NULL UNIQUE, -- advise user to insert in regional format 0123-456789
    PRIMARY KEY (scNationalInsuranceNumber,MobileNumber),
    CONSTRAINT CHK_SMN_TelephoneNumber CHECK (MobileNumber LIKE '[0-9][0-9][0-9][0-9][.-][0-9][0-9][0-9][0-9][0-9][0-9]'),
    CONSTRAINT FK_SMN_scNationalInsuranceNumber FOREIGN KEY (scNationalInsuranceNumber) REFERENCES StudentContact(NationalInsuranceNumber)
  )ON Student_Filegroup4

  GO

-- INSERTING DATA TO TABLE 6 - StudentMobileNumber --
  INSERT INTO StudentMobileNumber (scNationalInsuranceNumber, MobileNumber )VALUES
  ('WB940276B', '1061-036422'),
  ('LP064709C', '5262-102202'),
  ('AG646231C', '6725-323877'),
  ('RW794588C', '2837-122985'),
  ('RB153694C', '9869-388943'),
  ('KS459037D', '9475-125180'),
  ('CN953687C', '5783-989263'),
  ('AG671006A', '1125-281541'),
  ('NZ873662D', '9265-040158'),
  ('YT428556A', '4894-190538'),
  ('HG747890A', '8596-329539'),
  ('WW680475B', '7562-121699'),
  ('WE486863D', '1649-457503'),
  ('BA660327B', '9426-521763'),
  ('RW874927B','7821-540744')

  GO

-- CREATING TABLE 7 - MembershipStatus --
  CREATE TABLE MembershipStatus(
    MSRecordID INT IDENTITY(1,1),
    MembershipStatusID AS CAST('MS' + RIGHT('00000' + CAST(MSRecordID AS VARCHAR(6)), 6) AS CHAR(8)) PERSISTED,
    MembershipStatus VARCHAR(20) NOT NULL,
    PRIMARY KEY (MSRecordID, MembershipStatusID),
    CONSTRAINT CHK_Status CHECK (MembershipStatus = 'Active' OR MembershipStatus ='Dormant' OR MembershipStatus ='Banned') -- checks for only possible account statuses
  )

  GO

-- INSERTING DATA TO TABLE 7 - MembershipStatus --
  INSERT INTO MembershipStatus (MembershipStatus) VALUES
  ('Active'),   -- MembershipStatusID: MS000001
  ('Dormant'),   -- MembershipStatusID: MS000002
  ('Banned')    -- MembershipStatusID: MS000003

  GO

-- CREATING TABLE 8 - StudentGender --
  CREATE TABLE StudentGender(
    SGRecordID INT IDENTITY(1,1),
    GenderID AS CAST('SG' + RIGHT('000000' + CAST(SGRecordID AS VARCHAR(6)), 6) AS CHAR(8)) PERSISTED,
    Gender CHAR(1) NOT NULL,
    PRIMARY KEY (SGRecordID,GenderID),
    CONSTRAINT CHK_Gender CHECK (Gender = 'M' OR Gender = 'F') -- checks for correct gender input M(male),F(female)
  )

  GO

-- INSERTING DATA TO TABLE 8 - StudentGender --
  INSERT INTO StudentGender (Gender) VALUES
  ('M'), -- GenderID: SG000001
  ('F')  -- GenderID: SG000002

  GO

-- CREATING TABLE 9 - UniversityContact --
  CREATE TABLE UniversityContact(
    URecordID INT IDENTITY(1,1),
    UniversityID VARCHAR(4) NOT NULL,
    Name VARCHAR(100) NOT NULL,
    laddLADDRecordID INT NOT NULL,
    ladLocationAddressID CHAR(8) NOT NULL,
    PRIMARY KEY (URecordID,UniversityID),
    CONSTRAINT FK_UC_LADDRecordID FOREIGN KEY (laddLADDRecordID, ladLocationAddressID ) REFERENCES LocationAddress(LADDRecordID, LocationAddressID)
  )ON University_Filegroup5

  GO

-- INSERTING DATA TO TABLE 9 - UniversityContact --
  INSERT INTO UniversityContact (UniversityID,Name,laddLADDRecordID,ladLocationAddressID) VALUES
  ('OU','University of Oxford','1','LAD00001'),
  ('UCL','University of College London','2','LAD00002'),
  ('CAM','University of Cambridge','3','LAD00003'),
  ('PU','University of Plymouth','4','LAD00004')

  GO

-- CREATING TABLE 10 - UniversityTelephoneNumber --
  CREATE TABLE UniversityTelephoneNumber(
    utURecordID INT not null,
    ucUniversityID VARCHAR(4) not null,
    TelephoneNumber CHAR(11) NOT NULL UNIQUE, -- advise user to insert in regional format 0123-456789
    PRIMARY KEY (utURecordID,ucUniversityID,TelephoneNumber),
    CONSTRAINT FK_UTN_ucUniversity FOREIGN KEY (utURecordID,ucUniversityID)
    REFERENCES UniversityContact(URecordID,UniversityID),
    CONSTRAINT CHK_UTN_TelephoneNumber CHECK (TelephoneNumber
      LIKE '[0-9][0-9][0-9][0-9][.-][0-9][0-9][0-9][0-9][0-9][0-9]')
  )ON University_Filegroup5

  GO

-- INSERTING DATA TO TABLE 10 - UniversityTelephoneNumber --
  INSERT INTO UniversityTelephoneNumber (utURecordID,ucUniversityID,TelephoneNumber) VALUES
  ('1','OU','1865-270000'),
  ('2','UCL','2076-792000'),
  ('3','CAM','1223-337733'),
  ('4','PU','1752-600600');

  GO

-- CREATING TABLE 11 - UniversityEmailAddress --
  CREATE TABLE UniversityEmailAddress(
    utURecordID INT not null,
    ucUniversityID VARCHAR(4),
    EmailAddress VARCHAR(50) NOT NULL ,
    PRIMARY KEY (utURecordID,ucUniversityID, EmailAddress),
    CONSTRAINT FK_UEA_UniversityID FOREIGN KEY (utURecordID,ucUniversityID) REFERENCES UniversityContact(URecordID,UniversityID),
    CONSTRAINT CHK_UEA_EmailAddress CHECK (EmailAddress LIKE '%_@_%_.__%') -- check for @ sign and subdomains such as .co.uk
  )ON University_Filegroup5

  GO

-- INSERTING DATA TO TABLE 11 - UniversityEmailAddress --
  INSERT INTO UniversityEmailAddress (utURecordID,ucUniversityID, EmailAddress) VALUES
  ('1','OU','enquiries@devoff.ox.ac.uk'),
  ('2','UCL','study@ucl.ac.uk'),
  ('3','CAM','reception@educ.cam.ac.uk'),
  ('4','PU','researchadvice@plymouth.ac.uk')

  GO

-- CREATING TABLE 12	PropertyType --
  CREATE TABLE PropertyType(
    PTRecordID int IDENTITY(1,1),
    PropertyTypeID AS CAST('PT' + RIGHT('000000' + CAST(PTRecordID AS VARCHAR(6)), 6) AS CHAR(8)) PERSISTED,
    PropertyType varchar(30) NOT NULL,
    PRIMARY KEY (PTRecordID,PropertyTypeID)
  )

  GO

-- INSERTING DATA TO TABLE 12 - PropertyType --
  INSERT INTO PropertyType (PropertyType) VALUES
  ('Flat'),            -- PropertyTypeID: PT000001
  ('Terraced House'),  -- PropertyTypeID: PT000002
  ('Detached House')   -- PropertyTypeID: PT000003

  GO

-- CREATING TABLE 13 - PropertyAreaType --
  CREATE TABLE PropertyAreaType(
    PATRecordID int IDENTITY(1,1),
    PropertyAreaTypeID AS CAST('PAT' + RIGHT('00000' + CAST(PATRecordID AS VARCHAR(5)), 5) AS CHAR(8)) PERSISTED,
    PropertyAreaType char(30) NOT NULL,
    PRIMARY KEY (PATRecordID,PropertyAreaTypeID),
  )

  GO

-- INSERTING DATA TO TABLE 13 - PropertyAreaType --
  INSERT INTO PropertyAreaType (PropertyAreaType) VALUES
  ('Urban'),      -- PropertyAreaTypeID: PAT00001
  ('Suburban'),   -- PropertyAreaTypeID: PAT00002
  ('Rural'),      -- PropertyAreaTypeID: PAT00003
  ('Exurban'),    -- PropertyAreaTypeID: PAT00004
  ('Residential') -- PropertyAreaTypeID: PAT00005

  GO

-- CREATING TABLE 14 - RentAmount --
  CREATE TABLE RentAmount(
    RARecordID INT IDENTITY(1,1),
    RentAmountID AS CAST('RA' + RIGHT('000000' + CAST(RARecordID AS VARCHAR(6)), 6) AS CHAR(8)) PERSISTED,
    RentAmount money NOT NULL,
    PRIMARY KEY (RARecordID, RentAmountID),
  )ON Property_Filegroup3

  GO

-- INSERTING DATA TO TABLE 14 - RentAmount --
  INSERT INTO RentAmount(RentAmount) VALUES
  ('1000'),   -- RentAmountID: RA000001
  ('2000'),   -- RentAmountID: RA000002
  ('3000'),   -- RentAmountID: RA000003
  ('4000'),   -- RentAmountID: RA000004
  ('5000'),   -- RentAmountID: RA000005
  ('6000'),   -- RentAmountID: RA000006
  ('7000'),   -- RentAmountID: RA000007
  ('8000'),   -- RentAmountID: RA000008
  ('9000'),   -- RentAmountID: RA000009
  ('10000'),  -- RentAmountID: RA000010
  ('11000'),  -- RentAmountID: RA000011
  ('12000'),  -- RentAmountID: RA000012
  ('13000'),  -- RentAmountID: RA000013
  ('14000'),  -- RentAmountID: RA000014
  ('15000')   -- RentAmountID: RA000015

  GO

-- CREATING TABLE 15 -PropertyContact --
  CREATE TABLE PropertyContact(
    PCRecordID int IDENTITY(1,1),
    PropertyContactID AS CAST('PC' + RIGHT('000000' + CAST(PCRecordID AS VARCHAR(6)), 6) AS CHAR(8)) PERSISTED,
    laddLADDRecordID INT NOT NULL,
    laddLocationAddressID char(8) NOT NULL,
    PRIMARY KEY (PCRecordID, PropertyContactID),
    CONSTRAINT FK_PC_LADDRecordID FOREIGN KEY (laddLADDRecordID,laddLocationAddressID)
    REFERENCES LocationAddress(LADDRecordID,LocationAddressID),
    CONSTRAINT CHK_PC_LocationAddressID CHECK (LEN(laddLocationAddressID) = 8)
  )ON Property_Filegroup3

GO

-- INSERTING DATA TO TABLE 15 - PropertyContact --
  INSERT INTO PropertyContact(laddLADDRecordID,laddLocationAddressID) VALUES
  ('1','LAD00001'),  -- PropertyContactID: PC000001
  ('2','LAD00002'),  -- PropertyContactID: PC000002
  ('3','LAD00003'),  -- PropertyContactID: PC000003
  ('4','LAD00004'),  -- PropertyContactID: PC000004
  ('1','LAD00001'),  -- PropertyContactID: PC000005
  ('2','LAD00002'),  -- PropertyContactID: PC000006
  ('3','LAD00003'),  -- PropertyContactID: PC000007
  ('4','LAD00004'),  -- PropertyContactID: PC000008
  ('1','LAD00001'),  -- PropertyContactID: PC000009
  ('2','LAD00002'),  -- PropertyContactID: PC000010
  ('3','LAD00003'),  -- PropertyContactID: PC000011
  ('4','LAD00004'),  -- PropertyContactID: PC000012
  ('2','LAD00002'),  -- PropertyContactID: PC000013
  ('3','LAD00003'),  -- PropertyContactID: PC000014
  ('4','LAD00004')   -- PropertyContactID: PC000015

  GO

-- CREATING TABLE 16 - Property --
    CREATE TABLE Property(
      PRecordID int IDENTITY(1,1),
      PropertyID AS CAST('P' + RIGHT('000000' + CAST(PRecordID AS VARCHAR(7)), 7) AS CHAR(8)) PERSISTED,
      ptPTRecordID INT,
      ptPropertyTypeID CHAR(8) NOT NULL,
      patPATRecordID int not null,
      patPropertyAreaTypeID char(8),
      raRARecordID int not null,
      raRentAmountID char(8),
      MaxNoTenants int,
      NoOfBathrooms int,
      NoOfBedrooms int,
      NoOfParkingSlots int,
      SizeInSquareFeet int,
      BuiltDate date Not Null,
      pPCRecordID int not null,
      pcPropertyContactID char(8) Not Null,
      PRIMARY KEY (PRecordID, PropertyID),
      CONSTRAINT FK_PT_PTRecordID_PropertyTypeID FOREIGN KEY (ptPTRecordID, ptPropertyTypeID)
      REFERENCES PropertyType(PTRecordID, PropertyTypeID),
      CONSTRAINT FK_PT_PATRecordID_PropertyAreaTypeID FOREIGN KEY (patPATRecordID,patPropertyAreaTypeID)
      REFERENCES PropertyAreaType(PATRecordID,PropertyAreaTypeID),
      CONSTRAINT FK_PT_RARecordID_RentAmountID FOREIGN KEY (raRARecordID,raRentAmountID)
      REFERENCES RentAmount(RARecordID,RentAmountID),
      CONSTRAINT FK_PT_PCRecordID_PropertyContactID FOREIGN KEY (pPCRecordID,pcPropertyContactID)
      REFERENCES PropertyContact(PCRecordID,PropertyContactID),
    )ON Property_Filegroup3

GO

-- INSERTING DATA TO TABLE 16 - Property --
    INSERT INTO Property(ptPTRecordID,ptPropertyTypeID,patPATRecordID,patPropertyAreaTypeID,raRARecordID,raRentAmountID,MaxNoTenants,NoOfBathrooms,NoOfBedrooms,NoOfParkingSlots,SizeInSquareFeet,BuiltDate,pPCRecordID,pcPropertyContactID) VALUES  --need to add comments
    ('1','PT000001','1','PAT00001','1','RA000001','1','1','1','4','','2001-11-15','1','PC000001'),--check the parent table for values
    ('2','PT000002','2','PAT00002','2','RA000002','1','1','1','1','','2002-11-15','2','PC000002'),--check the parent table for values
    ('3','PT000003','3','PAT00003','15','RA000015','2','1','1','5','','2002-11-15','3','PC000003'),--check the parent table for values
    ('1','PT000001','4','PAT00004','14','RA000014','2','1','2','1','200000','2014-11-15','4','PC000004'),--check the parent table for values
    ('2','PT000002','5','PAT00005','3','RA000003','3','2','2','1','200000','2015-11-15','5','PC000005'),--check the parent table for values
    ('3','PT000003','2','PAT00002','4','RA000004','1','1','2','3','500000','2019-11-15','6','PC000006'),--check the parent table for values
    ('3','PT000003','3','PAT00003','5','RA000005','3','3','2','1','200000','2014-11-15','7','PC000007'),--check the parent table for values
    ('3','PT000003','2','PAT00002','8','RA000008','2','1','1','3','700000','2018-11-15','8','PC000008'),--check the parent table for values
    ('1','PT000001','3','PAT00003','8','RA000008','1','1','1','3','200000','2018-11-15','9','PC000009'),--check the parent table for values
    ('1','PT000001','5','PAT00005','13','RA000013','6','3','3','1','10000','1997-11-15','10','PC000010'),--check the parent table for values
    ('1','PT000001','4','PAT00004','8','RA000008','1','1','1','1','30000','2019-11-15','11','PC000011'),--check the parent table for values
    ('1','PT000001','5','PAT00005','10','RA000010','7','2','4','2','500000','2019-11-15','12','PC000012'),--check the parent table for values
    ('2','PT000002','4','PAT00004','9','RA000009','1','2','1','2','30000','2019-11-15','13','PC000013'),--check the parent table for values
    ('1','PT000001','5','PAT00005','5','RA000005','5','1','4','7','900000','2019-11-15','14','PC000014'),--check the parent table for values
    ('3','PT000003','4','PAT00004','6','RA000006','5','2','2','1','','2019-11-15','15','PC000015')--check the parent table for values

  GO

-- CREATING TABLE 17 - PropertyOtherFacilities  --
  CREATE TABLE PropertyOtherFacilities(
    pofPRecordID int not null,
    pPropertyID char(8) Not Null,
    OtherFacilities varchar(100) NOT NULL,
    PRIMARY KEY (pofPRecordID,pPropertyID,OtherFacilities),
    CONSTRAINT FK_POF_PropertyID FOREIGN KEY (pofPRecordID,pPropertyID)
    REFERENCES Property(PRecordID,PropertyID),
    CONSTRAINT CHK_P_PropertyID CHECK (LEN(pPropertyID) = 8)
  )

  GO

-- INSERTING DATA TO TABLE 17 - PropertyOtherFacilities --
  INSERT INTO PropertyOtherFacilities(pofPRecordID,pPropertyID,OtherFacilities) VALUES
  ('1','P0000001','Large Dining Room'),
  ('2','P0000002','Outdoor Patio'),
  ('3','P0000003','Kitchen'),
  ('1','P0000001','Laundry facilities'),
  ('2','P0000002','Outdoor Play Area')

  GO

  -- CREATING TABLE 18 - PropertyFlatFloorNumber  --
  CREATE TABLE PropertyFlatFloorNumber(
    PFFNRecordID int IDENTITY(1,1),
    FloorNumberID AS CAST('FN' + RIGHT('000000' + CAST(PFFNRecordID AS VARCHAR(6)), 6) AS CHAR(8)) PERSISTED,
    FloorNumber varchar(2) NOT NULL,
    PRIMARY KEY (PFFNRecordID,FloorNumberID)
  )

  GO

-- INSERTING DATA TO TABLE 18 - PropertyFlatFloorNumber --
  INSERT INTO PropertyFlatFloorNumber(FloorNumber) VALUES
  ('05'),
  ('03'),
  ('01'),
  ('01'),
  ('01'),
  ('04'),
  ('00')

  GO

-- CREATING TABLE 19 - PropertyStatus  --
  CREATE TABLE PropertyStatus(
    PSRecordID int IDENTITY(1,1),
    StatusID AS CAST('PS' + RIGHT('000000' + CAST(PSRecordID AS VARCHAR(6)), 6) AS CHAR(8)) PERSISTED,
    Status VARCHAR(15) NOT NULL,
    PRIMARY KEY (PSRecordID, StatusID)
  )

  GO

-- INSERTING DATA TO TABLE 19 - PropertyStatus --
  INSERT INTO PropertyStatus(Status) VALUES  --need to add comments
  ('Rented'),--check the parent table for values
  ('Available'),
  ('Not Available')

  GO

-- CREATING TABLE 20 - PropertyFlat --
  CREATE TABLE PropertyFlat(
    PFRecordID int IDENTITY(1,1),
    PFPropertyID AS CAST('PF' + RIGHT('000000' + CAST(PFRecordID AS VARCHAR(6)), 6) AS CHAR(8)) PERSISTED,
    pPRecordID int not null,
    pPropertyID char(8) not null,
    pffnPFFNRecordID int not null,
    pffFloorNumberID char(8) not null,
    psPSRecordID int not null,
    psStatusID CHAR(8),
    PRIMARY KEY (PFRecordID, PFPropertyID),
    CONSTRAINT FK_PF_PRecordID_PropertyID FOREIGN KEY (pPRecordID, pPropertyID)
    REFERENCES Property(PRecordID, PropertyID),
    CONSTRAINT FK_PF_PFFNRecordID_FloorNoID FOREIGN KEY (pffnPFFNRecordID, pffFloorNumberID)
    REFERENCES PropertyFlatFloorNumber(PFFNRecordID, FloorNumberID),
    CONSTRAINT FK_PF_PSRecordID_StatusID FOREIGN KEY (psPSRecordID, psStatusID)
    REFERENCES PropertyStatus(PSRecordID, StatusID),
    CONSTRAINT CHK_PF_pPropertyID CHECK (LEN(pPropertyID) = 8),
    CONSTRAINT CHK_PF_pffFloorNoID CHECK (LEN(pffFloorNumberID) = 8),
    CONSTRAINT CHK_PF_psStatusID CHECK (LEN(psStatusID) = 8),
  )ON Property_Filegroup3

  GO

-- INSERTING DATA TO TABLE 20 - PropertyFlat --
  INSERT INTO PropertyFlat(pPRecordID,pPropertyID,pffnPFFNRecordID,pffFloorNumberID,psPSRecordID,psStatusID) VALUES
  ('1','P0000001','1','FN000001','1','PS000001'),
  ('4','P0000004','2','FN000002','1','PS000001'),
  ('9','P0000009','3','FN000003','2','PS000002'),
  ('10','P0000010','4','FN000004','2','PS000002'),
  ('11','P0000011','5','FN000005','3','PS000003'),
  ('12','P0000012','6','FN000006','3','PS000003'),
  ('14','P0000014','7','FN000007','3','PS000003')

  GO

-- CREATING TABLE 21 - PropertyTerracedHouseType --
  CREATE TABLE PropertyTerracedHouseType(
    PTHTRecordID INT IDENTITY(1,1),
    TypeID AS CAST('PTHT' + RIGHT('0000' + CAST(PTHTRecordID AS VARCHAR(4)), 4) AS CHAR(8)) PERSISTED, --Doube check this plz
    Type varchar(12) NOT NULL,
    PRIMARY KEY (PTHTRecordID, TypeID)
  )ON Property_Filegroup3

  GO

-- INSERTING DATA TO TABLE 21 - PropertyTerracedHouseType --
  INSERT INTO PropertyTerracedHouseType(Type) VALUES
  ('Modern'),           -- TypeID: PTHT0001
  ('Transitional'),     -- TypeID: PTHT0002
  ('Other')             -- TypeID: PTHT0003

  GO

-- CREATING TABLE 22 - PropertyTerracedHouse  --
  CREATE TABLE PropertyTerracedHouse(
    PTHRecordID int IDENTITY(1,1),
    PTHPropertyID AS CAST('PT' + RIGHT('000000' + CAST(PTHRecordID AS VARCHAR(6)), 6) AS CHAR(8)) PERSISTED,
    pPRecordID int not null,
    pPropertyID char(8) not null,
    pthtPTHTRecordID int not null,
    pthTypeID char(8) not null,
    psPSRecordID int not null,
    psStatusID char(8) not null,
    NoOfFloors int Not Null,
    PRIMARY KEY (PTHRecordID, PTHPropertyID, pPropertyID),
    CONSTRAINT FK_PTH_PRecordID_PropertyID FOREIGN KEY (pPRecordID, pPropertyID)
    REFERENCES Property(PRecordID, PropertyID),
    CONSTRAINT FK_PTH_PTHTRecordID_TypeID FOREIGN KEY (pthtPTHTRecordID, pthTypeID)
    REFERENCES PropertyTerracedHouseType(PTHTRecordID, TypeID),
    CONSTRAINT FK_PTH_PSRecordID_StatusID FOREIGN KEY (psPSRecordID, psStatusID)
    REFERENCES PropertyStatus(PSRecordID, StatusID)
  )

  GO

-- INSERTING INTO TABLE 22 - PropertyTerracedHouse  --
  INSERT INTO PropertyTerracedHouse(pPRecordID, pPropertyID, pthtPTHTRecordID, pthTypeID, psPSRecordID, psStatusID,NoOfFloors) VALUES
  (2,'P0000002',1, 'PTHT0001', 1, 'PS000001', '2'),
  (5,'P0000005',3, 'PTHT0003',3, 'PS000003', '3'),
  (13,'P0000013',2, 'PTHT0002', 2, 'PS000002','1')

  GO

-- CREATING TABLE 23 - PropertDetachedHouse --
  CREATE TABLE PropertyDetachedHouse(
    PDHRecordID INT IDENTITY(1,1) NOT NULL,
    PDHPropertyID AS CAST('PD' + RIGHT('000000' + CAST(PDHRecordID AS VARCHAR(6)), 6) AS CHAR(8)) PERSISTED,
    pPRecordID INT NOT NULL,
    pPropertyID CHAR(8) NOT NULL,
    psPSRecordID INT NOT NULL,
    psStatusID CHAR(8) NOT NULL,
    NoOfFloors INT NOT NULL,
    PRIMARY KEY (PDHRecordID, PDHPropertyID, pPropertyID),
    CONSTRAINT FK_PDH_PRecordID_PropertyID FOREIGN KEY (pPRecordID, pPropertyID)
    REFERENCES Property(PRecordID, PropertyID),
    CONSTRAINT FK_PDH_PSRecordID_StatusID FOREIGN KEY (psPSRecordID, psStatusID)
    REFERENCES PropertyStatus(PSRecordID, StatusID)
  )ON Property_Filegroup3

  GO

  -- INSERTING INTO TABLE 23 - PropertyDetachedHouse  --
  INSERT INTO PropertyDetachedHouse(pPRecordID, pPropertyID, psPSRecordID, psStatusID, NoOfFloors) VALUES
  (3, 'P0000003', 2, 'PS000002', 02),
  (6, 'P0000006', 3, 'PS000003', 03),
  (7, 'P0000007', 1, 'PS000001', 01),
  (8, 'P0000008', 1, 'PS000001', 02),
  (15, 'P0000015', 3, 'PS000003', 03)

  GO

-- CREATING TABLE 24 - SystemLoginAccountType  --
  CREATE TABLE SystemLoginAccountType(
    SLATRecordID INT IDENTITY(1,1) NOT NULL,
    AccountTypeID AS CAST('AT' + RIGHT('000000' + CAST(SLATRecordID AS VARCHAR(6)), 6) AS CHAR(8)) PERSISTED,
    AccountType VARCHAR(30) NOT NULL,
    PRIMARY Key(SLATRecordID, AccountTypeID)
  )

  GO

-- INSERTING INTO TABLE 24 - SystemLoginAccountType  --
  INSERT INTO SystemLoginAccountType(AccountType) VALUES
  ('Undergraduate Student'),          -- AccountTypeID: AT000001
  ('Postgraduate Student'),           -- AccountTypeID: AT000002
  ('Single Property Landlord'),       -- AccountTypeID: AT000003
  ('Multiple Property Landlord')      -- AccountTypeID: AT000004

  GO

-- CREATING TABLE 25 - SystemLogin  --
  CREATE TABLE SystemLogin(
    SLRecordID INT IDENTITY(1,1),
    SystemLoginID AS CAST('SL' + RIGHT('000000' + CAST(SLRecordID AS VARCHAR(6)), 6) AS CHAR(8)) PERSISTED,
    UserName varchar(20) NOT NULL UNIQUE,  --SETTED USER NAME AS UNIQUE TO PREVENT DATA DUPLICATION (RANUL)
    Passwordhash VARCHAR(128) NOT NULL,
    slatSLATRecordID INT NOT NULL,
    slatAccountTypeID CHAR(8) NOT NULL,
    CreationDateTime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, --UPDATED TO DATETIME TO WORK WITH MSSQL (RANUL)
    PRIMARY KEY (SLRecordID, SystemLoginID),
    CONSTRAINT FK_SL_SLATRecordID_AccountypeID FOREIGN KEY (slatSLATRecordID, slatAccountTypeID)
    REFERENCES SystemLoginAccountType(SLATRecordID, AccountTypeID)
  )ON SystemLogin_Filegroup6

  GO


-- INSERTING INTO TABLE 25 - SystemLogin  --
  INSERT INTO SystemLogin(UserName,Passwordhash,slatSLATRecordID,slatAccountTypeID) VALUES
  ('Clay.Allyson14', '88b685b556f8f2ea3bffbb2174c4e1d793fb2e120fc64dd9dd8ce9320e8c738f324129b6b6afd1cf8b4eb2e60ef4bbb861c52be1c298b0fa8c18c766ecc28086','1','AT000001'),         --Password= allyson@1427   |   SystemLoginID: SL000001
  ('Tyler.Williams102', '6e3ce81c5e38499f3c44c65f67f7eaf5de9e11a5bdec5f22f0fa9a091fff4f132e693aeb5501ddaea2e587672c325ab9f3b0c84be4fb993df62479d03f423ec3', '2','AT000002'),           --Password=Tyler$7513      |   SystemLoginID: SL000002
  ('Kent.Robbins98', '6095ba674ed582fb482e1706b6488c46f1491e4492352db084ae3103079b3e8af3402e0fc85a2000a43115b8e3537f21baf84a63a3e9c70e71a2d1617de8c618', '3','AT000003'),            --Password=Kent*0615       |   SystemLoginID: SL000003
  ('Obrien.Murphy17', 'e0663fbd390b5520af5b96a293c77b1dee22ac7247943ae1f5a0dbf5c4beeb7129c08b1b8fa0b3b37141766a870f655b096d2ebe0613d36b6d0da11b44cf3eee','4', 'AT000004'),          --Password=Obrien!1303     |   SystemLoginID: SL000004
  ('Walter.Flynn64', 'a8a23740862ff343ef7495a8efe488f9f0491e13eb17c95ffb0d653e67caf3da9aa68b609d1bce6ce552c7f3458d0a1e934d2ad29433f6c8f12f5f2911c14dff', '1','AT000001'),          --Password=Walter#654      |   SystemLoginID: SL000005
  ('Cole.Baxter18', '3b350ea4f978c1f61fd1fb33dbb9ecbdb9ac0b607410cbeda889a5758eaf86db587ce07553b84557ec0be9fb2e4e5d897e7657ff19dee1a2fc17df66cd2605a2','2', 'AT000002'),            --Password=Cole@1516       |   SystemLoginID: SL000006
  ('Ellis.Glenn81', '97c01ff7eede759db5f5cc06af7b92042424da393335132cbe424366ab0362b848946392b844845755f9f7a5733d09c8a642d8c689232b1d9475a8d90ff677c3', '3','AT000003'),           --Password=Ellis$6516      |   SystemLoginID: SL000007
  ('Tharindu.Gardner71', '4d49e2db71027c3b648cdcd201b474e32e361fdadbdea404ad103cda83f618553af0b5fd20580b7a3769b87511d52342e385d9879381c84730e34d320dbd5cb0','4', 'AT000004'),        --Password=Tharindu%6156   |   SystemLoginID: SL000008
  ('Peter.Quinn88', 'ee45885f980bf10d0d60e948c7f4b9cabcc3aabc10b87163945e36e1a4d14216aa57bcb60ea3013c86cee82af42a6bc03f21515a738ab79fb42e76b299f060ee','1', 'AT000001'),           --Password=Peter#1651      |   SystemLoginID: SL000009
  ('Gihan.Correa54', 'a525169296c334e20dbb059a4087015694b54b97d1a16a0e6ed5b8f24a1eb6ca975707b39bec59813d06e873c2754be2cfb58cafc0c3010ceee2f7286049104c','2', 'AT000002'),           --Password=Gihan!1561      |   SystemLoginID: SL000010
  ('Andrew.Sirisena46', 'fc83106a51a1a79b4726e11cd29038fad466d2333101886ecc9528028400f15471210af29d6b7e1441f851907a2b9b0254a0761ff0d0a6f54d631ed004bda9d5','3', 'AT000003'),          --Password=Andrew@5161     |   SystemLoginID: SL000011
  ('Ranga.Ekanayake12', '63bcbc4985f3847cd4ba0af1c344313031c4268939da2f94cf829660c3bb06e4b412bcbf27b1d008e2a786f6544b26cf0c3cf9eda039ca5e5d525aad673d9a89','4', 'AT000004'),           --Password=Ranga$1561      |   SystemLoginID: SL000012
  ('Pasindu.Morgan74', 'b4b3b0b53f888f3142eb5118ce0c53fad1230a35269a23d4b0fab35911fcad9041eef30eea707f11aeaeae061577809cb84b0eae5e738a6032b240e7c5c9793d','1', 'AT000001'),         --Password=Pasindu*1561    |   SystemLoginID: SL000013
  ('Kalani.Thomas61', '52e5342ba5b1acdc7381f19854e6ce7f2286bdd21418e7128bcc1d973074f0a8fd93e8a25733c34ede14ae49b4a39b5e6b2c8c8d2ee4e7d3274fda9699a7fa73','2', 'AT000002'),          --Password=Kalani$1516     |   SystemLoginID: SL000014
  ('Peter.Bandara75', 'f9c21071a4efd98cb5442a277a47a25e8cd38d73bbb22c12bfc40564d2707de713b8ef58e4679a5972c8b3453feae7021630dc6098de481901cc273373a52e18','3', 'AT000003'),           --Password=Peter#1652      |   SystemLoginID: SL000015
  ('Sahan.Brady15', 'b7a5a668225d22ee4feb881e85d247e1728a3b2861ad86e7d3c62326f786047b5d9dc05c634b8d768b41c3bac4d4d872ca2cf668ef1bc0a202d7a40b2c32ca6a','4', 'AT000004')            --Password=Sahan@1652      |   SystemLoginID: SL000016
                      -- Don't add add to this column manually


  GO

-- CREATING TABLE 26 - systemLoginLoginDateTime  --
  CREATE TABLE SystemLoginLoginDateTime(
    slSLRecordID INT NOT NULL,
    slSystemLoginID CHAR(8),
    LoginDateTime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (slSLRecordID,slSystemLoginId, LoginDateTime),
    CONSTRAINT FK_SL_SystemLoginID FOREIGN KEY (slSLRecordID, slSystemLoginId)
    REFERENCES SystemLogin(SLRecordID, SystemLoginID)
  )ON SystemLogin_Filegroup6

  GO

-- INSERTING INTO TABLE 26 - SystemLoginLoginDateTime  --
  INSERT INTO SystemLoginLoginDateTime(slSLRecordID,slSystemLoginID) VALUES
  ('1','SL000001'),-- edit
  ('2','SL000002'),
  ('3','SL000003'),
  ('4','SL000004'),
  ('5','SL000005'),
  ('6','SL000006'),
  ('7','SL000007'),
  ('8','SL000008'),
  ('9','SL000009'),
  ('10','SL000010'),
  ('11','SL000011'),
  ('12','SL000012'),
  ('13','SL000013'),
  ('14','SL000014'),
  ('15','SL000015')

GO

-- CREATING TABLE 27 - systemLoginLogoutDateTime  --
  CREATE TABLE SystemLoginLogoutDateTime(
    slSLRecordID INT NOT NULL,
    slSystemLoginID char(8),
    LogoutDateTime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (slSystemLoginId,LogoutDateTime),
    CONSTRAINT FK_SLLDT_SystemLoginID FOREIGN KEY (slSLRecordID, slSystemLoginId)
    REFERENCES SystemLogin(SLRecordID, SystemLoginID)
  )ON SystemLogin_Filegroup6

  GO

-- INSERTING INTO TABLE 27 - SystemLoginLogoutDateTime  --
  INSERT INTO SystemLoginLogoutDateTime(slSLRecordID ,slSystemLoginID) VALUES
  ('1','SL000001'),
  ('2','SL000002'),
  ('3','SL000003'),
  ('4','SL000004'),
  ('5','SL000005'),
  ('6','SL000006'),
  ('7','SL000007'),
  ('8','SL000008'),
  ('9','SL000009'),
  ('10','SL000010'),
  ('11','SL000011'),
  ('12','SL000012'),
  ('13','SL000013'),
  ('14','SL000014'),
  ('15','SL000015')

  GO

-- CREATING TABLE 28 - UndergraduateStudents --
  CREATE TABLE UndergraduateStudents(
    UGRecordID int IDENTITY(1,1) Not Null,
    UGStudentID AS CAST('UG' + RIGHT('000000' + CAST(UGRecordID AS VARCHAR(6)), 6) AS CHAR(8)) PERSISTED,
    sNationalInsuranceNumber varchar(9),
    msMSRecordID INT not null,
    msMembershipStatusID char(8) not null,
    FirstName Varchar(20) Not Null,
    MiddleName Varchar(20) Not Null,
    LastName varchar(30) Not Null,
    sgSGRecordID int not null,
    sgGenderID char(8) not null,
    DateOfBirth datetime ,
    uURecordID int not null,
    ucUniversityID_EnrolledTo VARCHAR(4),
    EstimatedProgramCompletionDate datetime Not Null,
    pPRecordID int not null,
    pPropertyID char(8),
    csCSRecordID int not null,
    csEmployeeID_RegisteredBy char(8),
    RegistrationDateTime DATETIME DEFAULT CURRENT_TIMESTAMP,
    slSLRecordID int not null,
    slSystemLoginID Char(8),
    PRIMARY KEY (UGStudent⁯ID, sNationalInsuranceNumber, UGRecordID),
    CONSTRAINT FK_US_SC FOREIGN KEY (sNationalInsuranceNumber) REFERENCES StudentContact(NationalInsuranceNumber),
    CONSTRAINT FK_US_MS FOREIGN KEY (msMSRecordID, msMembershipStatusID) REFERENCES MembershipStatus(MSRecordID, MembershipStatusID),
    CONSTRAINT FK_US_SG FOREIGN KEY (sgSGRecordID, sgGenderID) REFERENCES StudentGender(SGRecordID, GenderID),
    CONSTRAINT FK_US_UC FOREIGN KEY (uURecordID, ucUniversityID_EnrolledTo) REFERENCES UniversityContact(URecordID, UniversityID),
    CONSTRAINT FK_US_CS FOREIGN KEY (csCSRecordID, csEmployeeID_RegisteredBy) REFERENCES CustomerService(CSRecordID, EmployeeID),
    CONSTRAINT FK_US_P FOREIGN KEY (pPRecordID, pPropertyID) REFERENCES Property(PRecordID, PropertyID),
    CONSTRAINT FK_US_SL FOREIGN KEY (slSLRecordID, slSystemLoginID) REFERENCES SystemLogin(SLRecordID, SystemLoginID)
  )ON Student_Filegroup4

  GO

-- INSERTING INTO TABLE 28 - UndergraduateStudent  --
  INSERT INTO UndergraduateStudents(sNationalInsuranceNumber,msMSRecordID, msMembershipStatusID, FirstName, MiddleName, LastName,
                              sgSGRecordID, sgGenderID, DateOfBirth,uURecordID, UcUniversityID_EnrolledTo, EstimatedProgramCompletionDate,pPRecordID,pPropertyID,
                                                csCSRecordID, csEmployeeID_RegisteredBY,RegistrationDateTime,slSLRecordID, slSystemLoginID) VALUES
    ('WB940276B','1', 'MS000001', 'Allyson', 'Claude', 'Clay','2', 'SG000002', '2020-01-06 12:34:06.693','2', 'UCL', '2020-01-06 12:34:06.693','1', 'P0000001','1', 'EMP00001','','1', 'SL000001'),-- check last column values after Systemlogin
    ('LP064709C','1', 'MS000001', 'Tyler', 'Damien', 'Williams','1', 'SG000001', '2020-01-06 12:34:06.693','2','UCL', '2020-01-06 12:34:06.693','2', 'P0000002','1', 'EMP00010','','2', 'SL000002'),
    ('AG646231C','2', 'MS000002', 'Kent', 'Troy', 'Robbins','1', 'SG000001', '2020-01-06 12:34:06.693','1', 'OU', '2020-01-06 12:34:06.693','3', 'P0000003','2', 'EMP00002','','3', 'SL000003'),
    ('RW794588C','3', 'MS000003', 'Obrien', 'Arden', 'Murphy','1', 'SG000001', '2020-01-06 12:34:06.693','4', 'PU', '2020-01-06 12:34:06.693','4', 'P0000004','3','EMP00003','','4', 'SL000004'),
    ('RB153694C','3', 'MS000003', 'Walter', 'Dex', 'Flynn','1', 'SG000001', '2020-01-06 12:34:06.693','2', 'UCL', '2020-01-06 12:34:06.693','5', 'P0000005','4', 'EMP00004','','5', 'SL000005'),
    ('KS459037D','2', 'MS000002', 'Cole', 'Cody', 'Baxter','1', 'SG000001', '2020-01-06 12:34:06.693','3', 'CAM', '2020-01-06 12:34:06.693','6', 'P0000006','5', 'EMP00005','','6', 'SL000006'),
    ('CN953687C','2', 'MS000002', 'Ellis', 'Apollo', 'Glenn','2', 'SG000002', '2020-01-06 12:34:06.693','1', 'OU', '2020-01-06 12:34:06.693','7', 'P000007','6', 'EMP00006','','7', 'SL000007')

GO

-- CREATING TABLE 29 - PostgraduateStudents  --
  CREATE TABLE PostgraduateStudents(
    PRecordID int IDENTITY(1,1),
    PGStudentID AS CAST('PG' + RIGHT('000000' + CAST(PRecordID AS VARCHAR(6)), 6) AS CHAR(8)) PERSISTED,
    sNationalInsuranceNumber varchar(9),
    msMSRecordID INT NOT NULL,
    msMembershipStatusID CHAR(8),
    FirstName Varchar(20) Not Null,
    MiddleName Varchar(20) Not Null,
    LastName varchar(30) Not Null,
    sgSGRecordID INT NOT NULL,
    sgGenderID char(8),
    DateOfBirth date Not Null,
    uURecordID INT NOT NULL,
    ucUniversityID_EnrolledTo varchar(4),
    EstimatedProgramCompletionDate date Not Null,
    EmployerName Varchar(20),
    EmployerContactNumber ,
    pPRecordID INT NOT NULL,
    pPropertyID char(8),
    csCSRecordID INT NOT NULL,
    csEmployeeID_RegisteredBy char(8),
    RegistrationDateTime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    slSLRecordID INT NOT NULL,
    slSystemLoginID Char(8),
    PRIMARY KEY (PGStudent⁯ID, sNationalInsuranceNumber, PRecordID),
    CONSTRAINT FK_PG_SC FOREIGN KEY (sNationalInsuranceNumber) REFERENCES StudentContact(NationalInsuranceNumber),
    CONSTRAINT FK_PG_MS FOREIGN KEY (msMSRecordID, msMembershipStatusID) REFERENCES MembershipStatus(MSRecordID, MembershipStatusID),
    CONSTRAINT FK_PG_SG FOREIGN KEY (sgSGRecordID, sgGenderID) REFERENCES StudentGender(SGRecordID, GenderID),
    CONSTRAINT FK_PG_UC FOREIGN KEY (uURecordID, ucUniversityID_EnrolledTo) REFERENCES UniversityContact(URecordID, UniversityID),
    CONSTRAINT FK_PG_P FOREIGN KEY (pPRecordID, pPropertyID) REFERENCES Property(PRecordID, PropertyID),
    CONSTRAINT FK_PG_CS FOREIGN KEY (csCSRecordID, csEmployeeID_RegisteredBy) REFERENCES CustomerService(CSRecordID, EmployeeID),
    CONSTRAINT FK_PG_SL FOREIGN KEY (slSLRecordID, slSystemLoginID) REFERENCES SystemLogin(SLRecordID,SystemLoginID)
  )ON Student_Filegroup4

  GO

-- INSERTING INTO TABLE 29 - PostgraduateStudent  ---- edit-- edit
  INSERT INTO PostgraduateStudents(sNationalInsuranceNumber,msMSRecordID, msMembershipStatusID, FirstName, MiddleName, LastName,
                                  sgSGRecordID,sgGenderID, DateOfBirth,uURecordID, UcUniversityID_EnrolledTo, EstimatedProgramCompletionDate,
                                  EmployerName, EmployerContactNumber,pPRecordID, pPropertyID,csCSRecordID , csEmployeeID_RegisteredBY,slSLRecordID, slSystemLoginID) VALUES
  ('AG671006A','3', 'MS000003', 'Andrew', 'Larry', 'Sirisena','1', 'SG000001',15/02/1996,'2', 'UCL', 12/06/2021,'Oshan', 0761384972,'1', 'P0000001', '1','EMP00001','1', 'SL000001'), ---have to check the last columns with system login
  ('NZ873662D','1', 'MS000001', 'Ranga', 'Jerad', 'Ekanayake','1', 'SG000001', 31/01/1998,'3', 'CAM', 06/12/2022,' Ashane', '0713648921','2', 'P0000002', '1','EMP00001','2','SL000002'),
  ('YT428556A','2', 'MS000002', 'Pasindu', 'Stevyn', 'Morgan','2', 'SG000002', 01/03/1993,'4', 'PU',15/04/2025,'Chaminda', '0724598312','3', 'P0000003', '2','EMP00002','3', 'SL000003'),
  ('HG747890A','3', 'MS000003', 'Kalani', 'Ana', 'Thomas','1', 'SG000001', 19/01/1999,'4', 'PU', 09/06/2023, 'Chamara', 0764893214,'4', 'P0000004', '3','EMP00003', '4','SL000004'),
  ('WW680475B','3', 'MS000003', 'Peter', 'Quinn', 'Bandara','2', 'SG000002', 12/09/1997,'1', 'OU', 01/07/2024, 'Athula', 0726489513,'5', 'P0000005', '4','EMP00004','5', 'SL000005'),
  ('WE486863D','1', 'MS000001', 'Sahan', 'Mason', 'Brady','1', 'SG000001', 03/01/1995,'1', 'OU', 19/09/2022, 'Sandun',0794846315 ,'6','P0000006', '5','EMP00005', '6','SL000006'),
  ('BA660327B','2', 'MS000002', 'Gihan', 'Bryce', 'Correa','1', 'SG000001', 11/04/1994,'4', 'PU', 18/01/2025, 'Nuwan',0761279451 ,'7','P0000007', '6','EMP00006','7','SL000007'),
  ('RW874927B','2', 'MS000002', 'Tharindu', 'Ray', 'Gardner','1', 'SG000001', 13/07/1997,'2', 'UCL', 20/04/2021, 'Tharindu', 0729475312,'8', 'P0000008', '7','EMP00007','8','SL000008')


GO

-- CREATING TABLE 30 - SECRelationshipToStudent  --
  CREATE TABLE SECRelationshipToStudent(
    SECRTSRecordID int IDENTITY(1,1) Not Null,
    RTSID AS CAST('RTS' + RIGHT('00000' + CAST(SECRTSRecordID AS VARCHAR(5)), 5) AS CHAR(8)) PERSISTED,
    RelationshipToStudent varchar(10) Not Null,
    PRIMARY KEY (SECRTSRecordID, RTSID)
  )

  GO

  -- INSERTING INTO TABLE 30 - SECRelationshipToStudents --
  INSERT INTO SECRelationshipToStudents(RelationshipToStudents) VALUES
  ('Mother'),        -- RTSID: RTS00001
  ('Father'),        -- RTSID: RTS00002
  ('Grand Mother'),  -- RTSID: RTS00003
  ('Grand Father'),  -- RTSID: RTS00004
  ('Brother'),       -- RTSID: RTS00005
  ('Mother'),        -- RTSID: RTS00006
  ('Sister')         -- RTSID: RTS00007

  GO

-- CREATING TABLE 31 - StudentEmergencyContact  --
  CREATE TABLE StudentEmergencyContact(
    SECRecordID int IDENTITY(1,1) Not Null,
    SECID AS CAST('SE' + RIGHT('000000' + CAST(SECRecordID AS VARCHAR(6)), 6) AS CHAR(8)) PERSISTED,
    secrtsSECRTSRecordID INT NOT NULL,
    secrtsRTSID char(8) NOT NULL,
    FirstName Varchar(20) Not Null,
    MiddleName Varchar(20) Not Null,
    LastName varchar(30) Not Null,
    laddLADDRecordID INT NOT NULL,
    laddLocationAddressID char(8) not null,
    sNationalInsuranceNumber varchar(9),
    PRIMARY KEY (SECID, SECRecordID),
    CONSTRAINT FK_SECrts_RTSID FOREIGN KEY (secrtsSECRTSRecordID, secrtsRTSID) REFERENCES SECRelationshipToStudent(SECRTSRecordID, RTSID),
    CONSTRAINT FK_LA_AreaID FOREIGN KEY (laddLADDRecordID, laddLocationAddressID) REFERENCES LocationAddress(LADDRecordID, LocationAddressID),
    CONSTRAINT FK_SC_NSNumber FOREIGN KEY (sNationalInsuranceNumber) REFERENCES StudentContact(NationalInsuranceNumber)
  )ON Student_Filegroup4

  GO

-- INSERTING INTO TABLE 31 - StudentEmergencyContact  --
INSERT INTO StudentEmergencyContact(secrtsRTSID, FirstName, MiddleName, LastName, LaneAddress, laLocationAreaID, sNationallInsuranceNumber) VALUES
  ('SE000001', 'Marvan', 'Donald', 'Norton','Hamer''s Ave', 'LA000001', 'WB940276B'),
  ('SE000002', 'Gerard', 'Marshall', 'Maxwell','Fonseka Pl', 'LA000002', 'LP064709C'),
  ('SE000003', 'Vishal', 'Rex', 'Matthews', 'Galle Rd', 'LA000003', 'AG646231C'),
  ('SE000004', 'Carl', 'Robin', 'Fuller', 'Jayasinghe Rd', 'LA000004', 'RW794588C'),
  ('SE000005', 'Andrew', 'Bill', 'Hunter', 'Havelock Rd', 'LA000005', 'RB153694C'),
  ('SE000006', 'Evan', 'Paul', 'Reeves', 'Kinross Ave', 'LA000006', 'KS459037D'),
  ('SE000007', 'Lorenzo', 'Collins', 'Peters','Colombo - Galle Main Rd',  'LA000007','CN953687'),
  ('SE000008', 'Chathura', 'Rolando', 'Burton', 'Arethusa Ln', 'LA000008', 'AG671006A'),
  ('SE000009', 'Naveen', 'Stephen', 'Jackson', 'Alan Mathiniyarama Rd', 'LA000009', 'NZ873662'),
  ('SE000010', 'Mira', 'Katrina', 'Lynch', 'Alan Mathiniyarama Rd', 'LA000010', 'YT428556A'),
  ('SE000011', 'Nancy', 'Morgan', 'Greer', 'E S Fernando Mawatha', 'LA000011', 'HG747890'),
  ('SE000012', 'Fernando', 'Tim', 'Richardson', 'Girton School Rd', 'LA000012', 'WW680475B'),
  ('SE000013', 'Dianna', 'Tiffany', 'Norris', 'Jayasinghe Rd', 'LA000013', 'WE486863D'),
  ('SE000014', 'Allen', 'Wade', 'Bradley', 'Kirillapone Masjid Rd', 'LA000014', 'BA660327'),
  ('SE000015', 'Ben', 'Bruce', 'Wayne', 'Kothalawala Gardens', 'LA000015', 'RW874927B')

  GO

-- CREATING TABLE 32 - StudentEmergencyContactNumber  --
  CREATE TABLE StudentEmergencyContactNumber (
    secSECRecordID int Not Null,
    secSECID char(8) Not Null,
    ContactNumber Varchar(11),
    PRIMARY KEY (secSECID, secSECRecordID, ContactNumber),
    CONSTRAINT FK_SECN_secSECRecordID FOREIGN KEY (secSECRecordID, secSECRecordID) REFERENCES StudentEmergencyContact(SECRecordID, SECRecordID),
    CONSTRAINT CHK_SECN_ContactNumber CHECK (ContactNumber LIKE '[0-9][0-9][0-9][0-9][.-][0-9][0-9][0-9][0-9][0-9][0-9]')
  )ON Student_Filegroup4

  GO

-- INSERTING INTO TABLE 32 - StudentEmergencyContactNumber  --
  INSERT INTO StudentEmergencyContactNumber(secSECID, secSECRecordID, ContactNumber) VALUES
  ('SE000001', '1', '1865-270000'),
  ('SE000002', '2', '2000-270000'),
  ('SE000003', '3', '1825-270500'),
  ('SE000004', '4', '1865-075700'),
  ('SE000005', '5', '1865-300000'),
  ('SE000006', '6', '1865-290000'),
  ('SE000007', '7', '1865-270300'),
  ('SE000008', '8', '1856-270000'),
  ('SE000009', '9', '1235-270000'),
  ('SE000010', '10', '1350-276300'),
  ('SE000011', '11', '1875-275600'),
  ('SE000012', '12', '1865-275060'),
  ('SE000013', '13', '1865-270370'),
  ('SE000014', '14', '1865-270030'),
  ('SE000015', '15', '1855-270001')

 GO

-- CREATING TABLE 33 - Payment  --
  CREATE TABLE Payment(
    PMRecordID int IDENTITY(1,1),
    PaymentID AS CAST('PY' + RIGHT('000000' + CAST(PMRecordID AS VARCHAR(6)), 6) AS CHAR(8)) PERSISTED,
    MonthlyWaterFee Money,
    MonthlyElectricityFee Money,
    raRARecordID int Not Null,
    raRentAmountID char(8) Not Null,
    MonthlyTax AS (dbo.fnCalculationMonthlyTax(MonthlyWaterFee, MonthlyElectricityFee, raRentAmountID)),
    TotalMonthlyFee AS (dbo.fnCalculationMonthlyPayment(MonthlyWaterFee, MonthlyElectricityFee, raRentAmountID, MonthlyTax)),
    OneTimeDepositFee Money ,
    pPRecordID int Not NUll,
    pPropertyID_ChargedTo Varchar(8) Not NUll,
    sNationalInsuranceNumber_PaidBy Varchar(9) Not NUll,
    PRIMARY KEY (PMRecordID, PaymentID),
    CONSTRAINT FK_PAY_RARecordID FOREIGN KEY (raRARecordID, raRentAmountID) REFERENCES RentAmount(RARecordID, RentAmountID),
    CONSTRAINT FK_PAY_PRecordID FOREIGN KEY (pPRecordID) REFERENCES Property(PRecordID),
    CONSTRAINT FK_PAY_NationalInsuranceNumber_PaidBy FOREIGN KEY (sNationalInsuranceNumber_PaidBy) REFERENCES StudentContact(NationalInsuranceNumber),
    CONSTRAINT CHK_P_PaymentID CHECK (LEN(PaymentID) = 8)
  )ON Payment_Filegroup8

  GO

-- INSERTING INTO TABLE 33 - Payment  --
  INSERT INTO Payment(MonthlyWaterFee, MonthlyElectricityFee, raRARecordID, raRentAmountID, MonthlyTax, TotalMonthlyFee, OneTimeDepositFee,OneTimeDepositFee,pPRecordID,pPropertyID_ChargedTo,sNationalInsuranceNumber_PaidBy) VALUES
    ('450','7350','1','RA000001','1.00','1','RA000001','1000','10000','WB940276B'),
    ('750','7580','2','RA000002','2.00','2','RA000002','2000','20000','LP064709C'),
    ('3250','7590','3','RA000003','5.00','3','RA000003','3000','30000','AG646231C'),
    ('3530','1750','4','RA000004','15.00','4','RA000004','4000','40000','RW794588C'),
    ('350','7750','5','RA000005','2.00','5','RA000005','5000','50000','RB153694C'),
    ('350','9750','6','RA000006','2.00','6','RA000006','1000','10000','KS459037D'),
    ('500','2750','7','RA000007','6.00','7','RA000007','6000','60000','CN953687'),
    ('600','6750','8','RA000008','3.00','8','RA000008','6000','70000','AG671006A'),
    ('800','4750','9','RA000009','8.00','9','RA000009','1000','10000','NZ873662'),
    ('380','2750','10','RA000010','15.00','10','RA000010','7000','70000','YT428556A'),
    ('390','7350','11','RA000011','65.00','11','RA000011','8000','80000','HG747890'),
    ('370','7530','12','RA000012','55.00','12','RA000012','9000','90000','WW680475B'),
    ('360','7502','13','RA000013','85.00','13','RA000013','1000','10000','WE486863D'),
    ('360','7504','14','RA000014','25.00','14','RA000014','10000','120000','BA660327'),
    ('380','7501','15','RA000015','56.00','15','RA000015','10000','130000','RW874927B')

GO

-- CREATING TABLE 34 - LandlordType  --
  CREATE TABLE LandlordType(
    LTRecordID int IDENTITY(1,1),
    LandlordTypeID AS CAST('LT' + RIGHT('00000' + CAST(LTRecordID AS VARCHAR(6)), 6) AS CHAR(8)) PERSISTED,
    LandlordType Varchar(15),
    PRIMARY KEY (LTRecordID, LandlordTypeID),
    CONSTRAINT CHK_LandlordTypeID CHECK (LEN(LandlordTypeID) = 8)
  )

  GO

-- INSERTING INTO TABLE 34 - LandlordType --
INSERT INTO LandlordType(LandlordType) VALUES
  ('Single Property Landlord'),
  ('Multiple Property Landlord')

GO

-- CREATING TABLE 35 - LandlordContact  --
  CREATE TABLE LandlordContact(
    NationalInsuranceNumber Varchar(9),
    ltLTRecordID int Not Null,
    ltLandlordTypeID char(8) Not Null,
    EmailAddress Varchar(50),
    laddLADDRecordID int Not Null,
    laddLocationAddressID char(8) Not Null,
    PRIMARY KEY (NationalInsuranceNumber),
    CONSTRAINT FK_LC_LTRecordID_LandlordTypeID FOREIGN KEY (ltLTRecordID, ltLandlordTypeID) REFERENCES LandlordType(LTRecordID, LandlordTypeID),
    CONSTRAINT FK_LC_LADDRecordID_LocationAddressID FOREIGN KEY (laddLADDRecordID, laddLocationAddressID) REFERENCES LocationAddress(LADDRecordID, LocationAddressID),
    CONSTRAINT CHK_LC_EmailAddress CHECK (EmailAddress LIKE '%_@_%_.__%')
  )ON Landlord_Filegroup2

  GO

-- INSERTING INTO TABLE 35 - LandlordContact  --
  INSERT INTO LandlordContact(NationalInsuranceNumber,ltLTRecordID,ltLandlordTypeID,EmailAddress) VALUES
    ('WGq8i6jvB','2','LT000002','andersbr@aol.com'),
    ('sQ4RGxNPx','1','LT000001','lstein@icloud.com'),
    ('DQb0qr5an','1','LT000001','dowdy@hotmail.com'),
    ('VulLXxlYN','2','LT000002','stecoop@yahoo.ca'),
    ('PgnU0q8e9','2','LT000002','kuparine@gmail.com'),
    ('Ad5KNy3A0','2','LT000002','sthomas@outlook.com'),
    ('nRKX1RfBv','1','LT000001','inico@me.com'),
    ('jBhx1QN03','1','LT000001','goresky@live.com')




  GO

-- CREATING TABLE 36 - LandlordMobileNumber  --
  CREATE TABLE LandlordMobileNumber(
    lcNationalInsuranceNumber Varchar(9) not null,
    MobileNumber Char(11) Not Null,
    PRIMARY KEY (lcNationalInsuranceNumber,MobileNumber),
    CONSTRAINT FK_LMN_lcNationalInsuranceNumber FOREIGN KEY (lcNationalInsuranceNumber) REFERENCES LandlordContact(NationalInsuranceNumber),
    CONSTRAINT CHK_LMN_MobileNumber CHECK (MobileNumber LIKE '[0-9][0-9][0-9][0-9][.-][0-9][0-9][0-9][0-9][0-9][0-9]')
  )ON Landlord_Filegroup2


  GO

-- INSERTING INTO TABLE 36 - LandlordMobileNumber --
INSERT INTO LandlordMobileNumber(lcNationalInsuranceNumber,MobileNumber) VALUES
  ('WGq8i6jvB','7700-900891'),
  ('sQ4RGxNPx','7700-900005'),
  ('DQb0qr5an','7700-900260'),
  ('VulLXxlYN','7700-900610'),
  ('PgnU0q8e9','7700-900814'),
  ('Ad5KNy3A0','7700-900860'),
  ('nRKX1RfBv','8081-570108'),
  ('jBhx1QN03','8081-570623'),
  ('YJCuvd2NU','8081-570695'),
  ('uGRKcNEOq','8081-570889'),
  ('ARW6WsLqo','8081-570417'),
  ('pcsstucci','8081-570438'),
  ('Trx8JTFbt','3069-990169'),
  ('4uUzgl8Co','3069-990389'),
  ('SuYLWr3Ns','3069-990941')

  GO

-- CREATING TABLE 37 - LandlordTelephoneNumber  --
  CREATE TABLE LandlordTelephoneNumber(
    lcNationalInsuranceNumber Varchar(9) not null,
    TelephoneNumber Char(11) Not Null,
    PRIMARY KEY (lcNationalInsuranceNumber,TelephoneNumber),
    CONSTRAINT FK_LTN_lcNationalInsuranceNumber FOREIGN KEY (lcNationalInsuranceNumber) REFERENCES LandlordContact(NationalInsuranceNumber),
    CONSTRAINT CHK_LTN_TelephoneNumber CHECK (TelephoneNumber LIKE '[0-9][0-9][0-9][0-9][.-][0-9][0-9][0-9][0-9][0-9][0-9]')
  )ON Landlord_Filegroup2

  GO

-- INSERTING INTO TABLE 37 - LandlordTelephoneNumber --
  INSERT INTO LandlordTelephoneNumber (lcNationalInsuranceNumber,TelephoneNumber) VALUES
  ('WGq8i6jvB','3069-990418'),
  ('sQ4RGxNPx','3069-990193'),
  ('DQb0qr5an','3069-990797'),
  ('VulLXxlYN','9098-790798'),
  ('PgnU0q8e9','9098-790622'),
  ('Ad5KNy3A0','9098-790281'),
  ('nRKX1RfBv','9098-790331'),
  ('jBhx1QN03','9098-790262'),
  ('YJCuvd2NU','9098-790504'),
  ('uGRKcNEOq','1914-980946'),
  ('ARW6WsLqo','1914-980609'),
  ('pcsstucci','1914-980089'),
  ('Trx8JTFbt','1914-980341'),
  ('4uUzgl8Co','1914-980750'),
  ('SuYLWr3Ns','1914-980882')


  GO

-- CREATING TABLE 38 - SinglePropertyLandlord  --
  CREATE TABLE SinglePropertyLandlord(
    SPLRecordID int IDENTITY(1,1),
    SPLandlordID AS CAST('SPL' + RIGHT('0000' + CAST(SPLRecordID AS VARCHAR(6)), 6) AS CHAR(8)) PERSISTED,
    lcNationalInsuranceNumber Varchar(9)  Not Null,
    msMSRecordID int Not Null,
    msMembershipStatusID CHAR(8) Not Null,
    FirstName Varchar(20),
    MiddleName Varchar(20),
    LastName Varchar(20),
    csCSRecordID int Not Null ,
    csEmployeeID_RegisteredBy CHAR(8) Not Null,
    RegistrationDateTime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    slSLRecordID int Not Null ,
    slSystemLoginID CHAR(8) Not Null,
    PRIMARY KEY (SPLRecordID, SPLandlordID),
    CONSTRAINT FK_SPL_NationalInsuranceNumber FOREIGN KEY (lcNationalInsuranceNumber)
    REFERENCES LandlordContact(NationalInsuranceNumber),
    CONSTRAINT FK_SPL_MSRecordID_MembershipStatusID FOREIGN KEY (msMSRecordID, msMembershipStatusID)
    REFERENCES MemebershipStatus(MSRecordID, MembershipStatusID),
    CONSTRAINT FK_SPL_CSRecordID_EmployeeID_RegisteredBy FOREIGN KEY (csCSRecordID, csEmployeeID_RegisteredBy)
    REFERENCES CustomerService(CSRecordID, EmployeeID),
    CONSTRAINT FK_SPL_SLRecordID_SystemLoginID FOREIGN KEY (slSLRecordID, slSystemLoginID)
    REFERENCES SystemLogin(SLRecordID, SystemLoginID),
    CONSTRAINT CHK_SPL_SPLandlordID CHECK (LEN(SPLandlordID) = 8)
  )ON Landlord_Filegroup2

  GO

-- INSERTING INTO TABLE 38 - SinglePropertyLandlord --
  INSERT INTO SinglePropertyLandlord (lcNationalInsuranceNumber, msMSRecordID, msMembershipStatusID, FirstName, MiddleName,
    LastName, csCSRecordID, csEmployeeID_RegisteredBy, RegistrationDateTime, slSLRecordID, slSystemLoginID) VALUES
    ('sQ4RGxNPx','1','MS000001','Darragh','Phillippa','Welsh','2','EMP00002','','3','SL000003'),
    ('DQb0qr5an','1','MS000001','Brendon','Mata','Conley','3','EMP00003','2018-11-11 13:23:44','7','SL000007'),
    ('nRKX1RfBv','1','MS000001','Dwayne','Madeline','Holt','5','EMP00005','2107-11-11 13:23:44','11','SL000011'),
    ('jBhx1QN03','1','MS000001','Isadora','Kenzie','Salt','6','EMP00006','2019-11-11 13:23:44','15','SL000015')



  GO

  -- CREATING TABLE 39 - MultiplePropertyLandlord  --
    CREATE TABLE MultiplePropertyLandlord(
      MPLRecordID int IDENTITY(1,1),
      MPLandlordID AS CAST('SPL' + RIGHT('0000' + CAST(SPLRecordID AS VARCHAR(6)), 6) AS CHAR(8)) PERSISTED,
      lcNationalInsuranceNumber Varchar(9)  Not Null,
      NoOfPropertiesOwned int not null,
      NoOfPropertiesRented int not null,
      NoOfPropertiesAvailable int not null,
      msMSRecordID int Not Null,
      msMembershipStatusID CHAR(8) Not Null,
      FirstName Varchar(20),
      MiddleName Varchar(20),
      LastName Varchar(20),
      csCSRecordID int Not Null ,
      csEmployeeID_RegisteredBy CHAR(8) Not Null,
      RegistrationDateTime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
      slSLRecordID int Not Null ,
      slSystemLoginID CHAR(8) Not Null,
      PRIMARY KEY (MPLRecordID, MPLandlordID),
      CONSTRAINT FK_MPL_NationalInsuranceNumber FOREIGN KEY (lcNationalInsuranceNumber)
      REFERENCES LandlordContact(NationalInsuranceNumber),
      CONSTRAINT FK_MPL_MSRecordID_MembershipStatusID FOREIGN KEY (msMSRecordID, msMembershipStatusID)
      REFERENCES MemebershipStatus(MSRecordID,MembershipStatusID),
      CONSTRAINT FK_MPL_CSRecordID_EmployeeID_RegisteredBy FOREIGN KEY (csCSRecordID, csEmployeeID_RegisteredBy)
      REFERENCES CustomerService(CSRecordID, EmployeeID),
      CONSTRAINT FK_MPL_SLRecordID_SystemLoginID FOREIGN KEY (slSLRecordID, slSystemLoginID)
      REFERENCES SystemLogin(SLRecordID,SystemLoginID),
      CONSTRAINT CHK_MPL_MPLandlordID CHECK (LEN(MPLandlordID) = 8)
    )ON Landlord_Filegroup2

    GO

  -- INSERTING INTO TABLE 38 -MultiplePropertyLandlord--
    INSERT INTO MultiplePropertyLandlord(lcNationalInsuranceNumber, msMSRecordID, msMembershipStatusID, FirstName, MiddleName,
      LastName, csCSRecordID, csEmployeeID_RegisteredBy, RegistrationDateTime, slSLRecordID, slSystemLoginID) VALUES
      ('WGq8i6jvB','1','MS000001','Darragh','Phillippa','Welsh','2','EMP00002','','4','SL000004'),
      ('VulLXxlYN','1','MS000001','Brendon','Mata','Conley','3','EMP00003','2018-11-11 13:23:44','8','SL000008'),
      ('PgnU0q8e9','1','MS000001','Dwayne','Madeline','Holt','5','EMP00005','2107-11-11 13:23:44','12','SL000012'),
      ('Ad5KNy3A0','1','MS000001','Isadora','Kenzie','Salt','6','EMP00006','2019-11-11 13:23:44','16','SL000016')



  GO

-- CREATING TABLE 40 - ViewingDetails  --
  CREATE TABLE ViewingDetails(
    VDRecordID int IDENTITY(1,1),
    ViewingID AS CAST('VD' + RIGHT('00000' + CAST(VDRecordID AS VARCHAR(6)), 6) AS CHAR(8)) PERSISTED,
    ViewingDateTime DateTime,
    lcNationalInsurranceNumber_AssignedBy Varchar(9),
    PRIMARY KEY (VDRecordID, ViewingID),
    CONSTRAINT FK_VD_NationalInsuranceNumber FOREIGN KEY (lcNationalInsurranceNumber_AssignedBy) REFERENCES LandlordContact(NationalInsuranceNumber)
  )ON ViewingProperty_Filegroup7

  GO

-- INSERTING INTO TABLE 40 - ViewingDetails --
  INSERT INTO ViewingDetails(ViewingDateTime,lcNationalInsurranceNumber_AssignedBy) VALUES
    ('2018-01-13 12:23:44','WGq8i6jvB'),
    ('2019-11-11 13:23:44','sQ4RGxNPx'),
    ('2019-12-11 14:23:44','DQb0qr5an'),
    ('2019-11-11 15:23:44','VulLXxlYN'),
    ('2018-01-13 12:23:44','PgnU0q8e9'),
    ('2019-11-11 13:23:44','Ad5KNy3A0'),
    ('2019-12-11 14:23:44','nRKX1RfBv'),
    ('2019-11-11 15:23:44','jBhx1QN03')

  GO

-- CREATING TABLE 41 - ViewingDetailsInvolvedStudents  --
  CREATE TABLE ViewingDetailsInvolvedStudents(
    vdVDRecordID int not null,
    ViewingID char(8) not null,
    sNationalInsuranceNumber_InvolvedStudents Varchar(9) not null,
    PRIMARY KEY (vdVDRecordID,ViewingID,sNationalInsuranceNumber_InvolvedStudents),
    CONSTRAINT FK_VDS_VDRecordID_ViewingID FOREIGN KEY (vdVDRecordID, vdViewingID)
    REFERENCES ViewingDetail(VDRecordID, ViewingID),
    CONSTRAINT FK_VDS_sNationalInsuranceNumber_InvolvedStudents FOREIGN KEY (sNationalInsuranceNumber_InvolvedStudents)
    REFERENCES StudentContact(NationalInsuranceNumber),
  )ON ViewingProperty_Filegroup7

  GO

-- INSERTING INTO TABLE 41 - ViewingDetailsInvolvedStudents --
  INSERT INTO ViewingDetailsInvolvedStudents(vdVDRecordID,ViewingID,sNationalInsuranceNumber_InvolvedStudents) VALUES
    ('1','VD000001','WB940276B'),
    ('2','VD000002','LP064709C'),
    ('3','VD000003','AG646231C'),
    ('4','VD000004','RW794588C'),
    ('5','VD000005','RB153694C'),
    ('6','VD000006','KS459037D'),
    ('7','VD000007','CN953687'),
    ('8','VD000008','AG671006A')

  GO

-- CREATING TABLE 42 - CustomerServiceModification  --
  CREATE TABLE CustomerServiceModification(
    CSMRecordID int IDENTITY(1,1),
    ModificationID AS CAST('CSM' + RIGHT('00000' + CAST(CSMRecordID AS VARCHAR(6),6)AS CHAR(8)) PERSISTED,
    Modification Varchar(50),
    PRIMARY Key(CSMRecordID, ModificationID),
    CONSTRAINT CHK_CSM_ModificationID CHECK (LEN(ModificationID)=8)
  )

  GO

-- INSERTING INTO TABLE 42 - CustomerServiceModification --
INSERT INTO CustomerServiceModification(Modification) VALUES
  ('Updated User’s CREDENTIALS'), --- <=======IDK
  ('Updated User’s Status'),
  ('Updated User’s '),
  ('Updated User’s Password')
  GO

-- CREATING TABLE 43 - CustomerService_Manage_SystemLogin  --
  CREATE TABLE CustomerService_Manage_SystemLogin(
    csCSRecordID int not null,
    csEmployeeID_EditedBy CHAR(8),
    slSLRecordID int,
    slSystemLoginID CHAR(8),
    csmCMSRecordID int NOT NULL,
    csmModificationID CHAR(8) NOT NULL,
    EditDateTime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(csCSRecordID,csEmployeeID_EditedBy,slSLRecordID,slSystemLoginID),
    CONSTRAINT FK_CSMSL_CSRecordID_EmployeeID_EditedBy FOREIGN KEY (csCSRecordID, csEmployeeID_EditedBy)
    REFERENCES CustomerService(CSRecordID, EmployeeID),
    CONSTRAINT FK_CSMSL_SLRecordID_SystemLoginID FOREIGN KEY(slSLRecordID, slSystemLoginID)
    REFERENCES SystemLogin(SLRecordID, SystemLoginID),
    CONSTRAINT FK_CSMSL_CSRecordID_ModificationID FOREIGN KEY(csmCMSRecordID, csmModificationID)
    REFERENCES CustomerServiceModification(CSMRecordID, ModificationID)
  )ON CustomerService_Filegroup1

  GO

  Insert INTO CustomerService_Manage_SystemLogin(csCSRecordID, csEmployeeID_EditedBy, SLRecordID, slSystemLoginID, csmCMSRecordID, csmModificationID) VALUES
  (1,'EMP00001',1,'SL000001',2,'CSM00002'),
  (4,'EMP00004',3,'SL000003',4,'CSM00004'),
  (2,'EMP00002',4,'SL000004',5,'CSM00005'),
  (6,'EMP00006',2,'SL000002',3,'CSM00003'),
  (3,'EMP00003',5,'SL000005',1,'CSM00001'),
  (7,'EMP00007',7,'SL000007',6,'CSM00006')

  GO

-- CREATING TABLE 44 - CustomerService_Manage_Student  --
  CREATE TABLE CustomerService_Manage_Student(
      csCSRecordID INT NOT NULL,
      csEmployeeID_EditedBy  VARCHAR(8) NOT NULL,
      sNationalInsuranceNumber VARCHAR(9) NOT NULL,
      csmCSMRecordID int NOT NULL,
      csmModificationID CHAR(8) NOT NULL,
      EditDateTime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
      PRIMARY KEY (csCSRecordID, csEmployeeID_EditedBy,sNationalInsuranceNumber),
      CONSTRAINT FK_CSMS_CSRecordID_EmployeeID_EditedBy FOREIGN KEY (csCSRecordID, csEmployeeID_EditedBy)
      REFERENCES CustomerService(CSRecordID, EmployeeID),
      CONSTRAINT FK_CSMS_sNationalInsuranceNumber FOREIGN KEY (sNationalInsuranceNumber)
      REFERENCES StudentContact(NationalInsuranceNumber),
      CONSTRAINT FK_CSMS_CSMRecordID_ModificationID FOREIGN KEY (csmCSMRecordID, csmModificationID)
      REFERENCES CustomerServiceModification(CSMRecordID, ModificationID)
  )ON CustomerService_Filegroup1

  GO

-- INSERTING INTO TABLE 44 - CustomerService_Manage_Student --
INSERT INTO CustomerService_Manage_Student(csCSRecordID,csEmployeeID_EditedBy,sNationalInsuranceNumber,csmCSMRecordID,csmModificationID,EditDateTime) VALUES
  ('1','EMP00001','WB940276B','1','CSM00001','2019-10-11 13:23:44'),
  ('2','EMP00002','LP064709C','2','CSM00002',''),
  ('3','EMP00003','AG646231C','3','CSM00003',''),
  ('4','EMP00004','RW794588C','4','CSM00004',''),
  ('1','EMP00001','RB153694C','5','CSM00005','2019-11-11 13:23:44'),
  ('2','EMP00002','KS459037D','6','CSM00006',''),
  ('10','EMP00010','CN953687','7','CSM00007',''),
  ('12','EMP00012','AG671006A','8','CSM00008',''),
  ('1','EMP00001','NZ873662','9','CSM00009','2019-12-11 13:23:44'),
  ('10','EMP00010','YT428556A','10','CSM00010',''),
  ('13','EMP00013','HG747890','11','CSM00011',''),
  ('14','EMP00014','WW680475B','12','CSM00012','2019-12-11 13:23:44'),
  ('6','EMP00006','WE486863D','13','CSM00013',''),
  ('1','EMP00001','BA660327','14','CSM00014','2019-06-11 13:23:44'),
  ('2','EMP00002','RW874927B','15','CSM00015','')

  GO

-- CREATING TABLE 45 - CustomerService_Manage_Landlord  --
  CREATE TABLE CustomerService_Manage_Landlord(
    csCSRecordID int not null,
    csEmployeeID_EditedBy Varchar(8) not null,
    INationalInsuranceNumber varchar(9) not null,
    csmCSMRecordID int not null,
    csmModificationID char(8) not null,
    EditDateTime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(csCSRecordID,csEmployeeID_EditedBy,INationalInsuranceNumber),
    CONSTRAINT FK_CSML_CSRecordID_csEmployeeID_EditedBy FOREIGN KEY (csCSRecordID, csEmployeeID_EditedBy)
    REFERENCES CustomerService(CSRecordID, EmployeeID),
    CONSTRAINT FK_CSML_sNationalInsuranceNumber FOREIGN KEY (INationalInsuranceNumber)
    REFERENCES LandlordContact(NationalInsuranceNumber),
    CONSTRAINT FK_CSML_CSMRecordID_ModifcationID FOREIGN KEY (csmCMSRecordID, csmModificationID)
    REFERENCES CustomerServiceModification(CSMRecordID, ModificationID)
  )ON CustomerService_Filegroup1

  GO

-- INSERTING INTO TABLE 45 - CustomerService_Manage_Landlord --
Insert INTO CustomerService_Manage_Landlord(csCSRecordID, csCSEmployeeID_EditedBy, INationalInsuranceNumber, csmCMSRecordID, csmModificationID) VALUES
('LT000001','EMP00005','LP064709C',3,'CSM00001'),
('LT000001','EMP00002','RW794588C',1,'CSM00002'),
('LT000002','EMP00006','RB153694C',4,'CSM00003'),
('LT000002','EMP00004','KS459037D',2,'CSM00004'),
('LT000001','EMP00003','AG646231C',5,'CSM00005')

  GO

-- CREATING TABLE 46 - CustomerService_Manage_Property  --
  CREATE TABLE CustomerService_Manage_Property(
  csCSRecordID int NOT NULL,
  csEmployeeID_EditedBy char(8) not null,
  pPRecordID int not null,
  pPropertyID char(8) not null,
  csmCSMRecordID int not null,
  csmModificationID char(8),
  EditDateTime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY Key(csCSRecordID, csEmployeeID_EditedBy, pPRecordID, pPropertyID),
  CONSTRAINT FK_CSMP_CSRecordID_EmployeeID_EditedBy FOREIGN KEY (csCSRecordID, csEmployeeID_EditedBy)
  REFERENCES CustomerService(CSRecordID, EmployeeID),
  CONSTRAINT FK_CSMP_PRecordID_PropertyID FOREIGN KEY (pPRecordID,pPropertyID)
  REFERENCES Property(PRecordID, PropertyID),
  CONSTRAINT FK_CSMP_CSMRecordID_ModificationID FOREIGN KEY (csmCSMRecordID, csmModificationID)
  REFERENCES Property(CSMRecordID, ModificationID)
  )ON CustomerService_Filegroup1

  GO

-- INSERTING INTO TABLE 46 - CustomerService_Manage_Property --
Insert INTO CustomerService_Manage_Landlord(csCSRecordID, csEmployeeID_EditedBy,pPRecordID, pPropertyID, csmCSMRecordID,csmModificationID,EditDateTime) VALUES
('1','EMP00001','1','P0000001','1','CSM00001','2019-12-11 13:23:44'),
('1','EMP00001','2','P0000002','1','CSM00001',''),
('2','EMP00002','3','P0000003','2','CSM00002',''),
('3','EMP00003','4','P0000004','3','CSM00003','2019-12-11 13:23:44'),
('4','EMP00004','5','P0000005','1','CSM00001',''),
('4','EMP00004','6','P0000006','1','CSM00001',''),
('5','EMP00005','7','P0000007','5','CSM00005','2019-12-11 13:23:44'),
('5','EMP00005','8','P0000008','6','CSM00006',''),
('5','EMP00005','9','P0000009','1','CSM00001','2019-12-11 13:23:44'),
('10','EMP00010','10','P0000010','2','CSM00002',''),
('8','EMP00008','11','P0000011','1','CSM00001',''),
('7','EMP00007','12','P0000012','2','CSM00002','2019-12-11 13:23:44'),
('8','EMP00008','13','P0000013','3','CSM00003',''),
('2','EMP00002','14','P0000014','2','CSM00002',''),
('6','EMP00006','15','P0000015','2','CSM00002','2019-12-11 13:23:44')

  GO

-- CREATING TABLE 47 - CustomerService_VerifyStudentEnrollment_University  --
  CREATE TABLE CustomerService_VerifyStudentEnrollment_University(
    csCSRecordID INT NOT NULL,
    csEmployeeID_VerifiedBy CHAR(8) NOT NULL,
    uURecordID INT NOT NULL,
    ucUniversityID CHAR(8) NOT NULL,
    VerificationDateTime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (csEmployeeID_VerifiedBy,ucUniversityID),
    CONSTRAINT FK_CVSEU_CSRecordID_EmployeeID_VerifiedBy FOREIGN KEY (csCSRecordID, csEmployeeID_VerifiedBy) REFERENCES CustomerService(CSRecordID, EmployeeID),
    CONSTRAINT FK_CVSEU_URecordID_UniversityID FOREIGN KEY (uURecordID, ucUniversityID) REFERENCES UniversityContact(uURecordID, UniversityID)
  )ON CustomerService_Filegroup1

  GO

-- INSERTING INTO TABLE 47 - CustomerService_VerifyStudentEnrollment --
  INSERT INTO CustomerService_VerifyStudentEnrollment(csEmployeeID_VerifiedBy,ucUniversityID,VerificationDateTime) VALUES  --need to add comments
  ('EMP00001','OU','2019-01-17'),--check the parent table for values
  ('EMP00003','UCL','2018-02-15'),
  ('EMP00004','CAM','2018-05-13'),
  ('EMP00006','CAM','2018-03-15'),
  ('EMP00034','PU','2020-01-01'),
  ('EMP00032','PU',''),--check the parent table for values
  ('EMP00039','UCL','2018-11-02'),
  ('EMP00021','CAM',''),
  ('EMP00020','PU',''),
  ('EMP00022','OU','2017-03-23'),
  ('EMP00010','OU','2018-11-30'),--check the parent table for values
  ('EMP00003','UCL',''),
  ('EMP00004','CAM','2019-11-20'),
  ('EMP00006','PU','2019-10-20'),
  ('EMP00033','PU','2018-12-15')


  Go

-- CREATING TABLE 48 - RequestViewing --
  CREATE TABLE RequestViewing(
    scNationalInsuranceNumber_RequestedBy CHAR(9) NOT NULL,
    pPRecordID INT NOT NULL
    pPropertyID CHAR(8) NOT NULL,
    csEmployeeID CHAR(8),
    csCSRecordID int,
    RequestedDateTime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (scNationalInsuranceNumber_RequestedBy,pPropertyID),
    CONSTRAINT FK_RV_NationalInsuranceNumbee FOREIGN KEY (scNationalInsuranceNumber_RequestedBy) REFERENCES LocationAddress(LocationAddressID),
    CONSTRAINT FK_RV_PRecordID_PropertyID FOREIGN KEY (pPRecordID, pPropertyID) REFERENCES Property(PRecordID, PropertyID),
    CONSTRAINT FK_RV_EmployeeID FOREIGN KEY (csEmployeeID, csCSRecordID) REFERENCES CustomerService(EmployeeID, CSRecordID)
  )ON ViewingProperty_Filegroup7

  GO

-- INSERTING INTO TABLE 48 - RequestViewing  --
  INSERT INTO RequestViewing(scNationalInsuranceNumber_RequestedBy,pPRecordID,pPropertyID,csCSRecordID,csEmployeeID) VALUES  --need to add comments
  ('LA000001',3 ,'P0000006',3 ,'EMP00003'),--check the parent table for values
  ('LA000002','P0000004',9,'EMP00009'),
  ('LA000003','P00000005',4,'EMP00004'),
  ('LA000004','P0000008',5,'EMP00005'),--check the parent table for values
  ('LA000005','P0000007',2,'EMP00002'),
  ('LA000006','P0000011',8,'EMP00008')


  GO

-- CREATING TABLE 49 - CustomerService_AlertRequestingView_LandLord  --
  CREATE TABLE CustomerService_AlertRequestingView_LandLord(
    csCSRecordID INT NOT NULL,
    csEmployeeID_AlertedBY char(8) NOT NULL,
    lcNationalInsuranceNumber char(8) NOT NULL,
    AlertDateTime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (csEmployeeID_AlertedBY,lcNationalInsuranceNumber),
    CONSTRAINT FK_CSARVL_CSRecordID_EmployeeID FOREIGN KEY (csCSRecordID, csEmployeeID_AlertedBY) REFERENCES CustomerService(CSRecordID, EmployeeID),
    CONSTRAINT FK_CSARVL_NINumber FOREIGN KEY (lcNationalInsuranceNumber) REFERENCES LandlordContact(NationalInsuranceNumber)
  )ON CustomerService_Filegroup1

  GO

-- INSERTING INTO TABLE 49 - CustomerService_AlertRequestingView_Landlord  --
  INSERT INTO CustomerService_AlertRequestingView_Landlord(csEmployeeID_AlertedBy,lcNationalInsuranceNumber) VALUES
  ('EMP00000', 'AG646231C'),
  ('EMP00001', 'LP064709C'),
  ('EMP00002', 'WB940276B'),
  ('EMP00003', 'RW794588C'),
  ('EMP00004', 'RB153694C'),
  ('EMP00005', 'KS459037D'),
  ('EMP00006', 'CN953687C'),
  ('EMP00007', 'AG671006A'),
  ('EMP00008', 'NZ873662D'),
  ('EMP00009', 'YT428556A'),
  ('EMP00010', 'HG747890A'),
  ('EMP00011', 'WW680475B'),
  ('EMP00012', 'WE486863D'),
  ('EMP00013', 'BA660327B'),
  ('EMP00014', 'RW874927B')


  GO

-- CREATING TABLE 50 - ViewingProperty  --
  CREATE TABLE ViewingProperty(
    scNationalInsuranceNumber varchar(9),
    pPropertyID char(8),
    vdViewingID char(8),
    PRIMARY KEY (pPropertyID,scNationalInsuranceNumber,vdViewingID),
    CONSTRAINT FK_VP_NINumber FOREIGN KEY (scNationalInsuranceNumber) REFERENCES StudentType(StudentContact),
    CONSTRAINT FK_VP_PropertyID FOREIGN KEY (pPropertyID) REFERENCES StudentType(Property),
    CONSTRAINT FK_VP_ViewingID FOREIGN KEY (vdViewingID) REFERENCES StudentType(ViewingDetails)
  )ON ViewingProperty_Filegroup7

  GO

-- INSERTING INTO TABLE 50 - ViewingProperty  --
  INSERT INTO ViewingProperty(scNationalInsuranceNumber,pPropertyID,vdViewingID) VALUES
  ('WB940276B','P0000001', 'V0000001'),
  ('LP064709C','P0000002', 'V0000002'),
  ('AG646231C','P0000003', 'V0000003'),
  ('RW794588C','P0000004', 'V0000004'),
  ('RB153694C','P0000005', 'V0000005'),
  ('KS459037D','P0000006', 'V0000006'),
  ('CN953687','P0000007', 'V0000007'),
  ('AG671006A','P0000008', 'V0000008'),
  ('NZ873662','P0000009', 'V0000009'),
  ('YT428556A','P0000010', 'V0000010'),
  ('HG747890','P0000011', 'V0000011'),
  ('WW680475B','P0000012', 'V0000012'),
  ('WE486863D','P0000013', 'V0000013'),
  ('BA660327','P0000014', 'V0000014'),
  ('RW874927B','P0000015', 'V0000015')



  GO

-- CREATING TABLE 51 - RPRegistrationFeeStatus  --
  CREATE TABLE RPRegistrationFeeStatus(
    RPRPSRecordID INT IDENTITY(1,1),
    RegistrationFeeStatusID AS CAST('RFS' + RIGHT('00000' + CAST(VDRecord AS VARCHAR(5)), 5) AS CHAR(8)) PERSISTED,
    RegistrationFeeStatus VARCHAR(15),
    PRIMARY KEY (RPRPSRecordID, RegistrationFeeStatusID)
  )

  GO

-- INSERTING INTO TABLE 51 - RPRegistrationFeeStatus  --
  INSERT INTO RPRegistrationFeeStatus (RegistrationFeeStatus) VALUES
  ('Complete'),   -- RPRPSRecordID: RFS00001
  ('Pending'),    -- RPRPSRecordID: RFS00002
  ('Denined')     -- RPRPSRecordID: RFS00003

  GO

-- CREATING TABLE 52 - RegisterProperty  --
  CREATE TABLE RegisterProperty(
    csCSRecordID INT IDENTITY(1,1),
    csEmployeeID_RegisteredBy CHAR(8) NOT NULL,
    lNationalInsuranceNumber VARCHAR(9) NOT NULL,
    pPRecordID INT NOT NULL,
    pPropertyID CHAR(8) NOT NULL,
    RRecordID INT NOT NULL,
    RegistrationID CHAR(8) AS CAST('RP' + RIGHT('000000' + CAST(RRecordID AS VARCHAR(6)), 6) AS CHAR(8)) PERSISTED
    rprfsRPRFSRecordID INT NOT NULL,
    rprfsRegistrationFeeStatusID CHAR(8) NOT NULL,
    PRIMARY KEY (csCSRecordID, csEmployeeID_RegisteredBy, lNationalInsuranceNumber, pPRecordID, pPropertyID, RRecordID, RegistrationID),
    CONSTRAINT FK_RP_CSRecordID_EmployeeID FOREIGN KEY (csCSRecordID, csEmployeeID_RegisteredBy)
    REFERENCES CustomerService(CSRecordID, EmployeeID),
    CONSTRAINT FK_RP_NationalInsuranceNumber FOREIGN KEY (lNationalInsuranceNumber)
    REFERENCES Landlord(NationalInsuranceNumber),
    CONSTRAINT FK_RP_pPRecordID_pPropertyID FOREIGN KEY (pPRecordID, pPropertyID)
    REFERENCES Property(PRecordID, PropertyID),
    CONSTRAINT FK_RP_RPRFSRecordID_RegistrationFeeStatusID FOREIGN KEY (rprfsRPRFSRecordID, rprfsRegistrationFeeStatusID)
    REFERENCES RPRegistrationFeeStatus(RPRPSRecordID, RegistrationFeeStatusID)
  )ON Property_Filegroup3

  GO

-- INSERTING INTO TABLE 52 - RegisterProperty  --
INSERT INTO RegisterProperty(csEmployeeID_RegisteredBY, INationalInsuranceNumber, pPRecordID, pPropertyID, RRecordID, rprfsRPRFSRecordID,RPRegistrationFeeStatus) VALUES
('EMP00005','sQ4RGxNPx',3,'P0000003','RFS00002','Pending'),
('EMP00011','VulLXxlYN',6,'P0000006','RFS00003','Denined'),
('EMP00003','Ad5KNy3A0',8,'P0000008','RFS00001','Complete'),
('EMP00002','jBhx1QN03',4,'P0000004','RFS00002','Pending'),
('EMP00010','DQb0qr5an',2,'P0000002','RFS00001','Complete'),
('EMP00012','nRKX1RfBv',7,'P0000007','RFS00003','Denined'),
('EMP00004','PgnU0q8e9',1,'P0000001','RFS00001','Complete')

  GO

-- CREATING TABLE 53 - RegisteredProperty  --
  CREATE TABLE RegisteredProperty(
    RDPRecordID INT IDENTITY(1,1),
    RegistrateredPropertyID AS CAST('RDP' + RIGHT('00000' + CAST(RDPRecordID AS VARCHAR(5)), 5) AS CHAR(8)) PERSISTED,
    rpRRecordID INT NOT NULL,
    rpRegistrationID CHAR(8) NOT NULL
    RegistrationFee MONEY NOT NULL,
    RegistrationDateTime DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (RDPRecordID, RegistrateredPropertyID),
    CONSTRAINT FK_RDP_RRecordID_RegistrationID  FOREIGN KEY (rpRRecordID, rpRegistrationID) REFERENCES RegisterProperty(RRecordID, RegistrationID)
  )ON Property_Filegroup3

  GO

-- INSERTING INTO TABLE 53 - RegisteredProperty  --
INSERT INTO RegisteredProperty(rpRRecordID, rpRegistrationID, RegistrationFee) VALUES
(6,'RP000002',3000),
(7,'RP000006',1500),
(1,'RP000007',3500),
(4,'RP000004',2550),
(8,'RP000003',1250),
(2,'RP000005',4500)
