CREATE DATABASE startup_analysis;

--## No. of Startups between 1984-2020
SELECT COUNT(dbo.Startups1$.Company)
FROM dbo.Startups1$;

--Overall Fundings by all startups between 1984-2020
Select SUM([Funding Amount in $]) AS Overall_Fundings
FROM dbo.Startups1$;

SELECT * FROM dbo.Startups1$;

--Overall Funding Rounds between 1984-2020
SELECT SUM([Funding Round])
FROM dbo.Startups1$;

--Total investors between 1984-2020
SELECT SUM([No# of Investors]) AS Total_investors
FROM dbo.Startups1$;

--Most Funded Startups
SELECT Company,[Funding Amount in $]
FROM dbo.Startups1$
ORDER BY [Funding Amount in $] desc;

--Top 5 most funded startups
SELECT top 5 Company,[Funding Amount in $]
FROM dbo.Startups1$
ORDER BY [Funding Amount in $] desc;

--Least 5 funded startups
SELECT TOP 5 Company,[Funding Amount in $]
FROM dbo.Startups1$
ORDER BY [Funding Amount in $] asc;

--Top funded startup with Funding Round
SELECT TOP 5 Company,[Funding Round]
FROM dbo.Startups1$
ORDER BY [Funding Amount in $] desc;

--TOP 5 Startups with max funding round with funds
SELECT 
	TOP 5 Company,
	max([Funding Round]) AS Funding_Round,
	SUM([Funding Amount in $]) AS Funding_amount,
	([Funding Amount in $]/[Funding Round]) AS Avg_Funds_per_round
FROM dbo.Startups1$
GROUP BY Company,[Funding Round],[Funding Amount in $]
ORDER BY [Funding Round] desc

--No. of Startups by Year
SELECT
	[Starting Year],
    COUNT(Company) AS CompanyCount,
    SUM(COUNT(Company)) OVER (ORDER BY [Starting Year]) AS Running_Total  
FROM dbo.Startups1$
GROUP BY [Starting Year]
ORDER BY Running_Total ASC;




