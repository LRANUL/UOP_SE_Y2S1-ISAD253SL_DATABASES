
BEGIN

	-- References: --
	-- (https://www.experts-exchange.com/questions/22020963/t-sql-command-to-check-if-a-path-exists.html) - On how to check if a directory already exists or not TSQL --
	-- (https://www.mssqltips.com/sqlservertip/1020/enabling-xpcmdshell-in-sql-server/) - On how to enable and disable xacmdshell, required for folder creation --
	-- (https://stackoverflow.com/questions/5131491/enable-xp-cmdshell-sql-server) -  On how to enable and disable xacmdshell, required for folder creation --
	-- (https://www.sqlservercentral.com/forums/topic/create-a-new-folder-in-tsql) - On how to create a folder using TSQL --

	-- Creating a table with a datatype of varchar with a length of 200 characters --
	CREATE TABLE localHostDirectory(
		Directory VARCHAR(200)
	)

	-- Adding the directory into the 'localHostDirectory' table --
	INSERT INTO localHostDirectory EXEC master..xp_subdirs 'C:\ISAD253SL\sasDB\'

	-- @@ROWCOUNT returns the number of rows --
	IF @@ROWCOUNT > 0
	BEGIN	-- If the directory pathway is existing the database will be created --
		PRINT 'Directory Pathway Does Exist'
		PRINT 'Creating Database'
	
		-- Creating a new database, named sasDB (Student Accommodation Service Database) --
		-- Creating a new database with user defined primary files, secondary file, --
		--  filegroups, and log files  --
		CREATE DATABASE sasDB
		  ON  -- Primary file cn only be created once, whereas the secon file can be multiple time --
			PRIMARY(  -- Creating a primary file (.mdf), stores all the metadata of the secondary files --
			  NAME = sasInfo, -- Name of the file --
			  FILENAME = "C:\ISAD253SL\sasDB\1.PrimaryFile\sasInfo.mdf", -- The pathway to store the file --
			  SIZE = 10, -- Size of the file --
			  MAXSIZE = 15, -- Maximum capacity that the file size can reach --
			  FILEGROWTH = 2 -- Increment factor --
			  -- The above mentioned properties get assigned in Megabytes by default. --
			  -- The size limitations can also be assigned in percentage values. --
			),
			  -- MAIN SECONDARY FILE in PRIMARY FILEGROUP --
			  ( -- Creating a secondary file (.ndf) (data files), stores the data of the relations (tables) --
				NAME = sasData,
				FILENAME = "C:\ISAD253SL\sasDB\2.SecondaryFiles\sasData.ndf",
				SIZE = 10,
				MAXSIZE = 20,
				FILEGROWTH = 3
			  ),
			  -- BACKUP of MAIN SECONDARY FILE in PRIMARY FILEGROUP --
			  ( -- Creating a secondary file (.ndf) (data files), stores the data of the relations (tables) --
				NAME = sasData_BACKUP,
				FILENAME = "C:\ISAD253SL\sasDB_BACKUP\2.SecondaryFiles\sasData_BACKUP.ndf",
				SIZE = 10,
				MAXSIZE = 20,
				FILEGROWTH = 3
			  ),
				-- Creating a new filegroup, stores multiple secondary files (data files) --
				-- CustomerService_Filegroup1 FILEGROUP --
				  FILEGROUP CustomerService_Filegroup1
				  (   -- CUSTOMERSERVICE FILE --
					  NAME = sasDataCustomerService,
					  FILENAME = "C:\ISAD253SL\sasDB\2.SecondaryFiles\CustomerService_Filegroup1\sasDataCUSTOMERSERVICE_FG1.ndf",
					  SIZE = 10,
					  MAXSIZE = 20,
					  FILEGROWTH = 3
				  ),
				  (   -- BACKUP of CUSTOMERSERVICE FILE --
					  NAME = sasDataCustomerServiceBACKUP,
					  FILENAME = "C:\ISAD253SL\sasDB_BACKUP\2.SecondaryFiles\CustomerService_Filegroup1\sasDataCUSTOMERSERVICE_FG1_BACKUP.ndf",
					  SIZE = 10,
					  MAXSIZE = 20,
					  FILEGROWTH = 3
				  ),
				-- Landlord_Filegroup2 FILEGROUP --
				  FILEGROUP Landlord_Filegroup2
				  (   -- LANDLORD FILE 1 --
					  NAME = sasDataLandlord,
					  FILENAME = "C:\ISAD253SL\sasDB\2.SecondaryFiles\Landlord_Filegroup2\sasDataLANDLORD_FG2.ndf",
					  SIZE = 10,
					  MAXSIZE = 20,
					  FILEGROWTH = 3
				  ),
				  (   -- BACKUP of LANDLORD FILE --
					  NAME = sasDataLandlordBACKUP,
					  FILENAME = "C:\ISAD253SL\sasDB_BACKUP\2.SecondaryFiles\Landlord_Filegroup2\sasDataLANDLORD_FG2_BACKUP.ndf",
					  SIZE = 10,
					  MAXSIZE = 20,
					  FILEGROWTH = 3
				  ),
				-- Property_Filegroup3 FILEGROUP --
				  FILEGROUP Property_Filegroup3
				  (   -- PROPERTY FILE --
					  NAME = sasDataProperty,
					  FILENAME = "C:\ISAD253SL\sasDB\2.SecondaryFiles\Property_Filegroup3\sasDataPROPERTY_FG3.ndf",
					  SIZE = 10,
					  MAXSIZE = 20,
					  FILEGROWTH = 3
				  ),
				  (   -- BACKUP of PROPERTY FILE --
					  NAME = sasDataPropertyBACKUP,
					  FILENAME = "C:\ISAD253SL\sasDB_BACKUP\2.SecondaryFiles\Property_Filegroup3\sasDataPROPERTY_FG3_BACKUP.ndf",
					  SIZE = 10,
					  MAXSIZE = 20,
					  FILEGROWTH = 3
				  ),
				  -- Student_Filegroup4 FILEGROUP --
					FILEGROUP Student_Filegroup4
					(   -- STUDENT FILE --
						NAME = sasDataStudent,
						FILENAME = "C:\ISAD253SL\sasDB\2.SecondaryFiles\Student_Filegroup4\sasDataSTUDENT_FG4.ndf",
						SIZE = 10,
						MAXSIZE = 20,
						FILEGROWTH = 3
					),
					(   -- BACKUP of STUDENT FILE --
						NAME = sasDataStudentBACKUP,
						FILENAME = "C:\ISAD253SL\sasDB_BACKUP\2.SecondaryFiles\Student_Filegroup4\sasDataSTUDENT_FG4_BACKUP.ndf",
						SIZE = 10,
						MAXSIZE = 20,
						FILEGROWTH = 3
					),
				  -- University_Filegroup5 FILEGROUP --
					FILEGROUP University_Filegroup5
					(   -- UNIVERSITY FILE --
						NAME = sasDataUniversity,
						FILENAME = "C:\ISAD253SL\sasDB\2.SecondaryFiles\University_Filegroup5\sasDataUNIVERSITY_FG5.ndf",
						SIZE = 10,
						MAXSIZE = 20,
						FILEGROWTH = 3
					),
					(   -- BACKUP of UNIVERSITY FILE --
						NAME = sasDataUniversityBACKUP,
						FILENAME = "C:\ISAD253SL\sasDB_BACKUP\2.SecondaryFiles\University_Filegroup5\sasDataUNIVERSITY_FG5_BACKUP.ndf",
						SIZE = 10,
						MAXSIZE = 20,
						FILEGROWTH = 3
					),
				  -- SystemLogin_Filegroup6 FILEGROUP --
					FILEGROUP SystemLogin_Filegroup6
					(   -- SYSTEMLOGIN FILE --
						NAME = sasDataSystemLogin,
						FILENAME = "C:\ISAD253SL\sasDB\2.SecondaryFiles\SystemLogin_Filegroup6\sasDataSYSTEMLOGIN_FG6.ndf",
						SIZE = 10,
						MAXSIZE = 20,
						FILEGROWTH = 3
					),
					(   -- BACKUP of SYSTEMLOGIN FILE --
						NAME = sasDataSystemLoginBACKUP,
						FILENAME = "C:\ISAD253SL\sasDB_BACKUP\2.SecondaryFiles\SystemLogin_Filegroup6\sasDataSYSTEMLOGIN_FG6_BACKUP.ndf",
						SIZE = 10,
						MAXSIZE = 20,
						FILEGROWTH = 3
					),
				  -- ViewingProperty_Filegroup7 FILEGROUP --
					FILEGROUP ViewingProperty_Filegroup7
					(   -- VIEWINGPROPERTY FILE --
						NAME = sasDataViewingProperty,
						FILENAME = "C:\ISAD253SL\sasDB\2.SecondaryFiles\ViewingProperty_Filegroup7\sasDataVIEWINGPROPERTY_FG7.ndf",
						SIZE = 10,
						MAXSIZE = 20,
						FILEGROWTH = 3
					),
					(   -- BACKUP of VIEWINGPROPERTY FILE --
						NAME = sasDataViewingPropertyBACKUP,
						FILENAME = "C:\ISAD253SL\sasDB_BACKUP\2.SecondaryFiles\ViewingProperty_Filegroup7\sasDataVIEWINGPROPERTY_FG7_BACKUP.ndf",
						SIZE = 10,
						MAXSIZE = 20,
						FILEGROWTH = 3
					),
				  -- Payment_Filegroup8 FILEGROUP --
					FILEGROUP Payment_Filegroup8
					(   -- PAYMENT FILE --
						NAME = sasDataPayment,
						FILENAME = "C:\ISAD253SL\sasDB\2.SecondaryFiles\Payment_Filegroup8\sasDataPAYMENT_FG8.ndf",
						SIZE = 10,
						MAXSIZE = 20,
						FILEGROWTH = 3
					),
					(   -- BACKUP of PAYMENT FILE --
						NAME = sasDataPaymentBACKUP,
						FILENAME = "C:\ISAD253SL\sasDB_BACKUP\2.SecondaryFiles\Payment_Filegroup8\sasDataPAYMENT_FG8_BACKUP.ndf",
						SIZE = 10,
						MAXSIZE = 20,
						FILEGROWTH = 3
					)
			  -- Creating a log file (.ldf) (log file), consists of the transaction log details which are added automatically --
			  LOG ON(
				NAME = sasLog,
				FILENAME = "C:\ISAD253SL\sasDB\3.LogFile\sasLog.ldf",
				SIZE = 5,
				MAXSIZE = 10,
				FILEGROWTH = 2
			  )
		PRINT 'Database Created'
				
	END
	ELSE	-- If the directory pathway is not available, the directory pathways will be created and the system adminitrator must execute this TSQL script again to create the database --
	BEGIN
		PRINT 'Directory Pathway Does Not Exist'
		PRINT 'Creating Directories'

		-- This ecexution turns on advanced options and is required to configure xp_cmdshell --
		EXEC sp_configure 'show advanced options', '1'
		RECONFIGURE

		-- This execution will enable xp_cmdshell functionality --
		EXEC sp_configure 'xp_cmdshell', '1'
		RECONFIGURE

	-- Creating 'sasDB\1.PrimaryFile' Folder --
			-- Declaring variables to store values for the folder creation --
			DECLARE @newFolderPathway VARCHAR(100), @directoryPathway VARCHAR(100)


			-- Assigning the directory pathway for the file to be created --
			SET @directoryPathway = 'C:\ISAD253SL\sasDB\1.PrimaryFile'

			-- Assigning the new pathway of the folder --
			SET @newFolderPathway = ' mkdir ' + @directoryPathway

			-- Ecexuting the folder generation --
			EXEC xp_cmdshell @newFolderPathway, no_output

			-- Printing (displaying) the value in '@newFolderPathway' to the 'Messages' panel --
			PRINT @directoryPathway + '			- Directory pathway was created'


	-- Creating 'sasDB\2.SecondaryFiles' Folder --
			-- Assigning the directory pathway for the file to be created --
			SET @directoryPathway = 'C:\ISAD253SL\sasDB\2.SecondaryFiles'

			-- Assigning the new pathway of the folder --
			SET @newFolderPathway = ' mkdir ' + @directoryPathway

			-- Ecexuting the folder generation --
			EXEC xp_cmdshell @newFolderPathway, no_output

			-- Printing (displaying) the value in '@newFolderPathway' to the 'Messages' panel --
			PRINT @directoryPathway + '			- Directory pathway was created'


	-- Creating 'sasDB\3.LogFile' Folder --
			-- Assigning the directory pathway for the file to be created --
			SET @directoryPathway = 'C:\ISAD253SL\sasDB\3.LogFile'

			-- Assigning the new pathway of the folder --
			SET @newFolderPathway = ' mkdir ' + @directoryPathway

			-- Ecexuting the folder generation --
			EXEC xp_cmdshell @newFolderPathway, no_output

			-- Printing (displaying) the value in '@newFolderPathway' to the 'Messages' panel --
			PRINT @directoryPathway + '			- Directory pathway was created'


		-- Creating ''sasDB\2.SecondaryFiles\CustomerService_Filegroup1' Folder --
			-- Assigning the directory pathway for the file to be created --
			SET @directoryPathway = 'C:\ISAD253SL\sasDB\2.SecondaryFiles\CustomerService_Filegroup1'

			-- Assigning the new pathway of the folder --
			SET @newFolderPathway = ' mkdir ' + @directoryPathway

			-- Ecexuting the folder generation --
			EXEC xp_cmdshell @newFolderPathway, no_output

			-- Printing (displaying) the value in '@newFolderPathway' to the 'Messages' panel --
			PRINT @directoryPathway + '			- Directory pathway was created'


		-- Creating 'sasDB\2.SecondaryFiles\Landlord_Filegroup2' Folder --
			-- Assigning the directory pathway for the file to be created --
			SET @directoryPathway = 'C:\ISAD253SL\sasDB\2.SecondaryFiles\Landlord_Filegroup2'

			-- Assigning the new pathway of the folder --
			SET @newFolderPathway = ' mkdir ' + @directoryPathway

			-- Ecexuting the folder generation --
			EXEC xp_cmdshell @newFolderPathway, no_output

			-- Printing (displaying) the value in '@newFolderPathway' to the 'Messages' panel --
			PRINT @directoryPathway + '			- Directory pathway was created'


		-- Creating 'sasDB\2.SecondaryFilesProperty_Filegroup3' Folder --
			-- Assigning the directory pathway for the file to be created --
			SET @directoryPathway = 'C:\ISAD253SL\sasDB\2.SecondaryFiles\Property_Filegroup3'

			-- Assigning the new pathway of the folder --
			SET @newFolderPathway = ' mkdir ' + @directoryPathway

			-- Ecexuting the folder generation --
			EXEC xp_cmdshell @newFolderPathway, no_output --

			-- Printing (displaying) the value in '@newFolderPathway' to the 'Messages' panel --
			PRINT @directoryPathway + '			- Directory pathway was created'


		-- Creating 'sasDB\2.SecondaryFiles\Student_Filegroup4' Folder --
			-- Assigning the directory pathway for the file to be created --
			SET @directoryPathway = 'C:\ISAD253SL\sasDB\2.SecondaryFiles\Student_Filegroup4'

			-- Assigning the new pathway of the folder --
			SET @newFolderPathway = ' mkdir ' + @directoryPathway

			-- Ecexuting the folder generation --
			EXEC xp_cmdshell @newFolderPathway, no_output

			-- Printing (displaying) the value in '@newFolderPathway' to the 'Messages' panel --
			PRINT @directoryPathway + '			- Directory pathway was created'


		-- Creating'sasDB\2.SecondaryFiles\University_Filegroup5' Folder --
			-- Assigning the directory pathway for the file to be created --
			SET @directoryPathway = 'C:\ISAD253SL\sasDB\2.SecondaryFiles\University_Filegroup5'

			-- Assigning the new pathway of the folder --
			SET @newFolderPathway = ' mkdir ' + @directoryPathway

			-- Ecexuting the folder generation --
			EXEC xp_cmdshell @newFolderPathway, no_output

			-- Printing (displaying) the value in '@newFolderPathway' to the 'Messages' panel --
			PRINT @directoryPathway + '			- Directory pathway was created'


		-- Creating 'sasDB\2.SecondaryFiles\SystemLogin_Filegroup6' Folder --
			-- Assigning the directory pathway for the file to be created --
			SET @directoryPathway = 'C:\ISAD253SL\sasDB\2.SecondaryFiles\SystemLogin_Filegroup6'

			-- Assigning the new pathway of the folder --
			SET @newFolderPathway = ' mkdir ' + @directoryPathway

			-- Ecexuting the folder generation --
			EXEC xp_cmdshell @newFolderPathway, no_output

			-- Printing (displaying) the value in '@newFolderPathway' to the 'Messages' panel --
			PRINT @directoryPathway + '			- Directory pathway was created'



		-- Creating 'sasDB\2.SecondaryFiles\ViewingProperty_Filegroup7' Folder --
			-- Assigning the directory pathway for the file to be created --
			SET @directoryPathway = 'C:\ISAD253SL\sasDB\2.SecondaryFiles\ViewingProperty_Filegroup7'

			-- Assigning the new pathway of the folder --
			SET @newFolderPathway = ' mkdir ' + @directoryPathway

			-- Ecexuting the folder generation --
			EXEC xp_cmdshell @newFolderPathway, no_output

			-- Printing (displaying) the value in '@newFolderPathway' to the 'Messages' panel --
			PRINT @directoryPathway + '			- Directory pathway was created'


		-- Creating 'sasDB\2.SecondaryFiles\Payment_Filegroup8' Folder --
			-- Assigning the directory pathway for the file to be created --
			SET @directoryPathway = 'C:\ISAD253SL\sasDB\2.SecondaryFiles\Payment_Filegroup8'

			-- Assigning the new pathway of the folder --
			SET @newFolderPathway = ' mkdir ' + @directoryPathway

			-- Ecexuting the folder generation --
			EXEC xp_cmdshell @newFolderPathway, no_output

			-- Printing (displaying) the value in '@newFolderPathway' to the 'Messages' panel --
			PRINT @directoryPathway + '			- Directory pathway was created'


	-- Creating 'sasDB_BACKUP\2.SecondaryFiles' Folder --
			-- Assigning the directory pathway for the file to be created --
			SET @directoryPathway = 'C:\ISAD253SL\sasDB_BACKUP\2.SecondaryFiles'

			-- Assigning the new pathway of the folder --
			SET @newFolderPathway = ' mkdir ' + @directoryPathway

			-- Ecexuting the folder generation --
			EXEC xp_cmdshell @newFolderPathway, no_output

			-- Printing (displaying) the value in '@newFolderPathway' to the 'Messages' panel --
			PRINT @directoryPathway + '			- Directory pathway was created'

		-- Creating 'sasDB_BACKUP\2.SecondaryFiles\CustomerService_Filegroup1' Folder  --
			-- Assigning the directory pathway for the file to be created --
			SET @directoryPathway = 'C:\ISAD253SL\sasDB_BACKUP\2.SecondaryFiles\CustomerService_Filegroup1'

			-- Assigning the new pathway of the folder --
			SET @newFolderPathway = ' mkdir ' + @directoryPathway

			-- Ecexuting the folder generation --
			EXEC xp_cmdshell @newFolderPathway, no_output

			-- Printing (displaying) the value in '@newFolderPathway' to the 'Messages' panel --
			PRINT @directoryPathway + '			- Directory pathway was created'


		-- Creating 'sasDB_BACKUP\2.SecondaryFiles\Landlord_Filegroup2' Folder --
			-- Assigning the directory pathway for the file to be created --
			SET @directoryPathway = 'C:\ISAD253SL\sasDB_BACKUP\2.SecondaryFiles\Landlord_Filegroup2'

			-- Assigning the new pathway of the folder --
			SET @newFolderPathway = ' mkdir ' + @directoryPathway

			-- Ecexuting the folder generation --
			EXEC xp_cmdshell @newFolderPathway, no_output

			-- Printing (displaying) the value in '@newFolderPathway' to the 'Messages' panel --
			PRINT @directoryPathway + '			- Directory pathway was created'


		-- Creating 'sasDB_BACKUP\2.SecondaryFiles\Property_Filegroup3' Folder --
			-- Assigning the directory pathway for the file to be created --
			SET @directoryPathway = 'C:\ISAD253SL\sasDB_BACKUP\2.SecondaryFiles\Property_Filegroup3'

			-- Assigning the new pathway of the folder --
			SET @newFolderPathway = ' mkdir ' + @directoryPathway

			-- Ecexuting the folder generation --
			EXEC xp_cmdshell @newFolderPathway, no_output

			-- Printing (displaying) the value in '@newFolderPathway' to the 'Messages' panel --
			PRINT @directoryPathway + '			- Directory pathway was created'


		-- Creating 'sasDB_BACKUP\2.SecondaryFiles\Student_Filegroup4' Folder --
			-- Assigning the directory pathway for the file to be created --
			SET @directoryPathway = 'C:\ISAD253SL\sasDB_BACKUP\2.SecondaryFiles\Student_Filegroup4'

			-- Assigning the new pathway of the folder --
			SET @newFolderPathway = ' mkdir ' + @directoryPathway

			-- Ecexuting the folder generation --
			EXEC xp_cmdshell @newFolderPathway, no_output

			-- Printing (displaying) the value in '@newFolderPathway' to the 'Messages' panel --
			PRINT @directoryPathway + '			- Directory pathway was created'


		-- Creating 'sasDB_BACKUP\2.SecondaryFiles\University_Filegroup5' Folder --
			-- Assigning the directory pathway for the file to be created --
			SET @directoryPathway = 'C:\ISAD253SL\sasDB_BACKUP\2.SecondaryFiles\University_Filegroup5'

			-- Assigning the new pathway of the folder --
			SET @newFolderPathway = ' mkdir ' + @directoryPathway

			-- Ecexuting the folder generation --
			EXEC xp_cmdshell @newFolderPathway, no_output

			-- Printing (displaying) the value in '@newFolderPathway' to the 'Messages' panel --
			PRINT @directoryPathway + '			- Directory pathway was created'


		-- Creating 'sasDB_BACKUP\2.SecondaryFiles\SystemLogin_Filegroup6' Folder --
			-- Assigning the directory pathway for the file to be created --
			SET @directoryPathway = 'C:\ISAD253SL\sasDB_BACKUP\2.SecondaryFiles\SystemLogin_Filegroup6'

			-- Assigning the new pathway of the folder --
			SET @newFolderPathway = ' mkdir ' + @directoryPathway

			-- Ecexuting the folder generation --
			EXEC xp_cmdshell @newFolderPathway, no_output

			-- Printing (displaying) the value in '@newFolderPathway' to the 'Messages' panel --
			PRINT @directoryPathway + '			- Directory pathway was created'



		-- Creating 'sasDB_BACKUP\2.SecondaryFiles\ViewingProperty_Filegroup7' Folder --
			-- Assigning the directory pathway for the file to be created --
			SET @directoryPathway = 'C:\ISAD253SL\sasDB_BACKUP\2.SecondaryFiles\ViewingProperty_Filegroup7'

			-- Assigning the new pathway of the folder --
			SET @newFolderPathway = ' mkdir ' + @directoryPathway

			-- Ecexuting the folder generation --
			EXEC xp_cmdshell @newFolderPathway, no_output

			-- Printing (displaying) the value in '@newFolderPathway' to the 'Messages' panel --
			PRINT @directoryPathway + '			- Directory pathway was created'


		-- Creating 'sasDB_BACKUP\2.SecondaryFiles\Payment_Filegroup8' Folder --
			-- Assigning the directory pathway for the file to be created --
			SET @directoryPathway = 'C:\ISAD253SL\sasDB_BACKUP\2.SecondaryFiles\Payment_Filegroup8'

			-- Assigning the new pathway of the folder --
			SET @newFolderPathway = ' mkdir ' + @directoryPathway

			-- Ecexuting the folder generation --
			EXEC xp_cmdshell @newFolderPathway, no_output

			-- Printing (displaying) the value in '@newFolderPathway' to the 'Messages' panel --
			PRINT @directoryPathway + '			- Directory pathway was created'

		-- This execution disables the xp_cmdshell functionality --
		EXEC sp_configure 'xp_cmdshell', '0' 
		RECONFIGURE

		PRINT 'Directories Created'

		PRINT 'Please execute this TSQL script again inorder to create the database'

	END

	-- Deleting the 'localHostDirectory' table  --
	DROP TABLE localHostDirectory

END
