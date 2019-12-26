CREATE TABLE [Credentials] (
  [Email] varchar(50),
  [LoginName] varchar(30),
  [PasswordHash] binary(64),
  [UserType] varchar(15),
  [Person_ID] varchar(15),
  PRIMARY KEY ([LoginName])
);

CREATE INDEX [PK,FK] ON  [Credentials] ([Email]);

CREATE INDEX [FK] ON  [Credentials] ([Person_ID]);

CREATE TABLE [Fee] (
  [LandLord_ID] varchar(7),
  [Fee_ID] int,
  [FeeType] varchar(15),
  [Property_ID] varchar(7),
  [Amount] smallmoney,
  PRIMARY KEY ([Fee_ID])
);

CREATE INDEX [FK] ON  [Fee] ([LandLord_ID], [Property_ID]);

CREATE TABLE [Property] (
  [LandLord_ID] varchar(7),
  [Property_ID] varchar(7),
  [Type] varchar(40),
  [MaxTenants] smallint,
  [Rent] money,
  [Available] char(1),
  PRIMARY KEY ([Property_ID])
);

CREATE INDEX [PK,FK] ON  [Property] ([LandLord_ID]);

CREATE TABLE [Address] (
  [Unique_ID] varchar(7),
  [AddressType] varchar(7),
  [StreetNo] varchar(7),
  [StreetName] varchar(150),
  [City] varcahr(58),
  [Zip] varchar(8),
  [County] varchar(26)
);

CREATE INDEX [FK] ON  [Address] ([Unique_ID]);

CREATE TABLE [LoginActivity] (
  [LoginName] varchar(30),
  [Email] varchar(50),
  [LoginTime] timedate,
  [PersonID] varchar(7),
  PRIMARY KEY ([LoginName])
);

CREATE INDEX [FK] ON  [LoginActivity] ([Email], [PersonID]);

CREATE TABLE [LandLord] (
  [LandLord_ID] varchar(7),
  [FirstName] varchar(20),
  [MiddleName] varchar(30),
  [LastName] varchar(50),
  [NINO] varchar(9),
  [Mobile] char(10),
  [Landline] varchar(10),
  [PropertyID] varchar(7),
  [Email] varchar(50),
  PRIMARY KEY ([LandLord_ID])
);

CREATE INDEX [FK] ON  [LandLord] ([PropertyID]);

CREATE TABLE [Partner] (
  [Request_ID] varchar(7),
  [P1StudentEmail] varchar(50),
  [P1StudentNINO] varchar(9),
  [P2StudentEmail] varchar(50),
  [P2StudentNINO] varchar(9),
  [P3StudentEmail] varchar(50),
  [P3StudentNINO] varchar(9),
  [P4StudentEmail] varchar(50),
  [P4StudentNINO] varchar(9)
);

CREATE INDEX [FK] ON  [Partner] ([Request_ID]);

CREATE TABLE [CustomerService] (
  [Employee_ID] varchar(7),
  [FirstName] varchar(20),
  [MiddleName] varchar(30),
  [LastName] varchar(50),
  [NINO] varchar(9),
  [Email] varchar(50),
  PRIMARY KEY ([Employee_ID])
);

CREATE TABLE [Student] (
  [Student_ID] varchar(7),
  [FirstName] varchar(20),
  [MiddleName] varchar(30),
  [LastName] varchar(500),
  [Mobile] char(10),
  [DateOfBirth] date,
  [Gender] char(1),
  [Email] varchar(50),
  PRIMARY KEY ([Student_ID])
);

CREATE TABLE [RequestedProperty] (
  [Request_ID] varchar(7),
  [Student_ID] varchar(7),
  [Property_ID] varchar(7),
  [LandLoad_ID] varchar(7),
  [RequestTime] datetime,
  [Rent] money,
  [Partner] char(1),
  [HandlingAgent] varchar(7),
  PRIMARY KEY ([Request_ID])
);

CREATE INDEX [PK,FK] ON  [RequestedProperty] ([Student_ID]);

CREATE INDEX [FK] ON  [RequestedProperty] ([Property_ID], [LandLoad_ID]);

