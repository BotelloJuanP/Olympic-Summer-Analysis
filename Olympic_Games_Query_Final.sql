/****** Script for SelectTopNRows command from SSMS  ******/
SELECT 
	   [ID]
      ,[Name] as 'Competitor Name' -- Renamed Column
      ,Case when SEX = 'M' then 'Male' else 'Female' end as Sex --- Better Name Filters
      ,[Age]
	  ,CASE		When [Age] < 18 THEN 'Under 18' 
				When [Age] BETWEEN 18 and 25 then '18-25'
				when [Age] between 25 and 30 then '25-30'
				when [Age] > 30 then 'Over 30' 
		end as [Age Grouping]
      ,[Height]
      ,[Weight]
      ,[NOC] as 'Nation Code' -- Explained abbreviation
	  , left(Games, CHARINDEX(' ', Games) - 1) as 'Year' -- split column to isolate Year, based on space
--	  ,RIGHT(Games, charindex(' ', Reverse(Games)) -1) as 'Season' -- split column to isolate Season, based on space
--      ,[Games] -- Extra Data
--	,[City] -- Data is not necessary for the analysis
      ,[Sport]
      ,[Event]
      ,Case When Medal ='NA' then 'Not Registered' Else Medal End as Medal -- Replaced NA with Not Registered
  FROM [olympic_games].[dbo].[athletes_event_results]
  Where Right (Games, Charindex (' ', Reverse(Games))-1) = 'Summer' -- Where Clause to isolate Summer Season