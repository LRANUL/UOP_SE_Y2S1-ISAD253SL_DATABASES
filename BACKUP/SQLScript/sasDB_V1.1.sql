-- Creating a new database, named sasDB (Student Accommodation Service Database)
CREATE DATABASE sasDB

GO

-- CREATING TABLE 1 - CustomerService --
CREATE TABLE CustomerService (
  CSRecordID INT IDENTITY(1,1),
  EmployeeID AS CAST('EMP' + RIGHT('00000' + CAST(EMPRecordID AS VARCHAR(6)), 6) AS CHAR(8)) PERSISTED,
  FirstName VARCHAR(20) NOT NULL,
  MiddleName VARCHAR(25),
  LastName VARCHAR(30) NOT NULL,
  EmailAddress VARCHAR(50) NOT NULL,
  TelephoneNumber CHAR(11) NOT NULL UNIQUE, -- advise user to insert in regional format 0123-456789
  PRIMARY KEY (EmployeeID),
  CONSTRAINT CHK_EmailAddress CHECK (EmailAddress LIKE '%_@_%_.__%'), -- check for @ sign and subdomains such as .co.uk
  CONSTRAINT CHK_TelephoneNumber CHECK (TelephoneNumber LIKE '[0-9][0-9][0-9][0-9][.-][0-9][0-9][0-9][0-9][0-9][0-9]')
)

GO

-- INSERTING DATA TO TABLE 1 - CustomerService --
INSERT INTO CustomerService (FirstName, MiddleName, LastName, EmailAddress, TelephoneNumber) VALUES
('Celesta', 'Bari', 'Micallef', 'bmicallef0@ycombinator.com', '7787-543922'),      -- EmployeeID: EMP000001
('Oralie', 'Dari', 'Isworth', 'disworth1@stanford.edu', '2673-947663'),            -- EmployeeID: EMP000002
('Kaylee', 'Nikita', 'O''Dougherty', 'nodougherty2@economist.com', '4338-752126'), -- EmployeeID: EMP000003
('Verge', 'Garwin', 'Heggadon', 'gheggadon3@wordpress.com', '1929-276548'),        -- EmployeeID: EMP000004
('Celinda', 'Kathleen', 'Sloan', 'ksloan4@msu.edu', '4489-554326'),                -- EmployeeID: EMP000005
('Markos', 'Nisse', 'Shadbolt', 'nshadbolt5@biglobe.ne.jp', '9908-253740'),        -- EmployeeID: EMP000006
('Ailey', 'Norrie', 'Bonafant', 'nbonafant6@java.com', '4728-883503'),             -- EmployeeID: EMP000007
('Shay', 'Cynthy', 'Ivanichev', 'civanichev7@statcounter.com', '5814-215200'),     -- EmployeeID: EMP000008
('Fons', 'Terrijo', 'Pask', 'tpask8@paginegialle.it', '1089-248086'),              -- EmployeeID: EMP000009
('Averill', 'Engracia', 'Skippon', 'eskippon9@printfriendly.com', '5889-012700'),  -- EmployeeID: EMP000010
('Darwin', 'Rowena', 'Lindop', 'rlindopa@wufoo.com', '2976-146644'),               -- EmployeeID: EMP000011
('Damon', 'Arty', 'Whellans', 'awhellansb@flavors.me', '9942-498260'),             -- EmployeeID: EMP000012
('Gery', 'Norma', 'Beverage', 'nbeveragec@youtu.be', '2846-705385'),               -- EmployeeID: EMP000013
('Danna', 'Teirtza', 'Colt', 'tcoltd@nps.gov', '8353-569459'),                     -- EmployeeID: EMP000014
('Lothaire', 'Eimile', 'McLafferty', 'emclaffertye@tinypic.com', '4977-203145'),   -- EmployeeID: EMP000015
('Luca', 'Wyn', 'Cansdill', 'wcansdillf@sina.com.cn', '5746-022216'),              -- EmployeeID: EMP000016
('Deerdre', 'Monique', 'Gellately', 'mgellatelyg@apache.org', '3091-246266'),      -- EmployeeID: EMP000017
('Michelina', 'Hans', 'Creevy', 'hcreevyh@dmoz.org', '9911-122428'),               -- EmployeeID: EMP000018
('Brand', 'Pierson', 'Littledyke', 'plittledykei@parallels.com', '7757-782152'),   -- EmployeeID: EMP000019
('Brig', 'Eda', 'Szymonwicz', 'eszymonwiczj@pbs.org', '7371-183264'),              -- EmployeeID: EMP000020
('Mycah', 'Efren', 'Mayze', 'emayzek@mlb.com', '5893-779984'),                     -- EmployeeID: EMP000021
('Christalle', 'Lynn', 'Goldstraw', 'lgoldstrawl@facebook.com', '1291-758014'),    -- EmployeeID: EMP000022
('Humphrey', 'Rem', 'Tournie', 'rtourniem@exblog.jp', '9851-100823'),              -- EmployeeID: EMP000023
('Merci', 'Dewie', 'Haymes', 'dhaymesn@patch.com', '4817-103149'),                 -- EmployeeID: EMP000024
('Tarah', 'Lisha', 'Prowting', 'lprowtingo@shutterfly.com', '9088-420005'),        -- EmployeeID: EMP000025
('Rodney', 'Jeanna', 'Shenfisch', 'jshenfischp@wix.com', '7535-287902'),           -- EmployeeID: EMP000026
('Thedrick', 'Franklin', 'Noorwood', 'fnoorwoodq@wordpress.com', '3795-189734'),   -- EmployeeID: EMP000027
('Baryram', 'Cathe', 'Mayho', 'cmayhor@blogs.com', '5334-164390'),                 -- EmployeeID: EMP000028
('Sallyanne', 'Geri', 'Blackham', 'gblackhams@yale.edu', '5386-979695'),           -- EmployeeID: EMP000029
('Lesya', 'Cathi', 'Von Brook', 'cvonbrookt@mail.ru', '8312-188560'),              -- EmployeeID: EMP000030
('Dick', 'Geoffry', 'Sumpter', 'gsumpteru@topsy.com', '6191-773903'),              -- EmployeeID: EMP000031
('Gaelan', 'Lisle', 'Dike', 'ldikev@google.co.jp', '4687-408593'),                 -- EmployeeID: EMP000032
('Darbie', 'Gwendolin', 'Burnitt', 'gburnittw@sina.com.cn', '1806-921376'),        -- EmployeeID: EMP000033
('Lorenza', 'Lidia', 'Lippatt', 'llippattx@wikimedia.org', '6384-149293'),         -- EmployeeID: EMP000034
('Muriel', 'Florentia', 'Hardware', 'fhardwarey@opera.com', '5363-380676'),        -- EmployeeID: EMP000035
('Ginny', 'Alaster', 'Senogles', 'asenoglesz@mysql.com', '1532-198949'),           -- EmployeeID: EMP000036
('Yoshi', 'Clarey', 'Siss', 'csiss10@walmart.com', '5873-003399'),                 -- EmployeeID: EMP000037
('Desiri', 'Hermon', 'Hawse', 'hhawse11@cnet.com', '4416-470238'),                 -- EmployeeID: EMP000038
('Evelina', 'Roxane', 'Pedron', 'rpedron12@parallels.com', '8529-475889'),         -- EmployeeID: EMP000039
('Hal', 'Ula', 'Di Antonio', 'udiantonio13@elegantthemes.com', '3736-139642')      -- EmployeeID: EMP000040

GO

-- CREATING TABLE 2 - StudentType --
CREATE TABLE StudentType(
  STRecordID INT IDENTITY(1,1),
  StudentType CHAR(2) NOT NULL,
  StudentTypeID AS CAST(CAST(StudentType AS VARCHAR(2)) + RIGHT('000000' + CAST(STRecordID AS VARCHAR(6)), 6) AS CHAR(8)) PERSISTED,
  PRIMARY KEY (StudentTypeID),
  CONSTRAINT CHK_StudentType CHECK (StudentType ='UG' OR StudentType ='PG')-- UG(Undergraduate) and PG(Postgraduate)
)

GO

-- CREATING TABLE 3 - LcoationArea --
CREATE TABLE LocationArea (
  LARecordID INT IDENTITY(1,1),
  LocationAreaID AS CAST('LA' + RIGHT('000000' + CAST(LARecordID AS VARCHAR(6)), 6) AS CHAR(8)) PERSISTED,
  Zipcode VARCHAR(8),
  City VARCHAR(58),
  County VARCHAR(26),
  PRIMARY KEY(LocationAreaID)
)

GO

-- INSERTING DATA TO TABLE 3 - LocationArea --
INSERT INTO LocationArea (Zipcode, City, County) VALUES
('OX1 2JD','Oxford','Oxfordshire'),
('WC1E 6BT','London','Middlesex'),
('CB2 1TN','Cambridge','Cambridgeshire'),
('PL4 8AA','Plymouth','Devon')

GO

-- CREATING TABLE 4 - LocationAddress --
CREATE TABLE LocationAddress (
  LADDRecordID INT IDENTITY(1,1),
  LocationAddressID AS CAST('LAD' + RIGHT('00000' + CAST(LADDRecordID AS VARCHAR(5)), 5) AS CHAR(8)) PERSISTED,
  LaneAddress VARCHAR(150),
  laLocationID CHAR(8),
  PRIMARY KEY (LocationAddressID),
  FOREIGN KEY (laLocationID) REFERENCES LocationArea(LocationAreaID)
)

GO

-- INSERTING DATA TO TABLE 4 - LocationAddress --
INSERT INTO  LocationAddress (LaneAddress, laLocationID) VALUES
('University Offices, Wellington Square','LD00001'),
('University College London, Gower Street','LD00002'),
('The Old Schools, Trinity Lane','LD00003'),
('Drake Circus','LD00004')

GO

-- CREATING TABLE 5 - StudentContact --
CREATE TABLE StudentContact(
  NationalInsuranceNumber VARCHAR(9),
  stStudentTypeID CHAR(8),
  TelephoneNumber CHAR(11) NOT NULL UNIQUE, -- advise user to insert in regional format 0123-456789
  ladLocationAddressID CHAR(8) NOT NULL,
  PRIMARY KEY (NationalInsuranceNumber),
  CONSTRAINT CHK_TelephoneNumber CHECK (TelephoneNumber LIKE '[0-9][0-9][0-9][0-9][.-][0-9][0-9][0-9][0-9][0-9][0-9]'),
  FOREIGN KEY (ladLocationAddressID) REFERENCES LocationAddress(LocationAddressID),
  FOREIGN KEY (stStudentTypeID) REFERENCES StudentType(StudentTypeID)
)

GO

-- INSERTING DATA TO TABLE 5 - StudentContact --
INSERT INTO StudentContact (NationalInsuranceNumber, TelephoneNumber )VALUES
('WB940276B','7384-106930'),
('LP064709C','9327-782218'),
('AG646231C','3006-957941'),
('RW794588C','6563-863908'),
('RB153694C','4415-171351'),
('KS459037D','4445-606670'),
('CN953687','5786-276769'),
('AG671006A','8104-346078'),
('NZ873662','1628-074443'),
('YT428556A','4443-901408'),
('HG747890','8674-660245'),
('WW680475B','4961-730174'),
('WE486863D','3145-535549'),
('BA660327','9154-536687'),
('RW874927B','7921-540744')

GO

-- CREATING TABLE 6 - StudentMobileNumber --
CREATE TABLE StudentMobileNumber(
  scNationalInsuranceNumber VARCHAR(9),
  MobileNumber CHAR(11) NOT NULL UNIQUE, -- advise user to insert in regional format 0123-456789
  PRIMARY KEY (scNationalInsuranceNumber),
  CONSTRAINT CHK_TelephoneNumber CHECK (MObileNumber LIKE '[0-9][0-9][0-9][0-9][.-][0-9][0-9][0-9][0-9][0-9][0-9]'),
  FOREIGN KEY (scNationalInsuranceNumber) REFERENCES StudentContact(NationalInsuranceNumber)
)

GO

-- INSERTING DATA TO TABLE 6 - StudentMobileNumber --
INSERT INTO StudentMobileNumber (scNationalInsuranceNumber, MobileNumber )VALUES
('WB940276B', '1061-036422'),
('LP064709C', '5262-102202'),
('AG646231C', '6725-323877'),
('RW794588C', '2837-122985'),
('RB153694C', '9869-388943'),
('KS459037D', '9475-125180'),
('CN953687', '5783-989263'),
('AG671006A', '1125-281541'),
('NZ873662', '9265-040158'),
('YT428556A', '4894-190538'),
('HG747890', '8596-329539'),
('WW680475B', '7562-121699'),
('WE486863D', '1649-457503'),
('BA660327', '9426-521763'),
('RW874927B','7821-540744')

GO

-- CREATING TABLE 7 - MembershipStatus --
CREATE TABLE MembershipStatus(
  MADRecordID INT IDENTITY(1,1),
  MembershipStatusID AS CAST('MS' + RIGHT('000000' + CAST(MADRecordID AS VARCHAR(6)), 6) AS CHAR(8)) PERSISTED,
  MembershipStatus VARCHAR(8),
  PRIMARY KEY (MembershipStatusID),
  CONSTRAINT CHK_Status CHECK (MembershipStatus = 'Active' OR MembershipStatus ='Dormant') -- checks for only possible two account statuses
)

GO

-- CREATING TABLE 8 - StudentGender --
CREATE TABLE StudentGender(
  SGRecordID INT IDENTITY(1,1),
  GenderID AS CAST('SG' + RIGHT('000000' + CAST(SGRecordID AS VARCHAR(6)), 6) AS CHAR(8)) PERSISTED,
  Gender CHAR(1),
  PRIMARY KEY (GenderID),
  CONSTRAINT CHK_Gender CHECK (Gender = 'M' OR Gender = 'F') -- checks for correct gender input M(male),F(female)
)

GO

-- CREATING TABLE 9 - UniversityContact --
CREATE TABLE UniversityContact(
  URecordID INT IDENTITY(1,1),
  UniversityID VARCHAR(4),
  Name VARCHAR(100) NOT NULL,
  ladLocationAddressID CHAR(8) NOT NULL,
  PRIMARY KEY (UniversityID),
  FOREIGN KEY (ladLocationAddressID) REFERENCES LocationAddress(LocationAddressID),
)

GO

-- INSERTING DATA TO TABLE 9 - UniversityContact --
INSERT INTO UniversityContact (UniversityID,Name,ladLocationAddressID) VALUES
('OU','Univeristy of Oxford','LAD00001'),
('UCL','Univeristy of College London','LAD00002'),
('CAM','Univeristy of Cambridge','LAD00003'),
('PU','Univeristy of Plymouth','LAD00004');

GO

-- CREATING TABLE 10 - UniversityTelephoneNumber --
CREATE TABLE UniversityTelephoneNumber(
  ucUniversityID VARCHAR(4),
  TelephoneNumber CHAR(11) NOT NULL UNIQUE, -- advise user to insert in regional format 0123-456789
  PRIMARY KEY (ucUniversityID,TelephoneNumber),
  FOREIGN KEY (ucUniversityID) REFERENCES UniversityContact(UniversityID),
  CONSTRAINT CHK_TelephoneNumber CHECK (TelephoneNumber LIKE '[0-9][0-9][0-9][0-9][.-][0-9][0-9][0-9][0-9][0-9][0-9]')
)

GO

-- INSERTING DATA TO TABLE 10 - UniversityTelephoneNumber --
INSERT INTO UniversityTelephoneNumber (ucUniversityID,TelephoneNumber) VALUES
('OU','1865-270000'),
('UCL','2076-792000'),
('CAM','1223-337733'),
('PU','1752-600600');

GO

-- CREATING TABLE 11 - UniversityEmailAddress --
CREATE TABLE UniversityEmailAddress(
  ucUniversityID VARCHAR(4),
  EmailAddress VARCHAR(50) NOT NULL,
  PRIMARY KEY (ucUniversityID,EmailAddress),
  FOREIGN KEY (ucUniversityID) REFERENCES UniversityContact(UniversityID),
  CONSTRAINT CHK_EmailAddress CHECK (EmailAddress LIKE '%_@_%_.__%') -- check for @ sign and subdomains such as .co.uk
)

GO

-- INSERTING DATA TO TABLE 11 - UniversityEmailAddress --
INSERT INTO UniversityEmailAddress (ucUniversityID, EmailAddress) VALUES
('OU','enquiries@devoff.ox.ac.uk'),
('UCL','study@ucl.ac.uk'),
('CAM','reception@educ.cam.ac.uk'),
('PU','researchadvice@plymouth.ac.uk')

GO

-- CREATING TABLE 12	PropertyType --
CREATE TABLE PropertyType(
  PTRecordID int IDENTITY(1,1),
  PropertyTypeID char(8),
  PropertyType varchar(30) NOT NULL, -- typo in the report
  PRIMARY KEY (PropertyTypeID),

)

GO

-- CREATING TABLE 13 - PropertyAreaType --
CREATE TABLE PropertyAreaType(
  PRecordID int IDENTITY(1,1), --is this int or char
  PropertyAreaTypeID char(8) NOT NULL,
  PropertyAreaType char(30) NOT NULL,
  PRIMARY KEY (PropertyAreaTypeID),
  )

GO



-- CREATING TABLE 14 - RentAmount --
CREATE TABLE RentAmount(
  RARecordID char IDENTITY(1,1),
  RentAmountID char(8) NOT NULL,
  RentAmount money NOT NULL,
  PRIMARY KEY (RentAmountID),
  )


  GO
-- CREATING TABLE 15 -PropertyContact --
  CREATE TABLE PropertyContact(
    PCRecordID int IDENTITY(1,1),
    PropertyContactID char(8) NOT NULL,
    laddLocationAddressID char(8),
    PRIMARY KEY (PropertyContactID),
    FOREIGN KEY (laddLocationAddressID) REFERENCES LocationAddress(LocationAddressID),
    CONSTRAINT CHK_PC_LocationAddressID CHECK (LEN(laddLocationAddressID) = 8)
  )


  GO
-- CREATING TABLE 16 - Property --
  CREATE TABLE Property(
    PRecordID int IDENTITY(1,1),
    PropertyID char(8) NOT NULL,
    patPropertyAreaTypeID char(8),
    raRentAmountID char(8),
    MaxNoTenants int(3),
    NoOfBathrooms int(2),
    NoOfBedrooms int(2),
    NoOfParkingSlots int(2),
    SizeInSquareFeet int(6) Not Null,
    BuiltDate date Not Null,
    pcPropertyContactID char(8) Not Null,
    PRIMARY KEY (PropertyID),
    FOREIGN KEY (ptPropertyTypeID) REFERENCES PropertyType(PropertyTypeID),
    FOREIGN KEY (patPropertyAreaTypeID) REFERENCES PropertyAreaType(PropertyAreaTypeID),
    FOREIGN KEY (raRentAmountID) REFERENCES RentAmount(RentAmountID),
    FOREIGN KEY (pcPropertyContactID) REFERENCES PropertyContact(PropertyContactID),
    CONSTRAINT CHK_P_PropertyTypeID CHECK (LEN(ptPropertyTypeID) = 8),
    CONSTRAINT CHK_P_PropertyAreaTypeID CHECK (LEN(ptPropertyTypeID) = 8),
    CONSTRAINT CHK_P_RentAmountID CHECK (LEN(raRentAmountID) = 8),
    CONSTRAINT CHK_P_PropertyContactID CHECK (LEN(pcPropertyContactID) = 8)


  )



  GO
-- CREATING TABLE 17 - PropertyOtherFacilities  --
  CREATE TABLE PropertyOtherFacilities(
    pPropertyID char(8) Not Null,
    OtherFacilities varchar(100) NOT NULL,
    PRIMARY KEY (pPropertyID,OtherFacilities),
    FOREIGN KEY (pofPropertyID) REFERENCES Property(PropertyID),
    CONSTRAINT CHK_P_PropertyID CHECK (LEN(pPropertyID) = 8)
  )

  GO




  -- CREATING TABLE 18 - PropertyFlatFloorNumber  --
  CREATE TABLE PropertyFlatFloorNumber(
    PFFNRecordID int IDENTITY(1,1),
    FloorNumberID char(8) NOT NULL IDENTITY(1,1),
    FloorNumber varchar(2) NOT NULL,
    PRIMARY KEY (FloorNumberID),
    )



    GO


    -- CREATING TABLE 19 - PropertyStatus  --
    CREATE TABLE PropertyStatus(
      PSRecordID int IDENTITY(1,1),
      StatusID char(8) NOT NULL IDENTITY(1,1),
      Status varchar(12) NOT NULL,
      PRIMARY KEY (StatusID),
      )


      GO


      -- CREATING TABLE 20 - PropertyFlat --
        CREATE TABLE PropertyFlat(
          PFRecordID int IDENTITY(1,1),
          PFPropertyID char(8) NOT NULL,
          pPropertyID char(8),
          raRentAmountID char(8),
          MaxNoTenants int(3),
          NoOfBathrooms int(2),
          NoOfBedrooms int(2),
          NoOfParkingSlots int(2),
          SizeInSquareFeet int(6) Not Null,
          BuiltDate date Not Null,
          pcPropertyContactID char(8) Not Null,
          PRIMARY KEY (PropertyID),
          FOREIGN KEY (ptPropertyTypeID) REFERENCES PropertyType(PropertyTypeID),
          FOREIGN KEY (patPropertyAreaTypeID) REFERENCES PropertyAreaType(PropertyAreaTypeID),
          FOREIGN KEY (raRentAmountID) REFERENCES RentAmount(RentAmountID),
          FOREIGN KEY (pcPropertyContactID) REFERENCES PropertyContact(PropertyContactID),
          CONSTRAINT CHK_P_PropertyTypeID CHECK (LEN(ptPropertyTypeID) = 8),
          CONSTRAINT CHK_P_PropertyAreaTypeID CHECK (LEN(ptPropertyTypeID) = 8),
          CONSTRAINT CHK_P_RentAmountID CHECK (LEN(raRentAmountID) = 8),
          CONSTRAINT CHK_P_PropertyContactID CHECK (LEN(pcPropertyContactID) = 8)


        )
