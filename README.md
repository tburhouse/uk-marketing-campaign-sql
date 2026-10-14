## README - SQL PORTFOLIO PROJECT



## Portfolio aims
To find out which online marketing channels produced the most attributed purchase value per £1 of ad spend, and did that pattern hold across campaigns, devices and months?



## Dataset

The original Excel workbook contains a `data` sheet and a `dictionary` sheet. I exported the data sheet to CSV using Google Sheets, then imported its 9,900 rows into MySQL Workbench. The original workbook is included with this project.



## Data quality

- Verified that 9,900 rows imported and compared a recognisable row with the Excel source.



- Corrected Workbench’s incorrect data type for `Spend, GBP` before the successful import.



- Found no NULL values in `Channel`, `Spend, GBP` or `Total conversion value, GBP`.



- Used `TRIM()` when grouping campaigns because one row had extra whitespace. Kept the source’s 5,632 fractional impression values and 554 rows where conversions exceed clicks, and treated both as limitations.


## Findings

ROAS was calculated as total attributed purchase value divided by total ad spend for each group.



- Pinterest had the highest overall attributed ROAS at 22.47, followed by Instagram at 10.80 and Facebook at 5.76. This means the dataset attributes £22.47 of purchase value to each £1 of Pinterest ad spend.



- Pinterest ranked highest in every campaign, on both devices, and in every month from March to November 2023.



- Desktop ROAS was slightly higher than mobile ROAS within each channel.



## Recommendation and limitations



Pinterest is the strongest channel to investigate further. In a live campaign, I would test a limited budget increase and measure the result. Attributed ROAS does not prove that moving more budget to Pinterest would produce the same return, and it is not profit.





## How to reproduce



1. Open `Marketing_Campaign_Analysis_Dataset.xlsx` in Google Sheets or Microsoft Excel. Export the `data` sheet as a CSV file. Keep the original workbook unchanged.



2. In MySQL Workbench, run the `CREATE DATABASE` statement at the start of `import_and_verify.sql` to create the `marketing_campaign` database.



3. Use Workbench’s Table Data Import Wizard to import the CSV into that database. Name the new table `campaign_raw.xlsx - data` so it matches the SQL queries.



4. Check whether the rows imported. On my first attempt, Workbench created the table with `Spend, GBP` incorrectly typed as `BINARY(1)`, and zero rows imported. If this happens, use the `DESCRIBE` and `ALTER TABLE` statements in `import_and_verify.sql` to change that column to `DECIMAL(20,10)`. Retry the wizard, selecting the existing empty table. Skip this fix if the first import succeeds with an appropriate numeric type.



5. Run the row count and sample-row checks in `import_and_verify.sql`. The expected row count is 9,900.



6\. Run the checks in `audit.sql`, followed by the queries in `analysis.sql`.

