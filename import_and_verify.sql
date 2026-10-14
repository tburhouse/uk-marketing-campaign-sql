-- Import and Verify.
-- Source: Marketing_Campaign_Analysis_Dataset.xlsx, "data" sheet.
-- Exported that sheet to CSV in Google Sheets for MySQL Workbench.
-- Imported the CSV using Workbench's Table Data Import Wizard.

CREATE DATABASE IF NOT EXISTS marketing_campaign;

-- The wizard created this table, but its first import loaded 0 rows.
-- Inspect the column types to diagnose the error.
DESCRIBE marketing_campaign.`campaign_raw.xlsx - data`;

-- Workbench had assigned "Spend, GBP" the type binary instead of decimal.
-- Corrected the type before retrying the import into the existing table.
ALTER TABLE marketing_campaign.`campaign_raw.xlsx - data`
MODIFY COLUMN `Spend, GBP` DECIMAL(20,10);

-- Retried the CSV import in Workbench, selecting the existing table.
-- Check the number of imported rows against the 9,900 source rows.
SELECT COUNT(*) AS rows_imported
FROM marketing_campaign.`campaign_raw.xlsx - data`;

-- Compare a recognisable source row with the imported values.
SELECT `Campaign`, `Date`, `CTR, %`, `Clicks`, `Spend, GBP`
FROM marketing_campaign.`campaign_raw.xlsx - data`
WHERE `Date` = '2023-03-01'
  AND `City/Location` = 'Birmingham'
  AND `Channel` = 'Facebook'
  AND `Device` = 'Desktop'
  AND `Ad` = 'Collection';