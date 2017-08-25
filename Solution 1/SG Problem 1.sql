/*
* SG Problem 1
*   Description - Given a list of people with their birth and end years (all between 1900 and 2000), find the year with the most number of people alive.
*   Code - Solve using a language of your choice and dataset of your own creation.
*
* Description..... This script will solve Problem 1 with SQL alone
* Author.......... Adam Doerder
* Date............ 08/23/2017
*/

PRINT 'BEGIN'
PRINT 'Server name = ' + @@SERVERNAME
PRINT 'Database name = ' + DB_NAME()
PRINT 'Current date = ' + CONVERT(VARCHAR(20), GETDATE())
PRINT ' '

--Drop the table if it exists
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[People]') AND type in (N'U'))
	DROP TABLE People
GO

--Create a new table
CREATE TABLE [People](
	Id INT IDENTITY(1,1) Primary Key,
	BirthYear int,
	EndYear int,	
) ON [PRIMARY]
GO

--Seed the new table with data (enter any value for the @numberOfPoeple you like)
DECLARE @numberOfPeople INT;
SET @numberOfPeople = 50;

DECLARE @birthYear INT;
DECLARE @endYear INT;

WHILE @numberOfPeople > 0
BEGIN
	--For the specified @numberOfPoeple, set the @birthYear, an older @endYear, and insert the values
	SET @birthYear = (SELECT FLOOR(RAND()*(2000-1900)+1900));
	SET @endYear = (SELECT FLOOR(RAND()*(2000-@birthYear)+@birthYear));
	
	INSERT INTO People (BirthYear,EndYear)
	VALUES (@birthYear,@endYear)
	
    SET @numberOfPeople = @numberOfPeople - 1;
END; 

--Loop through the table of People to find the year with the most living people
DECLARE @yearCounter INT;
SET @yearCounter = 1900;

DECLARE @tmpLivingPeopleCount INT;
DECLARE @livingPeopleCount INT;
SET @livingPeopleCount = 0;

DECLARE @theAnswer INT;

WHILE @yearCounter <= 2000
BEGIN
	--For each year, find the number of living people. Update counters and the answer if we have a new max.
	SET @tmpLivingPeopleCount = (SELECT COUNT(ID) FROM People WHERE BirthYear <= @yearCounter AND EndYear >= @yearCounter);
	--PRINT 'For the year ' + CAST(@yearCounter as varchar(4)) + ' there are ' + CAST(@tmpLivingPeopleCount as varchar(4)) + ' living';
	
	IF (@tmpLivingPeopleCount > @livingPeopleCount)
	BEGIN
		--PRINT 'updating answer';
		SET @livingPeopleCount = @tmpLivingPeopleCount;
		SET @theAnswer = @yearCounter
	END

	SET @yearCounter = @yearCounter + 1;
END;


PRINT 'The answer is the year ' + CAST(@theAnswer as varchar(4)) + ' when there were ' + CAST(@livingPeopleCount as varchar(25)) + ' living people.';
--I suspect you could optimize this by only looping through each unique birthYear and endYear, but that would really only effect small datasets

PRINT ' '
PRINT 'END'
Go