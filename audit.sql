SELECT COUNT(*) AS campaign_values_with_extra_spaces
FROM marketing_campaign.`campaign_raw.xlsx - data`
WHERE CHAR_LENGTH(`Campaign`) <> CHAR_LENGTH(TRIM(`Campaign`));

-- Found one campaign with an extra space


SELECT COUNT(*) AS fractional_impression_rows
FROM marketing_campaign.`campaign_raw.xlsx - data`
WHERE `Impressions` <> FLOOR(`Impressions`);

-- Found 5632 have fractional impressions, source-data limitation

SELECT COUNT(*) AS conversions_greater_than_clicks
FROM marketing_campaign.`campaign_raw.xlsx - data`
WHERE `Conversions` > `Clicks`;

-- Found 554. Checked excel dictionary file. Do not interpret conversions ÷ clicks as the percentage of people who bought

SELECT
    SUM(`Channel` IS NULL) AS missing_channel,
    SUM(`Spend, GBP` IS NULL) AS missing_spend,
    SUM(`Total conversion value, GBP` IS NULL) AS missing_purchase_value
FROM marketing_campaign.`campaign_raw.xlsx - data`;
-- Checking for missing values in any of the fields used for the ROAS, all three report 0 missing values.