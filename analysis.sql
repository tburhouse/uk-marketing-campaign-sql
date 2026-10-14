SELECT
    `Channel`,
    ROUND(SUM(`Spend, GBP`), 2) AS spend_gbp,
    ROUND(SUM(`Total conversion value, GBP`), 2) AS purchase_value_gbp,
    ROUND(
    SUM(`Total conversion value, GBP`) / NULLIF(SUM(`Spend, GBP`), 0), 2) AS roas
FROM marketing_campaign.`campaign_raw.xlsx - data`
GROUP BY `channel`
ORDER BY roas DESC;

SELECT
    `Channel`,
    TRIM(`Campaign`) AS campaign,
    ROUND(SUM(`Spend, GBP`), 2) AS spend_gbp,
    ROUND(SUM(`Total conversion value, GBP`), 2) AS purchase_value_gbp,
    ROUND(
    SUM(`Total conversion value, GBP`) / NULLIF(SUM(`Spend, GBP`), 0), 2) AS roas
FROM marketing_campaign.`campaign_raw.xlsx - data`
GROUP BY `Channel`, TRIM(`Campaign`)
ORDER BY `Channel`, roas DESC;

-- This is showing that pinterest is the highest atrributed ROAS in this dataset

SELECT
    `Channel`,
    TRIM(`Device`) AS device,
    ROUND(SUM(`Spend, GBP`), 2) AS spend_gbp,
    ROUND(SUM(`Total conversion value, GBP`), 2) AS purchase_value_gbp,
    ROUND(
    SUM(`Total conversion value, GBP`) / NULLIF(SUM(`Spend, GBP`), 0), 2) AS roas,
    COUNT(*) AS records
FROM marketing_campaign.`campaign_raw.xlsx - data`
GROUP BY `Channel`, `Device`
ORDER BY `Channel`, roas DESC;

-- Pinterest has the highest ROAS on both devices. Desktop is slightly higher than mobile across every channel. 

-- Checking ROAS month by month
SELECT
    `Channel`,
    DATE_FORMAT(`Date`, '%Y-%m') AS month,
    ROUND(SUM(`Spend, GBP`), 2) AS spend_gbp,
    ROUND(SUM(`Total conversion value, GBP`), 2) AS purchase_value_gbp,
    ROUND(
    SUM(`Total conversion value, GBP`) / NULLIF(SUM(`Spend, GBP`), 0), 2) AS roas,
    COUNT(*) AS records
FROM marketing_campaign.`campaign_raw.xlsx - data`
GROUP BY `Channel`, DATE_FORMAT(`Date`, '%Y-%m')
ORDER BY month, roas DESC;
-- Pinterest had the highest attributed ROAS in all nine months analysed.