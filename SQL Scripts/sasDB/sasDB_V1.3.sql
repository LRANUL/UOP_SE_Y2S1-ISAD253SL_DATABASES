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
  PRIMARY KEY (NationalInsuranceNumber),
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

INSERT INTO MembershipStatus (MembershipStatus) VALUES
('Active'),  -- MembershipStatusID: MS000001
('Dormant')  -- MembershipStatusID: MS000002

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
  PropertyTypeID AS CAST('PT' + RIGHT('000000' + CAST(PropertyTypeID AS VARCHAR(6)), 6) AS CHAR(8)) PERSISTED,
  PropertyType varchar(30) NOT NULL,
  PRIMARY KEY (PropertyTypeID, PTRecordID),
  
)

GO

INSERT INTO PropertyType (PropertyType) VALUES --need to add comments
('Flat'),
('Terraced House'),
('Detached House')


GO

-- CREATING TABLE 13 - PropertyAreaType --
CREATE TABLE PropertyAreaType(
  PRecordID int IDENTITY(1,1), -- int
  PropertyAreaTypeID AS CAST('PAT' + RIGHT('00000' + CAST(PropertyAreaTypeID AS VARCHAR(5)), 5) AS CHAR(8)) PERSISTED,
  PropertyAreaType char(30) NOT NULL,
  PRIMARY KEY (PropertyAreaTypeID, PRecordID),
)

GO


INSERT INTO PropertyAreaType (PropertyAreaType) VALUES  --need to add comments
('Urban'),
('suburban'),
('rural'),
('exurban'),
('residential ')


GO



-- CREATING TABLE 14 - RentAmount --
CREATE TABLE RentAmount(
  RARecordID char IDENTITY(1,1),
  RentAmountID AS CAST('RA' + RIGHT('000000' + CAST(RentAmountID AS VARCHAR(6)), 6) AS CHAR(8)) PERSISTED,
  RentAmount money NOT NULL,
  PRIMARY KEY (RentAmountID, RARecordID),
)


GO

INSERT INTO RentAmount(RentAmount) VALUES  --need to add comments
(''),
(''),
(''),
(''),
('')


GO



--  MADRecordID INT IDENTITY(1,1),
--  MembershipStatusID AS CAST('MS' + RIGHT('000000' + CAST(MADRecordID AS VARCHAR(6)), 6) AS CHAR(8)) PERSISTED,

-- CREATING TABLE 15 -PropertyContact --
CREATE TABLE PropertyContact(
  PCRecordID int IDENTITY(1,1),
  PropertyContactID AS CAST('PC' + RIGHT('000000' + CAST(PCRecordID AS VARCHAR(6)), 6) AS CHAR(8)) PERSISTED,
  laddLocationAddressID char(8),
  PRIMARY KEY (PropertyContactID, PCRecordID),
  CONSTRAINT FK_PC_LocationAddressID FOREIGN KEY (laddLocationAddressID) REFERENCES LocationAddress(LocationAddressID),
  CONSTRAINT CHK_PC_LocationAddressID CHECK (LEN(laddLocationAddressID) = 8)
)

GO

LADDRecordID INT IDENTITY(1,1),
LocationAddressID AS CAST('LAD' + RIGHT('00000' + CAST(LADDRecordID AS VARCHAR(5)), 5) AS CHAR(8)) PERSISTED,

in some places you would have to use this, there are 3 characters here

-- CREATING TABLE 16 - Property --
CREATE TABLE Property(
  
  PRecordID int IDENTITY(1,1),
  PropertyID AS CAST('PP' + RIGHT('000000' + CAST(PRecordID AS VARCHAR(6)), 6) AS CHAR(8)) PERSISTED,
  
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
-- CREATING TABLE 17 - PropertyOtherFacilities  --
CREATE TABLE PropertyOtherFacilities(
  pPropertyID char(8) Not Null,
  OtherFacilities varchar(100) NOT NULL,
  PRIMARY KEY (pPropertyID,OtherFacilities),
  CONSTRAINT FK_POF_PropertyID FOREIGN KEY (pofPropertyID) REFERENCES Property(PropertyID),
  CONSTRAINT CHK_P_PropertyID CHECK (LEN(pPropertyID) = 8)
)

GO




-- CREATING TABLE 18 - PropertyFlatFloorNumber  --
CREATE TABLE PropertyFlatFloorNumber(
  PFFNRecordID int IDENTITY(1,1),
  FloorNumberID char(8) NOT NULL IDENTITY(1,1),
  FloorNumber varchar(2) NOT NULL,
  PRIMARY KEY (FloorNumberID, PFFNRecordID),
)



GO


-- CREATING TABLE 19 - PropertyStatus  --
CREATE TABLE PropertyStatus(
  PSRecordID int IDENTITY(1,1),
  StatusID char(8) NOT NULL IDENTITY(1,1),
  Status varchar(12) NOT NULL,
  PRIMARY KEY (StatusID, PSRecordID),
)


GO


-- CREATING TABLE 20 - PropertyFlat --
CREATE TABLE PropertyFlat(
  PFRecordID int IDENTITY(1,1),
  PFPropertyID char(8)  IDENTITY(1,1),
  pPropertyID char(8),
  pffFloorNoID char(8),
  psStatusID int(8),
  PRIMARY KEY (PFPropertyID, PFRecordID),
  CONSTRAINT FK_PF_PropertyID FOREIGN KEY (PropertyID) REFERENCES Property(PropertyID),
  CONSTRAINT FK_PF_FloorNoID FOREIGN KEY (patPropertyAreaTypeID) REFERENCES PropertyFlatFloor(FloorNumberID),
  CONSTRAINT FK_PF_StatusID FOREIGN KEY (psStatusID) REFERENCES PropertyStatus(StatusID),
  CONSTRAINT CHK_PF_pPropertyID CHECK (LEN(pPropertyID) = 8),
  CONSTRAINT CHK_PF_pffFloorNoID CHECK (LEN(pffFloorNoID) = 8),
  CONSTRAINT CHK_PF_psStatusID CHECK (LEN(psStatusID) = 8),
  
)


GO
-- CREATING TABLE 21 - PropertyTerracedHouseType --
CREATE TABLE PropertyStatus(
  PTHTRecordID INT IDENTITY(1,1),
  TypeID char(8) NOT NULL IDENTITY(1,1),
  Type varchar(12) NOT NULL,
  PRIMARY KEY (PTHTRecordID, TypeID),
)

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

-- CREATING TABLE 23 - PropertDetachedHouse --
CREATE TABLE PropertDetachedHouse(
  PDHRecordID int IDENTITY(1,1) Not Null,
  PDHPropertyID AS CAST('PD' + RIGHT('000000' + CAST(PDHRecordID AS VARCHAR(6)), 6) AS CHAR(8)) PERSISTED,
  pPropertyID char(8),
  psStatusID char(8),
  NoOfFloors Not Null,
  PRIMARY KEY (PDHPropertyID, pPropertyID, PDHRecordID),
  CONSTRAINT FK_PDH_PropertyID FOREIGN KEY (pPropertyID) REFERENCES LocationAddress(Property),
  CONSTRAINT FK_PDH_StatusID FOREIGN KEY (psStatusID) REFERENCES StudentType(PropertyStatus)
)

GO

-- CREATING TABLE 24 - SystemLoginAccountType  --
CREATE TABLE SystemLoginAccountType(
  SLATRecordID int IDENTITY(1,1)  Not Null,
  AccountTypeID char(8),
  AccountType char(8) Not Null,
  PRIMARY Key(AccountTypeID)
)

GO

-- CREATING TABLE 25 - SystemLogin  --
CREATE TABLE SystemLogin(
  SLRecordID int IDENTITY(1,1),
  SystemLoginID AS CAST('SL' + RIGHT('000000' + CAST(SLRecordID AS VARCHAR(6)), 6) AS CHAR(8)) PERSISTED,
  UserName varchar(8) Not Null UNIQUE,  --SETTED USER NAME AS UNIQUE TO PREVENT DATA DUPLICATION (RANUL)
  Passwordhash Binary(64) Not Null,
  slatAccountTypeID char(8),
  CreationDateTime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, --UPDATED TO DATETIME TO WORK WITH MSSQL (RANUL)
  PRIMARY KEY (SLRecordID, SystemLoginID),
  CONSTRAINT FK_SL_AccountypeID FOREIGN KEY (slatAccountTypeID) REFERENCES SystemLoginAccountType(AccountTypeID)
)

GO

-- ALTERING TABLE TO SUPPORT SALTING / POSSIBLE INCLUDE ATTRIBUTE IN IT
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
-- REFERENCES (https://docs.microsoft.com/en-us/sql/t-sql/functions/hashbytes-transact-sql?view=sql-server-ver15)
INSERT INTO dbo.[SystemLogin] (UserName,Passwordhash,Cryptography)
VALUES(@UserName, HASHBYTES('SHA2_512', @Password+CAST(@Cryptography AS NVARCHAR(86))),@Cryptography)

SET @ServerFeedback='Credentials Stored Securely.'

END TRY
BEGIN CATCH
SET @ServerFeedback=ERROR_MESSAGE() 
END CATCH
END
-- CREATING STORED PROCEDURE spSystemLogin TO READ AND VALIDATE ENCRYPTED PASSWORDS--
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

-- CREATING TABLE 26 - systemLoginLoginDateTime  --
CREATE TABLE SystemLoginLoginDateTime(
  slSystemLoginID char(8),
  LoginDateTime TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (slSystemLoginId, LoginDateTime)
  CONSTRAINT FK_SL_SystemLoginID FOREIGN KEY (slSystemLoginId) REFERENCES SystemLogin(SystemLoginID)
)

GO

-- CREATING TABLE 27 - systemLoginLogoutDateTime  --
CREATE TABLE SystemLoginLogoutDateTime(
  slSystemLoginID char(8),
  LogoutDateTime TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (slSystemLoginId,LoginDateTime)
  CONSTRAINT FK_SLLDT_SystemLoginID FOREIGN KEY (slSystemLoginId) REFERENCES SystemLogin(SystemLoginID)
)

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

-- CREATING TABLE 30 - SECRelationshipToStudent  --
CREATE TABLE SECRelationshipToStudent(
  RTSIDRecordID int IDENTITY(1,1) Not Null,
  RTSID AS CAST('RTS' + RIGHT('00000' + CAST(RTSIDRecordID AS VARCHAR(6)), 6) AS CHAR(8)) PERSISTED,
  RelationToStudent varchar(10) Not Null,
  PRIMARY KEY (RTSID, RTSIDRecordID)
)

GO

-- CREATING TABLE 31 - StudentEmergencyContact  --
CREATE TABLE StudentEmergencyContact(
  SECRecordID int IDENTITY(1,1) Not Null,
  SECID CAST('SE' + RIGHT('000000' + CAST(SECRecordID AS VARCHAR(6)), 6) AS CHAR(8)) PERSISTED,
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


-- CREATING TABLE 46 - CustomerService_VerifyStudentEnrollment  --
CREATE TABLE CustomerService_VerifyStudentEnrollment(
  csEmployeeID_VerifiedBy char(8) Not Null,
  ucUniversityID char(8) NOT NULL,
  VerificationDateTime datetime,
  PRIMARY KEY (csEmployeeID_VerifiedBy,ucUniversityID),
  CONSTRAINT FK_CVSEU_UniversityID FOREIGN KEY (ucUniversityID) REFERENCES UniversityContact(UniversityID),
  CONSTRAINT FK_CVSEU_EmployeeID_VerifiedBy FOREIGN KEY (csEmployeeID_VerifiedBy) REFERENCES CustomerService(EmployeeID),
  
)



Go


-- CREATING TABLE 47 - RequestViewing --
CREATE TABLE RequestViewing(
  scNationalInsuranceNumber_RequestedBy char(8) Not Null,
  pPropertyID char(8) NOT NULL,
  csEmployeeID char(8),
  RequestedDateTime datetime,
  PRIMARY KEY (scNationalInsuranceNumber_RequestedBy,pPropertyID,),
  CONSTRAINT FK_RV_NationalInsuranceNumbe FOREIGN KEY (scNationalInsuranceNumber_RequestedBy) REFERENCES LocationAddress(LocationAddressID),
  CONSTRAINT FK_RV_PropertyID FOREIGN KEY (pPropertyID) REFERENCES Property(PropertyID),
  CONSTRAINT FK_RV_EmployeeID FOREIGN KEY (csEmployeeID) REFERENCES CustomerService(EmployeeID)
  
)


GO

-- CREATING TABLE 48 - CustomerService_AlertRequestingView_LandLord  --
CREATE TABLE CustomerService_AlertRequestingView_LandLord(
  csEmployeeID_AlertedBY char(8),
  lcNationalInsuranceNumber char(8),
  AlertDateTime DateTime Not Null,
  PRIMARY KEY (csEmployeeID_AlertedBY,lcNationalInsuranceNumber),
  CONSTRAINT FK_CSARVL_EmployeeID FOREIGN KEY (csEmployeeID_AlertedBY) REFERENCES StudentType(SECRelationshipToStudents),
  CONSTRAINT FK_CSARVL_NINumber FOREIGN KEY (lcNationalInsuranceNumber) REFERENCES StudentType(LocationArea)
)

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
