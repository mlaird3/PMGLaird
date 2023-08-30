-- Code for Mary Laird PMG Assessment 
-- Note: my Azure Studio has not allowed me to connect to the usual server and I have never used GitHub before so I am trying my best on this assessment but it may not be perfect. 
-- I know how the SQL queries should be written and I apologize that there are problems with the overall organization.


-- 1. Write a query to get the sum of impressions by day.
SELECT SUM(mp.impressions) AS "Total Impressions", DATE(mp.date) AS day
FROM marketing_performance AS mp 
GROUP BY day;


-- 2. Write a query to get the top three revenue-generating states in order of best to worst. How much revenue did the third best state generate?
SELECT SUM(wr.revenue) AS "RevenueByState", wr.state
FROM website_revenue AS wr
GROUP BY state
ORDER BY DESC
LIMIT 3;
 -- Since I am having trouble connecting the CSV files to my own server so I cannot see the third but If I could run the code it would be the lowest revenue of the three shown

-- 3. Write a query that shows total cost, impressions, clicks, and revenue of each campaign. Make sure to include the campaign name in the output.

SELECT SUM(mp.cost), SUM(mp.impressions), SUM(mp.clicks), SUM(wr.revenue) ci.name
FROM campaign_info AS ci
INNER JOIN marketing_performance AS mp
ON ci.id = mp.campaign_id
INNER JOIN website_revenue AS wr
ON mp.campaign_id = wr.campaign_id
GROUP BY ci.name;


-- 4. Write a query to get the number of conversions of Campaign5 by state. Which state generated the most conversions for this campaign?
SELECT SUM(mp.conversions), wr.state
FROM campaign_info AS ci
INNER JOIN marketing_performance AS mp
ON ci.id = mp.campaign_id
INNER JOIN website_revenue AS wr
ON mp.campaign_id = wr.campaign_id
WHERE ci.name = Campaign5
GROUP BY wr.state;

-- 5. In your opinion, which campaign was the most efficient, and why?

-- As stated earlier, I unfortunately have not been able to test out this code because of errors with Azure. When analyzing which campaign was the most efficient, 
-- I would look for the campaigns that had the most conversions, most impressions, and most revenue. I think those would be the most efficient because they made  
-- the company money while also having an impact on the customer. 

-- Bonus Question

-- Write a query that showcases the best day of the week (e.g., Sunday, Monday, Tuesday, etc.) to run ads.
SELECT SUM(mp.clicks) AS "Clicks", SUM(mp.impressions) AS "Impressions", SUM(mp.conversions) AS "Conversions", DATEPART(dw, mp.date) AS dayofweek
FROM marketing_performance AS mp 
GROUP BY dayofweek;