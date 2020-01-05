
-- Accessing the sasDB
  USE sasDB;

  GO

-- CREATING TABLE 1 - CustomerService --
  CREATE TABLE CustomerService (
    CSRecordID INT IDENTITY(1,1),
    EmployeeID AS CAST('EMP' + RIGHT('00000' + CAST(CSRecordID AS VARCHAR(6)), 6) AS CHAR(8)) PERSISTED,
    FirstName VARCHAR(20) NOT NULL,
    MiddleName VARCHAR(25),
    LastName VARCHAR(30) NOT NULL,
    EmailAddress VARCHAR(50) NOT NULL,
    TelephoneNumber CHAR(11) NOT NULL UNIQUE, -- advise user to insert in regional format 0123-456789
    PRIMARY KEY (EmployeeID,CSRecordID),
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
    PRIMARY KEY (StudentTypeID,STRecordID),
    CONSTRAINT CHK_StudentType CHECK (StudentType ='UG' OR StudentType ='PG')
  )

  GO

-- INSERTING DATA TO TABLE 2 - StudentType --
  INSERT INTO StudentType (StudentType) VALUES
  ('UG'), --Undergraduate Student
  ('PG') --Postgraduate Student

  GO

-- CREATING TABLE 3 - LcoationArea --
  CREATE TABLE LocationArea (
    LARecordID INT IDENTITY(1,1),
    LocationAreaID AS CAST('LA' + RIGHT('000000' + CAST(LARecordID AS VARCHAR(6)), 6) AS CHAR(8)) PERSISTED,
    Zipcode VARCHAR(8) NOT NULL,
    City VARCHAR(58) NOT NULL,
    County VARCHAR(26) NOT NULL,
    PRIMARY KEY(LocationAreaID,LARecordID)
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
    laLocationID CHAR(8),
    PRIMARY KEY (LocationAddressID,LADDRecordID),
    CONSTRAINT FK_LA_LocationAddressID FOREIGN KEY (laLocationID) REFERENCES LocationArea(LocationAreaID)
  )

  GO

-- INSERTING DATA TO TABLE 4 - LocationAddress --
  INSERT INTO  LocationAddress (LaneAddress, laLocationID) VALUES
  ('University Offices, Wellington Square','LAD00001'),    -- LocationAddressID: LAD00001
  ('University College London, Gower Street','LAD00002'),  -- LocationAddressID: LAD00002
  ('The Old Schools, Trinity Lane','LAD00003'),            -- LocationAddressID: LAD00003
  ('Drake Circus','LAD00004')                              -- LocationAddressID: LAD00004

  GO

-- CREATING TABLE 5 - StudentContact --
CREATE TABLE StudentContact(
  NationalInsuranceNumber VARCHAR(9) NOT NULL,
  stStudentTypeID CHAR(8),
  TelephoneNumber CHAR(11) NOT NULL UNIQUE, -- advise user to insert in regional format 0123-456789
  ladLocationAddressID CHAR(8) NOT NULL,
  EmailAddress VARCHAR(50) NOT NULL,
  PRIMARY KEY (NationalInsuranceNumber),
  CONSTRAINT CHK_EmailAddress CHECK (EmailAddress LIKE '%_@_%_.__%'), -- check for @ sign and subdomains such as .co.uk
  CONSTRAINT CHK_TelephoneNumber CHECK (TelephoneNumber LIKE '[0-9][0-9][0-9][0-9][.-][0-9][0-9][0-9][0-9][0-9][0-9]'),
  CONSTRAINT FK_SC_LocationAddressID FOREIGN KEY (ladLocationAddressID) REFERENCES LocationAddress(LocationAddressID),
  CONSTRAINT FK_SC_stStudentTypeID FOREIGN KEY (stStudentTypeID) REFERENCES StudentType(StudentTypeID)
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
    scNationalInsuranceNumber VARCHAR(9) NOT NULL,
    MobileNumber CHAR(11) NOT NULL UNIQUE, -- advise user to insert in regional format 0123-456789
    PRIMARY KEY (scNationalInsuranceNumber,MobileNumber),
    CONSTRAINT CHK_TelephoneNumber CHECK (MobileNumber LIKE '[0-9][0-9][0-9][0-9][.-][0-9][0-9][0-9][0-9][0-9][0-9]'),
    CONSTRAINT FK_SMN_scNationalInsuranceNumber FOREIGN KEY (scNationalInsuranceNumber) REFERENCES StudentContact(NationalInsuranceNumber)
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
    MembershipStatus VARCHAR(20) NOT NULL,
    PRIMARY KEY (MembershipStatusID,MADRecordID),
    CONSTRAINT CHK_Status CHECK (MembershipStatus = 'Active' OR MembershipStatus ='Dormant' OR MembershipStatus ='Banned') -- checks for only possible account statuses
  )

  GO

-- INSERTING DATA TO TABLE 7 - MembershipStatus --
  INSERT INTO MembershipStatus (MembershipStatus) VALUES
  ('Active'),   -- MembershipStatusID: MS000001
  ('Dormant')   -- MembershipStatusID: MS000002
  ('Banned')    -- MembershipStatusID: MS000003

  GO

-- CREATING TABLE 8 - StudentGender --
  CREATE TABLE StudentGender(
    SGRecordID INT IDENTITY(1,1),
    GenderID AS CAST('SG' + RIGHT('000000' + CAST(SGRecordID AS VARCHAR(6)), 6) AS CHAR(8)) PERSISTED,
    Gender CHAR(1) NOT NULL,
    PRIMARY KEY (GenderID ,SGRecordID),
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
    ladLocationAddressID CHAR(8) NOT NULL,
    PRIMARY KEY (UniversityID, URecordID),
    CONSTRAINT FK_UC_ladLocationAddressID FOREIGN KEY (ladLocationAddressID) REFERENCES LocationAddress(LocationAddressID)
  )

  GO

-- INSERTING DATA TO TABLE 9 - UniversityContact --
  INSERT INTO UniversityContact (UniversityID,Name,ladLocationAddressID) VALUES
  ('OU','University of Oxford','LAD00001'),
  ('UCL','University of College London','LAD00002'),
  ('CAM','University of Cambridge','LAD00003'),
  ('PU','University of Plymouth','LAD00004')

  GO

-- CREATING TABLE 10 - UniversityTelephoneNumber --
  CREATE TABLE UniversityTelephoneNumber(
    ucUniversityID VARCHAR(4),
    TelephoneNumber CHAR(11) NOT NULL UNIQUE, -- advise user to insert in regional format 0123-456789
    PRIMARY KEY (ucUniversityID,TelephoneNumber),
    CONSTRAINT FK_UTN_ucUniversityID FOREIGN KEY (ucUniversityID) REFERENCES UniversityContact(UniversityID),
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
    EmailAddress VARCHAR(50) NOT NULL ,
    PRIMARY KEY (ucUniversityID,EmailAddress),
    CONSTRAINT FK_UEA_UniversityID FOREIGN KEY (ucUniversityID) REFERENCES UniversityContact(UniversityID),
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
    PropertyTypeID AS CAST('PT' + RIGHT('000000' + CAST(PTRecordID AS VARCHAR(6)), 6) AS CHAR(8)) PERSISTED,  --Doube check this plz
    PropertyType varchar(30) NOT NULL,
    PRIMARY KEY (PropertyTypeID, PTRecordID)
  )

  GO

-- INSERTING DATA TO TABLE 12 - PropertyType --
  INSERT INTO PropertyType (PropertyType) VALUES --need to add comments
  ('Flat'),            -- PropertyTypeID: PT000001
  ('Terraced House'),  -- PropertyTypeID: PT000002
  ('Detached House')   -- PropertyTypeID: PT000003

  GO

-- CREATING TABLE 13 - PropertyAreaType --
  CREATE TABLE PropertyAreaType(
    PRecordID int IDENTITY(1,1), -- int
    PropertyAreaTypeID AS CAST('PAT' + RIGHT('00000' + CAST(PRecordID AS VARCHAR(5)), 5) AS CHAR(8)) PERSISTED,  --Doube check this plz
    PropertyAreaType char(30) NOT NULL,
    PRIMARY KEY (PropertyAreaTypeID, PRecordID),
    )

  GO

-- INSERTING DATA TO TABLE 13 - PropertyAreaType --
  INSERT INTO PropertyAreaType (PropertyAreaType) VALUES  --need to add comments
  ('Urban'),      -- PropertyAreaTypeID: PAT00001
  ('Suburban'),   -- PropertyAreaTypeID: PAT00002
  ('Rural'),      -- PropertyAreaTypeID: PAT00003
  ('Exurban'),    -- PropertyAreaTypeID: PAT00004
  ('Residential') -- PropertyAreaTypeID: PAT00005

  GO

-- CREATING TABLE 14 - RentAmount --
  CREATE TABLE RentAmount(
    RARecordID char IDENTITY(1,1),
    RentAmountID AS CAST('RA' + RIGHT('000000' + CAST(RARecordID AS VARCHAR(6)), 6) AS CHAR(8)) PERSISTED,  --Doube check this plz
    RentAmount money NOT NULL,
    PRIMARY KEY (RentAmountID, RARecordID),
    )

  GO

-- INSERTING DATA TO TABLE 14 - RentAmount --
  INSERT INTO RentAmount(RentAmount) VALUES  --need to add comments
  ('1000'),   -- RentAmountID: RA000001
  ('2000'),   -- RentAmountID: RA000002
  ('3000'),   -- RentAmountID: RA000003
  ('4000'),   -- RentAmountID: RA000004
  ('5000')    -- RentAmountID: RA000005
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
    PropertyContactID AS CAST('PC' + RIGHT('000000' + CAST(PCRecordID AS VARCHAR(6)), 6) AS CHAR(8)) PERSISTED,  --Doube check this plz
    laddLocationAddressID char(8),
    PRIMARY KEY (PropertyContactID, PCRecordID),
    CONSTRAINT FK_PC_LocationAddressID FOREIGN KEY (laddLocationAddressID) REFERENCES LocationAddress(LocationAddressID),
    CONSTRAINT CHK_PC_LocationAddressID CHECK (LEN(laddLocationAddressID) = 8)
  )

GO

-- INSERTING DATA TO TABLE 15 - PropertyContact --
  INSERT INTO PropertyContact(laddLocationAddressID) VALUES  --need to add comments
  ('LA000001'),  -- PropertyContactID: PC000001                                          --check the parent table for values
  ('LA000002'),  -- PropertyContactID: PC000002
  ('LA000003'),  -- PropertyContactID: PC000003
  ('LA000004'),  -- PropertyContactID: PC000004
  ('LA000005'),  -- PropertyContactID: PC000005
  ('LA000006'),  -- PropertyContactID: PC000006
  ('LA000007'),  -- PropertyContactID: PC000007
  ('LA000008'),  -- PropertyContactID: PC000008
  ('LA000009'),  -- PropertyContactID: PC000009
  ('LA000010'),  -- PropertyContactID: PC000010
  ('LA000011'),  -- PropertyContactID: PC000011
  ('LA000012'),  -- PropertyContactID: PC000012
  ('LA000013'),  -- PropertyContactID: PC000013
  ('LA000014'),  -- PropertyContactID: PC000014
  ('LA000015')   -- PropertyContactID: PC000015

  GO

-- CREATING TABLE 16 - Property --
    CREATE TABLE Property(
      PRecordID int IDENTITY(1,1),
      PropertyID AS CAST('P' + RIGHT('0000000' + CAST(PRecordID AS VARCHAR(7)), 7) AS CHAR(8)) PERSISTED,  --Doube check this plz
      patPropertyAreaTypeID char(8),
      raRentAmountID char(8),
      MaxNoTenants int(3),
      NoOfBathrooms int(2),
      NoOfBedrooms int(2),
      NoOfParkingSlots int(2),
      SizeInSquareFeet int(6) Not Null,
      BuiltDate date Not Null,
      pcPropertyContactID char(8) Not Null,
      PRIMARY KEY (PropertyID, PRecordID),
      CONSTRAINT FK_PT_PropertyTypeID FOREIGN KEY (ptPropertyTypeID) REFERENCES PropertyType(PropertyTypeID),
      CONSTRAINT FK_PropertyAreaTypeID FOREIGN KEY (patPropertyAreaTypeID) REFERENCES PropertyAreaType(PropertyAreaTypeID),
      CONSTRAINT FK_PT_RentAmountID FOREIGN KEY (raRentAmountID) REFERENCES RentAmount(RentAmountID),
      CONSTRAINT FK_PT_PropertyContactID FOREIGN KEY (pcPropertyContactID) REFERENCES PropertyContact(PropertyContactID),
      CONSTRAINT CHK_P_PropertyTypeID CHECK (LEN(ptPropertyTypeID) = 8),
      CONSTRAINT CHK_P_PropertyAreaTypeID CHECK (LEN(ptPropertyTypeID) = 8),
      CONSTRAINT CHK_P_RentAmountID CHECK (LEN(raRentAmountID) = 8),
      CONSTRAINT CHK_P_PropertyContactID CHECK (LEN(pcPropertyContactID) = 8)
    )

GO

-- INSERTING DATA TO TABLE 16 - Property --
    INSERT INTO Property(ptPropertyTypeID,patPropertyAreaTypeID,raRentAmountID,MaxNoTenants,NoOfBathrooms,NoOfBedrooms,NoOfParkingSlots,SizeInSquareFeet,BuiltDate,pcPropertyContactID) VALUES  --need to add comments
    ('PT000001','PAT00001','RA000001','1','1','1','4','','2001-11-15','PC000001'),--check the parent table for values
    ('PT000002','PAT00002','RA000002','1','1','1','1','','2002-11-15','PC000002'),--check the parent table for values
    ('PT000003','PAT00003','RA000015','2','1','1','5','','2002-11-15','PC000003'),--check the parent table for values
    ('PT000001','PAT00004','RA000014','2','1','2','1','200000','2014-11-15','PC000004'),--check the parent table for values
    ('PT000002','PAT00005','RA000003','3','2','2','1','200000','2015-11-15','PC000005'),--check the parent table for values
    ('PT000003','PAT00002','RA000004','1','1','2','3','500000','2019-11-15','PC000006'),--check the parent table for values
    ('PT000003','PAT00003','RA000005','3','3','2','1','200000','2014-11-15','PC000007'),--check the parent table for values
    ('PT000003','PAT00002','RA000008','2','1','1','3','700000','2018-11-15','PC000008'),--check the parent table for values
    ('PT000001','PAT00003','RA000008','1','1','1','3','200000','2018-11-15','PC000009'),--check the parent table for values
    ('PT000001','PAT00005','RA000013','6','3','3','1','10000','1997-11-15','PC000010'),--check the parent table for values
    ('PT000001','PAT00004','RA000008','1','1','1','1','30000','2019-11-15','PC000011'),--check the parent table for values
    ('PT000001','PAT00005','RA000010','7','2','4','2','500000','2019-11-15','PC000012'),--check the parent table for values
    ('PT000002','PAT00004','RA000009','1','2','1','2','30000','2019-11-15','PC000013'),--check the parent table for values
    ('PT000001','PAT00005','RA000005','5','1','4','7','900000','2019-11-15','PC000014'),--check the parent table for values
    ('PT000003','PAT00004','RA000006','5','2','2','1','','2019-11-15','PC000015'),--check the parent table for values

  GO

-- CREATING TABLE 17 - PropertyOtherFacilities  --
  CREATE TABLE PropertyOtherFacilities(
    pPropertyID char(8) Not Null,
    OtherFacilities varchar(100) NOT NULL,
    PRIMARY KEY (pPropertyID,OtherFacilities),
    CONSTRAINT FK_POF_PropertyID FOREIGN KEY (pofPropertyID) REFERENCES Property(PropertyID),
    CONSTRAINT CHK_P_PropertyID CHECK (LEN(pPropertyID) = 8)
  )

GO

-- INSERTING DATA TO TABLE 17 - PropertyOtherFacilities --
  INSERT INTO PropertyOtherFacilities(pPropertyID,OtherFacilities) VALUES  --need to add comments
  ('P0000001','large dining room,kitchen,Laundry facilities'),--check the parent table for values
  ('P0000002','outdoor patio,large dining room,kitchen,'),
  ('P0000003','large dining room,kitchen'),
  ('P0000006','outdoor patio,large dining room,Laundry facilities'),
  ('P0000007','outdoor patio,large dining room,kitchen,Laundry facilities'),
  ('P0000008','outdoor patio,large dining room'),
  ('P0000009','outdoor patio,large dining room,kitchen'),
  ('P0000010','large dining room,kitchen,Laundry facilities'),
  ('P0000011','outdoor patio,large dining room,kitchen'),
  ('P0000015','outdoor patio,large dining room,kitchen,Laundry facilities,outdoor play area')

  GO
  -- CREATING TABLE 18 - PropertyFlatFloorNumber  --
  CREATE TABLE PropertyFlatFloorNumber(
    PFFNRecordID int IDENTITY(1,1),
    FloorNumberID AS CAST('FN' + RIGHT('000000' + CAST(PFFNRecordID AS VARCHAR(6)), 6) AS CHAR(8)) PERSISTED,  --Doube check this plz
    FloorNumber varchar(2) NOT NULL,
    PRIMARY KEY (FloorNumberID, PFFNRecordID),
  )

GO

-- INSERTING DATA TO TABLE 18 - PropertyFlatFloorNumber --
  INSERT INTO PropertyFlatFloorNumber(FloorNumber) VALUES  --need to add comments
  ('05'),--check the parent table for values
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
    StatusID AS CAST('PS' + RIGHT('000000' + CAST(PSRecordID AS VARCHAR(6)), 6) AS CHAR(8)) PERSISTED,  --Doube check this plz
    Status varchar(12) NOT NULL,
    PRIMARY KEY (StatusID, PSRecordID),
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
    pPropertyID char(8),
    pffFloorNoID char(8),
    psStatusID CHAR(8),
    PRIMARY KEY (PFPropertyID, PFRecordID),
    CONSTRAINT FK_PF_PropertyID FOREIGN KEY (PropertyID) REFERENCES Property(PropertyID),
    CONSTRAINT FK_PF_FloorNoID FOREIGN KEY (patPropertyAreaTypeID) REFERENCES PropertyFlatFloorNumber(FloorNumberID),
    CONSTRAINT FK_PF_StatusID FOREIGN KEY (psStatusID) REFERENCES PropertyStatus(StatusID),
    CONSTRAINT CHK_PF_pPropertyID CHECK (LEN(pPropertyID) = 8),
    CONSTRAINT CHK_PF_pffFloorNoID CHECK (LEN(pffFloorNoID) = 8),
    CONSTRAINT CHK_PF_psStatusID CHECK (LEN(psStatusID) = 8),
  )

  GO

  INSERT INTO PropertyFlat(pPropertyID,pffFloorNoID,psStatusID) VALUES  --need to add comments
  ('P0000001','FN000001','PS000001'),--check the parent table for values
  ('P0000004','FN000002','PS000001'),--check the parent table for values
  ('P0000009','FN000003','PS000002'),
  ('P0000010','FN000004','PS000002'),--check the parent table for values
  ('P0000011','FN000005','PS000003'),
  ('P0000012','FN000006','PS000003'),--check the parent table for values
  ('P0000014','FN000007','PS000003')

  GO

-- CREATING TABLE 21 - PropertyTerracedHouseType --
  CREATE TABLE PropertyTerracedHouseType(
  PTHTRecordID INT IDENTITY(1,1),
  TypeID AS CAST('PTHT' + RIGHT('0000' + CAST(PSRecordID AS VARCHAR(6)), 6) AS CHAR(8)) PERSISTED, --Doube check this plz
  Type varchar(12) NOT NULL,
  PRIMARY KEY (PTHTRecordID, TypeID),
  )

  GO

  INSERT INTO PropertyTerracedHouseType(Type) VALUES  --need to add comments
  ('Modern'),
  ('Transitional'),
  ('Other')-- just couldn't think of any

  GO

-- CREATING TABLE 22 - PropertyTerracedHouse  --
  CREATE TABLE PropertyTerracedHouse(
  PTHRecordID int IDENTITY(1,1),
  PTHPropertyID AS CAST('PT' + RIGHT('000000' + CAST(PTHRecordID AS VARCHAR(6)), 6) AS CHAR(8)) PERSISTED,
  pPropertyID char(8),
  pthTypeID char(8),
  psStatusID char(8),
  NoOfFloors Not Null,
  PRIMARY KEY (PTHPropertyID, pPropertyID, PTHRecordID),
  CONSTRAINT FK_PTH_PropertID FOREIGN KEY (pPropertyID) REFERENCES LocationAddress(Property),
  CONSTRAINT FK_PTH_TypeID FOREIGN KEY (pthTypeID) REFERENCES StudentType(PropertyTerracedHouseType),
  CONSTRAINT FK_PTH_StatusID FOREIGN KEY (psStatusID) REFERENCES StudentType(PropertyStatus)
  )

  GO

  -- INSERTING INTO TABLE 22 - PropertyTerracedHouse  --
  INSERT INTO PropertyTerracedHouse(pPropertyID,pthTypeID,psStatusID,NoOfFloors) VALUES
  ('P0000000', 'PTHT0000', 'PS000000', 02),
  ('P0000001', 'PTHT0001', 'PS000001', 03),
  ('P0000002', 'PTHT0002', 'PS000002', 01),
  ('P0000003', 'PTHT0003', 'PS000003', 02),
  ('P0000004', 'PTHT0004', 'PS000004', 03),
  ('P0000005', 'PTHT0005', 'PS000005', 02),
  ('P0000006', 'PTHT0006', 'PS000006', 01),
  ('P0000007', 'PTHT0007', 'PS000007', 01),
  ('P0000008', 'PTHT0008', 'PS000008', 02),
  ('P0000009', 'PTHT0009', 'PS000009', 02),
  ('P0000010', 'PTHT0010', 'PS000010', 03),
  ('P0000011', 'PTHT0011', 'PS000011', 01),
  ('P0000012', 'PTHT0012', 'PS000012', 02),
  ('P0000013', 'PTHT0013', 'PS000013', 01),
  ('P0000014', 'PTHT0014', 'PS000014', 01),
  ('P0000015', 'PTHT0014', 'PS000015', 03)

  GO



-- CREATING TABLE 23 - PropertDetachedHouse --
  CREATE TABLE PropertDetachedHouse(
  PDHRecordID int IDENTITY(1,1) Not Null,
  PDHPropertyID AS CAST('PD' + RIGHT('000000' + CAST(PDHRecordID AS VARCHAR(6)), 6) AS CHAR(8)) PERSISTED,
  pPropertyID char(8),
  psStatusID char(8),
  NoOfFloors INT(2) Not Null,  --ADDED MISSING DATAYPE (RANUL)
  PRIMARY KEY (PDHPropertyID, pPropertyID, PDHRecordID),
  CONSTRAINT FK_PDH_PropertyID FOREIGN KEY (pPropertyID) REFERENCES LocationAddress(Property),
  CONSTRAINT FK_PDH_StatusID FOREIGN KEY (psStatusID) REFERENCES StudentType(PropertyStatus)
  )

  GO

  -- INSERTING INTO TABLE 23 - PropertyDetachedHouse  --
  INSERT INTO PropertyDetachedHouse(pPropertyID,psStatusID,NoOfFloors) VALUES
  ('P0000016', 'PS000016', 02),
  ('P0000017', 'PS000017', 03),
  ('P0000018', 'PS000018', 01),
  ('P0000019', 'PS000019', 02),
  ('P0000020', 'PS000020', 03),
  ('P0000021', 'PS000021', 02),
  ('P0000022', 'PS000022', 01),
  ('P0000023', 'PS000023', 01),
  ('P0000024', 'PS000024', 02),
  ('P0000025', 'PS000025', 02),
  ('P0000026', 'PS000026', 03),
  ('P0000027', 'PS000027', 01),
  ('P0000028', 'PS000028', 02),
  ('P0000029', 'PS000029', 01),
  ('P0000030', 'PS000030', 03),
  ('P0000031', 'PS000031', 02)

  GO


-- CREATING TABLE 24 - SystemLoginAccountType  --
  CREATE TABLE SystemLoginAccountType(
    SLATRecordID int IDENTITY(1,1)  Not Null,
    AccountTypeID char(8),
    AccountType char(8) Not Null,
    PRIMARY Key(AccountTypeID)
  )

  GO

  -- INSERTING INTO TABLE 24 - SystemLoginAccountType  --
  INSERT INTO SystemLoginAccountType(AccountTypeID,AccountType) VALUES
  ('AT000000', 'Undergraduate Student'),
  ('AT000001', 'Postgraduate student'),
  ('AT000002', 'Undergraduate Student'),
  ('AT000003', 'Single Property landlord'),
  ('AT000004', 'Multiple property land lord'),
  ('AT000005', 'Multiple property land lord'),
  ('AT000006', 'Single Property landlord'),
  ('AT000007', 'Multiple property land lord'),
  ('AT000008', 'Undergraduate Student'),
  ('AT000009', 'Multiple property land lord'),
  ('AT000010', 'Postgraduate student'),
  ('AT000011', 'Multiple property land lord'),
  ('AT000012', 'Undergraduate Student'),
  ('AT000013', 'Postgraduate student'),
  ('AT000014', 'Undergraduate Student'),
  ('AT000015', 'Multiple property land lord')

  GO

-- CREATING TABLE 25 - SystemLogin  --
  CREATE TABLE SystemLogin(
    SLRecordID INT IDENTITY(1,1),
    SystemLoginID AS CAST('SL' + RIGHT('000000' + CAST(SLRecordID AS VARCHAR(6)), 6) AS CHAR(8)) PERSISTED,
    UserName varchar(8) NOT NULL UNIQUE,  --SETTED USER NAME AS UNIQUE TO PREVENT DATA DUPLICATION (RANUL)
    Passwordhash Binary(64) NOT NULL,
    slatAccountTypeID CHAR(8),
    CreationDateTime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, --UPDATED TO DATETIME TO WORK WITH MSSQL (RANUL)
    PRIMARY KEY (SLRecordID, SystemLoginID),
    CONSTRAINT FK_SL_AccountypeID FOREIGN KEY (slatAccountTypeID) REFERENCES SystemLoginAccountType(AccountTypeID)
  )

  GO

  -- INSERTING INTO TABLE 25 - SystemLogin  --
  INSERT INTO SystemLogin(UserName,Passwordhash,slatAccountTypeID) VALUES
  ('Allyson', '88b685b556f8f2ea3bffbb2174c4e1d793fb2e120fc64dd9dd8ce9320e8c738f324129b6b6afd1cf8b4eb2e60ef4bbb861c52be1c298b0fa8c18c766ecc28086',' AT000000'),         --Password= allyson@1427   |   SystemLoginID: SL000001
  ('Tyler', '6e3ce81c5e38499f3c44c65f67f7eaf5de9e11a5bdec5f22f0fa9a091fff4f132e693aeb5501ddaea2e587672c325ab9f3b0c84be4fb993df62479d03f423ec3', 'AT000001'),           --Password=Tyler$7513      |   SystemLoginID: SL000002
  ('Kent', '6095ba674ed582fb482e1706b6488c46f1491e4492352db084ae3103079b3e8af3402e0fc85a2000a43115b8e3537f21baf84a63a3e9c70e71a2d1617de8c618', 'AT000002'),            --Password=Kent*0615       |   SystemLoginID: SL000003
  ('Obrien', 'e0663fbd390b5520af5b96a293c77b1dee22ac7247943ae1f5a0dbf5c4beeb7129c08b1b8fa0b3b37141766a870f655b096d2ebe0613d36b6d0da11b44cf3eee', 'AT000003'),          --Password=Obrien!1303     |   SystemLoginID: SL000004
  ('Walter', 'a8a23740862ff343ef7495a8efe488f9f0491e13eb17c95ffb0d653e67caf3da9aa68b609d1bce6ce552c7f3458d0a1e934d2ad29433f6c8f12f5f2911c14dff', 'AT000004'),          --Password=Walter#654      |   SystemLoginID: SL000005
  ('Cole', '3b350ea4f978c1f61fd1fb33dbb9ecbdb9ac0b607410cbeda889a5758eaf86db587ce07553b84557ec0be9fb2e4e5d897e7657ff19dee1a2fc17df66cd2605a2', 'AT000005'),            --Password=Cole@1516       |   SystemLoginID: SL000006
  ('Ellis', '97c01ff7eede759db5f5cc06af7b92042424da393335132cbe424366ab0362b848946392b844845755f9f7a5733d09c8a642d8c689232b1d9475a8d90ff677c3', 'AT000006'),           --Password=Ellis$6516      |   SystemLoginID: SL000007
  ('Tharindu', '4d49e2db71027c3b648cdcd201b474e32e361fdadbdea404ad103cda83f618553af0b5fd20580b7a3769b87511d52342e385d9879381c84730e34d320dbd5cb0', 'AT000007'),        --Password=Tharindu%6156   |   SystemLoginID: SL000008
  ('Rohan', '11f8ae8568cb85ef6709a4ed5954f68548d3ea6e24a30065474a3a61ffc1d1d0ee65897df30209d4faaacd7361d77897719b26821acdade04347d8e533406571', 'AT000008'),           --Password=Rohan#1651      |   SystemLoginID: SL000009
  ('Gihan', 'a525169296c334e20dbb059a4087015694b54b97d1a16a0e6ed5b8f24a1eb6ca975707b39bec59813d06e873c2754be2cfb58cafc0c3010ceee2f7286049104c', 'AT000009'),           --Password=Gihan!1561      |   SystemLoginID: SL000010
  ('Andrew', 'fc83106a51a1a79b4726e11cd29038fad466d2333101886ecc9528028400f15471210af29d6b7e1441f851907a2b9b0254a0761ff0d0a6f54d631ed004bda9d5', 'AT000010'),          --Password=Andrew@5161     |   SystemLoginID: SL000011
  ('Ranga', '63bcbc4985f3847cd4ba0af1c344313031c4268939da2f94cf829660c3bb06e4b412bcbf27b1d008e2a786f6544b26cf0c3cf9eda039ca5e5d525aad673d9a89', 'AT000011'),           --Password=Ranga$1561      |   SystemLoginID: SL000012
  ('Pasindu', 'b4b3b0b53f888f3142eb5118ce0c53fad1230a35269a23d4b0fab35911fcad9041eef30eea707f11aeaeae061577809cb84b0eae5e738a6032b240e7c5c9793d', 'AT000012'),         --Password=Pasindu*1561    |   SystemLoginID: SL000013
  ('Kalani', '52e5342ba5b1acdc7381f19854e6ce7f2286bdd21418e7128bcc1d973074f0a8fd93e8a25733c34ede14ae49b4a39b5e6b2c8c8d2ee4e7d3274fda9699a7fa73', 'AT000013'),          --Password=Kalani$1516     |   SystemLoginID: SL000014
  ('Peter', 'f9c21071a4efd98cb5442a277a47a25e8cd38d73bbb22c12bfc40564d2707de713b8ef58e4679a5972c8b3453feae7021630dc6098de481901cc273373a52e18', 'AT000014'),           --Password=Peter#1652      |   SystemLoginID: SL000015
  ('Sahan', 'b7a5a668225d22ee4feb881e85d247e1728a3b2861ad86e7d3c62326f786047b5d9dc05c634b8d768b41c3bac4d4d872ca2cf668ef1bc0a202d7a40b2c32ca6a', 'AT000015')            --Password=Sahan@1652      |   SystemLoginID: SL000016

  GO

-- ALTERING TABLE TO SUPPORT SALTING / POSSIBLE INCLUDE ATTRIBUTE IN IT--
  ALTER TABLE dbo.[SystemLogin] ADD Cryptography UNIQUEIDENTIFIER

  GO

-- CREATING STORED PROCEDURE spSystemRegister TO ENCRYPT PASSWORDS--
  CREATE PROCEDURE dbo.spSystemRegister
    @UserName VARCHAR(8),
    @Password VARCHAR(30),
    @ServerFeedback VARCHAR(300) OUTPUT
    AS
    BEGIN
      SET NOCOUNT ON
      DECLARE @Cryptography UNIQUEIDENTIFIER=NEWID()
      BEGIN TRY
        -- REFERENCES (Docs.microsoft.com. (2020). HASHBYTES (Transact-SQL) - SQL Server. [online] Available at: https://docs.microsoft.com/en-us/sql/t-sql/functions/hashbytes-transact-sql?view=sql-server-ver15 [Accessed 3 Jan. 2020].)
        INSERT INTO dbo.[SystemLogin] (UserName,Passwordhash,Cryptography)
        VALUES(@UserName, HASHBYTES('SHA2_512', @Password+CAST(@Cryptography AS NVARCHAR(86))),@Cryptography)

        SET @ServerFeedback='Credentials Stored Securely.'

      END TRY
      BEGIN CATCH
        SET @ServerFeedback=ERROR_MESSAGE()
      END CATCH
    END

-- CREATING STORED PROCEDURE spSystemLogin TO READ AND VALIDATE ENCRYPTED  --
  CREATE PROCEDURE dbo.spSystemLogin
    @UserName VARCHAR(8),
    @Password VARCHAR(30),
    @ServerFeedback VARCHAR(300)='' OUTPUT
    AS
    BEGIN

      SET NOCOUNT ON

      DECLARE @SLRecordID INT

      IF EXISTS (SELECT TOP 1 SLRecordID FROM [dbo].[SystemLogin] WHERE UserName=@UserName)
      BEGIN
        SET @SLRecordID=(SELECT SLRecordID FROM [dbo].[SystemLogin] WHERE UserName=@UserName AND PasswordHash=HASHBYTES('SHA2_512', @Password+CAST(Cryptography AS VARCHAR(86))))

        IF(@SLRecordID IS NULL)
          SET @ServerFeedback='INVALID CREDENTIALS, CHECK PASSWORD'
        ELSE
          SET @ServerFeedback='Login Success...'
      END
      ELSE
        SET @ServerFeedback='ACCOUNT NOT FOUND !'

    END
-- TEST DATA FOR ENCRYPTIONS TESTS--
-- SYSTEM LOGIN AND REGISTRATION ENCRYPTION TEST DATA

-- 'spSystemRegister' and 'spSystemLogin' store prodecures testing sample data - BEGIN
  DECLARE @ServerFeedback VARCHAR(300)

  EXEC dbo.spSystemRegister		--INSERTING VALUES
  @UserName = 'Robert',
  @Password = 'rob123',
  @ServerFeedback=@ServerFeedback OUTPUT

  SELECT * FROM [dbo].[SystemLogin]

  EXEC	dbo.spSystemLogin		--TESTING WITH LEGIT VALUES
  @UserName = 'Robert',
  @Password = 'rob123',
  @ServerFeedback=@ServerFeedback OUTPUT

  SELECT	@ServerFeedback as N'@ServerFeedback'

  EXEC	dbo.spSystemLogin		--TESTING WITH FALSE USERNAME
  @UserName = 'hacker',
  @Password = 'root',
  @ServerFeedback=@ServerFeedback OUTPUT

  SELECT	@ServerFeedback as N'@ServerFeedback'

  EXEC	dbo.spSystemLogin		--TESTING WITH FALSE PASSWORD
  @UserName = 'Robert',
  @Password = 'robert123',
  @ServerFeedback=@ServerFeedback OUTPUT

  SELECT	@ServerFeedback as N'@ServerFeedback'
-- 'spSystemRegister' and 'spSystemLogin' store prodecures testing sample data - END

-- CREATING TABLE 26 - systemLoginLoginDateTime  --
  CREATE TABLE SystemLoginLoginDateTime(
  slSystemLoginID char(8),
  LoginDateTime TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (slSystemLoginId, LoginDateTime)
  CONSTRAINT FK_SL_SystemLoginID FOREIGN KEY (slSystemLoginId) REFERENCES SystemLogin(SystemLoginID)
  )

  GO

-- INSERTING INTO TABLE 26 - SystemLoginLoginDateTime  --
  INSERT INTO SystemLoginLoginDateTime(slSystemLoginID) VALUES
  ('SL000000'),
  ('SL000001'),
  ('SL000002'),
  ('SL000003'),
  ('SL000004'),
  ('SL000005'),
  ('SL000006'),
  ('SL000007'),
  ('SL000008'),
  ('SL000009'),
  ('SL000010'),
  ('SL000011'),
  ('SL000012'),
  ('SL000013'),
  ('SL000014'),
  ('SL000015')

GO

-- CREATING TABLE 27 - systemLoginLogoutDateTime  --
  CREATE TABLE SystemLoginLogoutDateTime(
  slSystemLoginID char(8),
  LogoutDateTime TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (slSystemLoginId,LoginDateTime)
  CONSTRAINT FK_SLLDT_SystemLoginID FOREIGN KEY (slSystemLoginId) REFERENCES SystemLogin(SystemLoginID)
  )

  GO

-- INSERTING INTO TABLE 27 - SystemLoginLogoutDateTime  --
  INSERT INTO SystemLoginLogoutDateTime(slSystemLoginID) VALUES
  ('SL000000'),
  ('SL000001'),
  ('SL000002'),
  ('SL000003'),
  ('SL000004'),
  ('SL000005'),
  ('SL000006'),
  ('SL000007'),
  ('SL000008'),
  ('SL000009'),
  ('SL000010'),
  ('SL000011'),
  ('SL000012'),
  ('SL000013'),
  ('SL000014'),
  ('SL000015')

GO

-- CREATING TABLE 28 - UndergraduateStudents --
  CREATE TABLE UndergraduateStudents(
  UGRecordID int IDENTITY(1,1) Not Null,
  UGStudentID AS CAST('UG' + RIGHT('000000' + CAST(UGRecordID AS VARCHAR(6)), 6) AS CHAR(8)) PERSISTED,
  sNationalInsuranceNumber varchar(10),
  msMembershipStatusID Varchar(10),
  FirstName Varchar(20) Not Null,
  MiddleName Varchar(20) Not Null,
  LastName varchar(30) Not Null,
  sgGenderID char(8),
  DateOfBirth date Not Null,
  ucUniversityID_EnrolledTo char(8),
  EstimatedProgramCompletionDate date Not Null,
  pPropertyID char(8),
  csEmployeeID_RegisteredBy char(8),
  RegistrationDateTime TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  slSystemLoginID Char(8),
  PRIMARY KEY (UGStudent⁯ID, sNationalInsuranceNumber, UGRecordID),
  CONSTRAINT FK_US_SC FOREIGN KEY (sNationalInsuranceNumber) REFERENCES LocationAddress(StudentContact),
  CONSTRAINT FK_US_MS FOREIGN KEY (msMembershipStatusID) REFERENCES StudentType(MembershipStatus),
  CONSTRAINT FK_US_SG FOREIGN KEY (sgGenderID) REFERENCES StudentType(StudentGender),
  CONSTRAINT FK_US_UC FOREIGN KEY (ucUniversityID_EnrolledTo) REFERENCES StudentType(UniversityContact),
  CONSTRAINT FK_US_CS FOREIGN KEY (csEmployeeID_RegisteredBy) REFERENCES StudentType(CustomerService),
  CONSTRAINT FK_US_P FOREIGN KEY (pPropertyID) REFERENCES StudentType(Property),
  CONSTRAINT FK_US_SL FOREIGN KEY (slSystemLoginID) REFERENCES StudentType(SystemLoginID)
  )

  GO

-- INSERTING INTO TABLE 28 - UndergraduateStudent  --
INSERT INTO UndergraduateStudent(sNationalInsuranceNumber, msMembershipStatusID, FirstName, MiddleName, LastName, sgGenderID, DateOfBirth, UcUniversityID_EnrolledTo, EstimatedProgramCompletionDate, pPropertyID, csEmployeeID_RegisteredBY, slSystemLoginID) VALUES
  ('RE7236814K', 'MS000000', 'Allyson', 'Claude', 'Clay', 'SG000000', 12/08/1995, 'UCL', '12/06/2022', 'P0000001', 'EMP00000', 'SL000000'),
  ('YK1684975O', 'MS000001', 'Tyler', 'Damien', 'Williams', 'SG000001', 13/02/2000,'UCL', '13/01/2023', 'P0000002', 'EMP00001', 'SL000001'),
  ('PL6413846L', 'MS000002', 'Kent', 'Troy', 'Robbins', 'SG000002', 26/01/1997, 'OU', '01/04/2019', 'P0000003', 'EMP00002', 'SL000002'),
  ('IT8943215P', 'MS000003', 'Obrien', 'Arden', 'Murphy', 'SG000003', 20/01/1998, 'PU', '02/06/2020', 'P0000004','EMP00003', 'SL000003'),
  ('OK4592194U', 'MS000004', 'Walter', 'Dex', 'Flynn', 'SG000004', 15/06/1994, 'UCL', '01/06/2019', 'P0000005', 'EMP00004', 'SL000004'),
  ('DS4982135K', 'MS000005', 'Cole', 'Cody', 'Baxter', 'SG000005', 17/02/1999, 'CAM', '13/01/2023', 'P0000006', 'EMP00005', 'SL000005'),
  ('LA4862134B', 'MS000006', 'Ellis', 'Apollo', 'Glenn', 'SG000006', 31/12/2000, 'OU', '01/04/2019', 'P000007', 'EMP00006', 'SL000006'),
  ('WZ1862347N', 'MS000007', 'Russo', 'Neil', 'Jefferson', 'SG000007', 15/08/2001, 'OU', '02/06/2020', 'P0000008', 'EMP00007', 'SL000007'),
  ('JK9453128M', 'MS000008', 'Palmer', 'Gabriel', 'Holden', 'SG000008', 19/03/1995, 'UCL', '01/06/2019', 'P0000009', 'EMP00008', 'SL000008'),
  ('FX1846213Y', 'MS000009', 'Adam', 'Warren', 'Johnson', 'SG000009', 24/09/1994, 'PU', '13/01/2020', 'P0000010', 'EMP00009', 'SL000009'),
  ('SX1682314T', 'MS000010', 'Gordon', 'Dominick', 'Schultz', 'SG000010', 23/01/1999, 'CAM', '01/04/2021', 'P0000011', 'EMP00010', 'SL000010'),
  ('UT1384621P', 'MS000011', 'Pratt', 'Arthur', 'Ferrell', 'SG000011', 05/05/1995, 'UCL', '02/06/2023', 'P0000012', 'EMP00011', 'SL000011'),
  ('VL1682135E', 'MS000012', 'Richard', 'Thomas', 'Barker', 'SG000012', 06/01/1997, 'PU', '01/06/2020', 'P0000013', 'EMP00012', 'SL000012'),
  ('PO5167489R', 'MS000012', 'Solomon', 'Beck', 'Edwards', 'SG000013', 03/08/1998, 'OU', '02/06/2019', 'P0000014', 'EMP00013', 'SL000013'),
  ('KU5814397Q', 'MS000013', 'Jordan', 'Tyson', 'Marshall', 'SG000014', 25/01/1996, 'CAM', '01/06/2021', 'P0000015', 'EMP00014', 'SL000014'),
  ('LA6123542H', 'MS000014', 'Adams', 'Paul', 'Harris', 'SG000015',07/02/1997, 'PU', '26/03/2021', 'P0000015', 'EMP00015', 'SL000015')

GO

-- CREATING TABLE 29 - PostgraduateStudents  --
  CREATE TABLE PostgraduateStudents(
  PRecordID int IDENTITY(1,1) Not Null,
  PStudentID AS CAST('PS' + RIGHT('000000' + CAST(PRecordID AS VARCHAR(6)), 6) AS CHAR(8)) PERSISTED,
  sNationalInsuranceNumber varchar(10),
  msMembershipStatusID Varchar(10),
  FirstName Varchar(20) Not Null,
  MiddleName Varchar(20) Not Null,
  LastName varchar(30) Not Null,
  sgGenderID char(8),
  DateOfBirth date Not Null,
  ucUniversityID_EnrolledTo char(8),
  EstimatedProgramCompletionDate date Not Null,
  EmployerName Varchar(20),
  EmployerContactNumber int(10),
  pPropertyID char(8),
  csEmployeeID_RegisteredBy char(8),
  RegistrationDateTime TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  slSystemLoginID Char(8),
  PRIMARY KEY (PGStudent⁯ID, sNationalInsuranceNumber, PRecordID),
  CONSTRAINT FK_PG_SC FOREIGN KEY (sNationalInsuranceNumber) REFERENCES LocationAddress(StudentContact),
  CONSTRAINT FK_PG_MS FOREIGN KEY (msMembershipStatusID) REFERENCES StudentType(MembershipStatus),
  CONSTRAINT FK_PG_SG FOREIGN KEY (sgGenderID) REFERENCES StudentType(StudentGender),
  CONSTRAINT FK_PG_UC FOREIGN KEY (ucUniversityID_EnrolledTo) REFERENCES StudentType(UniversityContact),
  CONSTRAINT FK_PG_P FOREIGN KEY (pPropertyID) REFERENCES StudentType(Property),
  CONSTRAINT FK_PG_CS FOREIGN KEY (csEmployeeID_RegisteredBy) REFERENCES StudentType(CustomerService),
  CONSTRAINT FK_PG_SL FOREIGN KEY (slSystemLoginID) REFERENCES StudentType(SystemLoginID)
  )

  GO

-- INSERTING INTO TABLE 29 - PostgraduateStudent  --
  INSERT INTO PostgraduateStudent(sNationalInsuranceNumber, msMembershipStatusID, FirstName, MiddleName, LastName, sgGenderID, DateOfBirth, UcUniversityID_EnrolledTo, EstimatedProgramCompletionDate, EmployerName, EmployerContactNumber, pPropertyID, csEmployeeID_RegisteredBY, slSystemLoginID) VALUES
  ('BA4601426V', 'MS000000', 'Andrew', 'Larry', 'Sirisena', 'SG000000',15/02/1996, 'UCL', 12/06/2021,'Oshan', 0761384972, 'P0000000', 'EMP00000', 'SL000000'),
  ('TF0347891G', 'MS000001', 'Ranga', 'Jerad', 'Ekanayake', 'SG000001', 31/01/1998, 'CAM', 06/12/2022,' Ashane', '0713648921', 'P0000001', 'EMP00001','SL000001'),
  ('YU6719854J', 'MS000002', 'Pasindu', 'Stevyn', 'Ekanayake', 'SG000002', 01/03/1993, 'PU',15/04/2025,'Chaminda', '0724598312', 'P0000002', 'EMP0000', 'SL000002'),
  ('OP1385147L', 'MS000003', 'Kalani', 'Ana', 'Thomas', 'SG000003', 19/01/1999, 'PU', 09/06/2023, 'Chamara', 0764893214, P0000003, 'EMP00003', 'SL000003'),
  ('UA3851769Q', 'MS000004', 'Peter', 'Quinn', 'Bandara', 'SG000004', 12/09/1997, 'OU', 01/07/2024, 'Athula', 0726489513, 'P0000004', 'EMP00004', 'SL000004'),
  ('WC1648315L', 'MS000005', 'Sahan', 'Mason', 'Brady', 'SG000005', 03/01/1995, 'OU', 19/09/2022, 'Sandun',0794846315 ,'P0000005', 'EMP00005', 'SL000005'),
  ('ZJ1148621H', 'MS000006', 'Gihan', 'Bryce', 'Correa', 'SG000006', 11/04/1994, 'PU', 18/01/2025, 'Nuwan',0761279451 ,'P0000006', 'EMP00006','SL000006'),
  ('UP5138452Y', 'MS000007', 'Tharindu', 'Ray', 'Gardner', 'SG000007', 13/07/1997, 'UCL', 20/04/2021, 'Tharindu', 0729475312, 'P0000007', 'EMP00007', 'SL000007'),
  ('RS2178451G', 'MS000008', 'Gamini', 'Willow', 'Parker', 'SG000008', 28/08/1996, 'PU', 22/06/2023, 'Pavan', 0721498356, 'P0000008', 'EMP00008', 'SL000008'),
  ('NF2134821H', 'MS000009', 'Sanjeeva', 'Edwin', 'Travis' 'SG000009', 31/12/1999, 'OU', 13/01/2021, 'Rajitha', 0761894213, 'P0000009', 'EMP00009', 'SL000009'),
  ('CG1354821K', 'MS000010', 'Rohan', 'Tristan', 'Houston', 'SG000010', 01/01/1995, 'CAM', 11/08/2021, 'Ramesh', 0721984320, 'P0000010', 'EMP00010', 'SL000010'),
  ('BC1354218N', 'MS000011', 'Nabil', 'Mace', 'Harvey', 'SG000011', 12/08/2001, 'CAM', 13/09/2022, 'Dulan', 0715973458, 'P0000011', 'EMP00011', 'SL000011'),
  ('KJ1382486B', 'MS000012', 'Albert', 'Robert', 'Jayewardene', 'SG000012', 13/04/1998, 'OU', 05/04/2021, 'Marvan',	0765497321, 'P0000012', 'EMP00012', 'SL000012'),
  ('KA3842186V', 'MS000013', 'Ishan', 'Rafael', 'Hugo', 'SG000013', 12/05/1999 , 'PU', 19/09/2023, 'Lavindra', 0719721548, 'P0000013', 'EMP00013', 'SL000013'),
  ('OQ1354891L', 'MS000014', 'Nuran', 'Justin', 'Warren', 'SG000014', 13/02/1996, 'PU', 22/06/2021, 'Banduka',0716284972,  'P0000014', 'EMP00014','SL000014')


GO

-- CREATING TABLE 30 - SECRelationshipToStudent  --
  CREATE TABLE SECRelationshipToStudent(
  RTSIDRecordID int IDENTITY(1,1) Not Null,
  RTSID AS CAST('RTS' + RIGHT('00000' + CAST(RTSIDRecordID AS VARCHAR(6)), 6) AS CHAR(8)) PERSISTED,
  RelationToStudent varchar(10) Not Null,
  PRIMARY KEY (RTSID, RTSIDRecordID)
  )

  GO

  -- INSERTING INTO TABLE 30 - SECRelationshipToStudents --
  INSERT INTO SECRelationshipToStudents(RelationshipToStudents) VALUES
  ('Mother'),
  ('Father'),
  ('Grand Mother'),
  ('Father'),
  ('Brother'),
  ('Mother'),
  ('Sister')

  GO

-- CREATING TABLE 31 - StudentEmergencyContact  --
  CREATE TABLE StudentEmergencyContact(
  SECRecordID int IDENTITY(1,1) Not Null,
  SECID AS CAST('SE' + RIGHT('000000' + CAST(SECRecordID AS VARCHAR(6)), 6) AS CHAR(8)) PERSISTED,
  secrtsRTSID char(8),
  FirstName Varchar(20) Not Null,
  MiddleName Varchar(20) Not Null,
  LastName varchar(30) Not Null,
  LaneAddress varchar(20) Not Null,
  laLocationAreaId char(8),
  sNationalInsuranceNumber varchar(10),
  PRIMARY KEY (SECID, SECRecordID),
  CONSTRAINT FK_SECrts_RTSID FOREIGN KEY (secrtsRTSID) REFERENCES StudentType(SECRelationshipToStudents),
  CONSTRAINT FK_LA_AreaID FOREIGN KEY (laLocationAreaId) REFERENCES StudentType(LocationArea),
  CONSTRAINT FK_SC_NSNumber FOREIGN KEY (sNationalInsuranceNumber) REFERENCES StudentType(StudentContact)
  )

  GO

-- INSERTING INTO TABLE 31 - StudentEmergencyContact  --
INSERT INTO StudentEmergencyContact(sertsRTSID, FirstName, MiddleName, LastName, LaneAddress, laLocationAreaID, sNationallInsuranceNumber) VALUES
  ('SE000000', 'Jessica', 'Kim', 'Blake','cental park Rd', 'LA000000', 'AF0861147M'),
  ('SE000001', 'Marvan', 'Donald', 'Norton','Hamer''s Ave', 'LA000001', 'HT0154389X'),
  ('SE000002', 'Gerard', 'Marshall', 'Maxwell','Fonseka Pl', 'LA000002', 'QR9842138V'),
  ('SE000003', 'Vishal', 'Rex', 'Matthews', 'Galle Rd', 'LA000003', 'KO9824338L'),
  ('SE000004', 'Carl', 'Robin', 'Fuller', 'Jayasinghe Rd', 'LA000004', 'AX7614238Y'),
  ('SE000005', 'Andrew', 'Bill', 'Hunter', 'Havelock Rd', 'LA000005', 'GT6431879T'),
  ('SE000006', 'Evan', 'Paul', 'Reeves', 'Kinross Ave', 'LA000006', 'HJ8249731B'),
  ('SE000007', 'Lorenzo', 'Collins', 'Peters','Colombo - Galle Main Rd',  'LA000007','TX9724613E'),
  ('SE000008', 'Chathura', 'Rolando', 'Burton', 'Arethusa Ln', 'LA000008', 'UV6741928R'),
  ('SE000009', 'Naveen', 'Stephen', 'Jackson', 'Alan Mathiniyarama Rd', 'LA000009', 'VA8461237T'),
  ('SE000010', 'Mira', 'Katrina', 'Lynch', 'Alan Mathiniyarama Rd', 'LA000010', 'QV7861432O'),
  ('SE000011', 'Nancy', 'Morgan', 'Greer', 'E S Fernando Mawatha', 'LA000011', 'UI71383104G'),
  ('SE000012', 'Fernando', 'Tim', 'Richardson', 'Girton School Rd', 'LA000012', 'QU1659413L'),
  ('SE000013', 'Dianna', 'Tiffany', 'Norris', 'Jayasinghe Rd', 'LA000013', 'SA4831428M'),
  ('SE000014', 'Allen', 'Wade', 'Bradley', 'Kirillapone Masjid Rd', 'LA000014', 'DQ8412641K'),
  ('SE000015', 'Ben', 'Bruce', 'Wayne', 'Kothalawala Gardens', 'LA000015', 'WR8312021L')

GO

-- TABLE 32 to TABLE 45 is not there --

GO

-- CREATING TABLE 46 - CustomerService_VerifyStudentEnrollment  --
  CREATE TABLE CustomerService_VerifyStudentEnrollment(
  csEmployeeID_VerifiedBy char(8) Not Null,
  ucUniversityID char(8) NOT NULL,
  VerificationDateTime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (csEmployeeID_VerifiedBy,ucUniversityID),
  CONSTRAINT FK_CVSEU_UniversityID FOREIGN KEY (ucUniversityID) REFERENCES UniversityContact(UniversityID),
  CONSTRAINT FK_CVSEU_EmployeeID_VerifiedBy FOREIGN KEY (csEmployeeID_VerifiedBy) REFERENCES CustomerService(EmployeeID),

  )


  GO

  INSERT INTO CustomerService_VerifyStudentEnrollment(csEmployeeID_VerifiedBy,ucUniversityID,VerificationDateTime) VALUES  --need to add comments
  ('EMP00001','OU000000','2019-01-17'),--check the parent table for values
  ('EMP00003','OU000000','2018-02-15'),
  ('EMP00004','00000000','2018-05-13'),
  ('EMP00006','00000000','2018-03-15'),
  ('EMP00040','00000000','2020-01-01')
  ('EMP00040','00000000',''),--check the parent table for values
  ('EMP00039','00000000','2018-11-02'),
  ('EMP00025','00000000',''),
  ('EMP00025','00000000',''),
  ('EMP00025','00000000','2017-03-23')
  ('EMP00001','00000000','2018-11-30'),--check the parent table for values
  ('EMP00003','00000000',''),
  ('EMP00004','00000000','2019-11-20'),
  ('EMP00006','00000000','2019-10-20'),
  ('EMP00040','00000000','2018-12-15')


  Go

-- CREATING TABLE 47 - RequestViewing --
  CREATE TABLE RequestViewing(
  scNationalInsuranceNumber_RequestedBy char(8) Not Null,
  pPropertyID char(8) NOT NULL,
  csEmployeeID char(8),
  RequestedDateTime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (scNationalInsuranceNumber_RequestedBy,pPropertyID),
  CONSTRAINT FK_RV_NationalInsuranceNumbe FOREIGN KEY (scNationalInsuranceNumber_RequestedBy) REFERENCES LocationAddress(LocationAddressID),
  CONSTRAINT FK_RV_PropertyID FOREIGN KEY (pPropertyID) REFERENCES Property(PropertyID),
  CONSTRAINT FK_RV_EmployeeID FOREIGN KEY (csEmployeeID) REFERENCES CustomerService(EmployeeID)
  )

  GO

  INSERT INTO RequestViewing(csEmployeeID_VerifiedBy,ucUniversityID,VerificationDateTime) VALUES  --need to add comments
  ('00000000','00000000',''),--check the parent table for values
  ('00000000','00000000','2018-02-15'),
  ('00000000','00000000','2018-05-13'),
  ('00000000','00000000',''),--check the parent table for values
  ('00000000','00000000','2018-02-15'),
  ('00000000','00000000','2018-05-13'),
  ('00000000','00000000',''),--check the parent table for values
  ('00000000','00000000',''),
  ('00000000','00000000','2018-05-13'),
  ('00000000','00000000','2019-01-17'),--check the parent table for values
  ('00000000','00000000','2018-02-15'),
  ('00000000','00000000','2018-05-13'),
  ('00000000','00000000','2019-01-17'),--check the parent table for values
  ('00000000','00000000',''),
  ('00000000','00000000','')

  GO

-- CREATING TABLE 48 - CustomerService_AlertRequestingView_LandLord  --
  CREATE TABLE CustomerService_AlertRequestingView_LandLord(
  csEmployeeID_AlertedBY char(8),
  lcNationalInsuranceNumber char(8),
  AlertDateTime TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (csEmployeeID_AlertedBY,lcNationalInsuranceNumber),
  CONSTRAINT FK_CSARVL_EmployeeID FOREIGN KEY (csEmployeeID_AlertedBY) REFERENCES StudentType(SECRelationshipToStudents),
  CONSTRAINT FK_CSARVL_NINumber FOREIGN KEY (lcNationalInsuranceNumber) REFERENCES StudentType(LocationArea)
  )

  GO

  -- INSERTING INTO TABLE 48 - CustomerService_AlertRequestingView_Landlord  --
INSERT INTO CustomerService_AlertRequestingView_Landlord(csEmployeeID_AlertedBy,lcNationalInsuranceNumber) VALUES
('EMP00000', 'SA0246842B'),
('EMP00001', 'JE4613846H'),
('EMP00002', 'PL6128841J'),
('EMP00003', 'YR1348264J'),
('EMP00004', 'KA1423684G'),
('EMP00005', 'PL4513847F'),
('EMP00006', 'WA1254863G'),
('EMP00007', 'AF4628476B'),
('EMP00008', 'KA8542614T'),
('EMP00009', 'TB5214867B'),
('EMP00010', 'LA4842167G'),
('EMP00011', 'UY2146823H'),
('EMP00012', 'FD6214384G'),
('EMP00013', 'RA2468712P'),
('EMP00014', 'XD4621384F'),
('EMP00015', 'DG2648216L')


GO

-- CREATING TABLE 49 - ViewingProperty  --
  CREATE TABLE ViewingProperty(
  scNationalInsuranceNumber varchar(10),
  pPropertyID char(8),
  vdViewingID char(8),
  PRIMARY KEY (pPropertyID,scNationalInsuranceNumber,vdViewingID),
  CONSTRAINT FK_VP_NINumber FOREIGN KEY (scNationalInsuranceNumber) REFERENCES StudentType(StudentContact),
  CONSTRAINT FK_VP_PropertyID FOREIGN KEY (pPropertyID) REFERENCES StudentType(Property),
  CONSTRAINT FK_VP_ViewingID FOREIGN KEY (vdViewingID) REFERENCES StudentType(ViewingDEtails)
  )

  GO

  -- INSERTING INTO TABLE 49 - ViewingProperty  --
INSERT INTO ViewingProperty(scNationalInsuranceNumber,pPropertyID,vdViewingID) VALUES
('BA4601426V','P0000000', 'V0000000'),
('TF0347891G','P0000001', 'V0000001'),
('YU6719854J','P0000002', 'V0000002'),
('OP1385147L','P0000003', 'V0000003'),
('UA3851769Q','P0000004', 'V0000004'),
('WC1648315L','P0000005', 'V0000005'),
('ZJ1148621H','P0000006', 'V0000006'),
('UP5138452Y','P0000007', 'V0000007'),
('RS2178451G','P0000008', 'V0000008'),
('RE7236814K','P0000009', 'V0000009'),
('YK1684975O','P0000010', 'V0000010'),
('PL6413846L','P0000011', 'V0000011'),
('IT8943215P','P0000012', 'V0000012'),
('OK4592194U','P0000013', 'V0000013'),
('DS4982135K','P0000014', 'V0000014'),
('LA4862134B','P0000015', 'V0000015')

-- TABLE 50 to TABLE 53 is not there  --
