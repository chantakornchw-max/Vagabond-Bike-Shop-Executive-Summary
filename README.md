# Vagabond's Bike Shop Executive Dashboard

## Project Background
This End-to-End Analytics Project was developed to transform raw transactional data into a high-impact executive dashboard. By integrating SQL-based data processing with Power BI visualization, the project provides a comprehensive view of the company's health over a three-year period (2011–2013).

Data source: DataWithBaraa

Vagabond's Bike Shop is a global retail business specializing in high-performance bicycles, components, and accessories. As the business expanded across multiple continents, the need for a centralized, data-driven system to monitor performance became critical for executive decision-making.

Key Objectives:

● Revenue Trend Analysis: Track monthly and yearly revenue performance to identify seasonality and growth patterns.

● Market Insights: Visualize geographic sales distribution to identify top-performing markets.

● Customer Demographics: Understand the revenue contribution across different age groups to optimize marketing efforts.

● Product Performance: Identify high-value products and monitor their impact on the total revenue stream.

## Data Structure
Vagabond's Bike Shop's database consists of three tables: fact_sales, dim_customers, and dim_products, as shown below.

![Image Alt](https://github.com/chantakornchw-max/Vagabond-Bike-Shop-Executive-Dashboard/blob/4d9e59ad7dfc2997fc8d5cfd97eefdcba6234810/Vagabond's%20Bike%20Shop's%20database.png)

● Data Transformation (SQL):
Data was extracted and refined using SQL to ensure only the most accurate and relevant information reached the visualization stage. Key transformation steps included filtering out incomplete records from 2010 and 2014, as well as performing feature engineering to calculate precise customer age groups. The complete SQL scripts detailing the extraction, cleaning, and filtering logic are available in the /SQL_Scripts directory of this repository.

● Custom Date Dimension (DAX):
A custom Date Dimension table was developed using DAX to serve as the structural backbone for advanced Time Intelligence and dynamic reporting. This logic enables the dashboard to perform precise temporal calculations, such as YoY Growth % and Previous Year Sales, which are critical for tracking the shop's expansion.

![Image Alt](https://github.com/chantakornchw-max/Vagabond-Bike-Shop-Executive-Dashboard/blob/bdffbed35cd0eb659104b0d2304172ac88600020/Date%20Dimension.png)

● Data Architecture:
The project utilizes a Star Schema architecture to organize data for high-performance querying and efficient executive reporting. A robust one-to-many relationship was established between the central Sales fact table and dimension tables like DateDim, ensuring data integrity and seamless filtering across all interactive visuals.

![Image Alt](https://github.com/chantakornchw-max/Vagabond-Bike-Shop-Executive-Dashboard/blob/bdffbed35cd0eb659104b0d2304172ac88600020/Star%20Schema.png)

● Key Analytical Measures (DAX):
The dashboard's intelligence is powered by custom DAX measures designed for high accuracy and robust error handling. By utilizing SUMX for precise row-level revenue calculations and SAMEPERIODLASTYEAR for accurate year-over-year comparisons, the model establishes a solid foundation for tracking the shop's hyper-growth phase. Furthermore, the implementation of the DIVIDE function for critical metrics like YoY Growth % and Average Order Value (AOV) ensures dashboard stability by preventing "Division by Zero" errors, providing clean and reliable insights for executive decision-making.

Total Revenue = SUMX(Sales, Sales[price]*Sales[quantity])

Previous Year Revenue = CALCULATE([Total Revenue], SAMEPERIODLASTYEAR(DateDim[Date]))

YoY Growth % = DIVIDE(([Total Revenue]-[Previous Year Revenue]), [Previous Year Revenue])

AOV = DIVIDE(SUM(Sales[sales_amount]), DISTINCTCOUNT('Sales'[order_number]))

## Executive Summary
The Vagabond's Bike Shop dashboard reveals a period of hyper-growth and significant strategic shifts between 2011 and 2013. The business successfully transitioned from a high-value/low-volume model to a massive high-volume market expansion.

![Image Alt](https://github.com/chantakornchw-max/Vagabond-Bike-Shop-Executive-Dashboard/blob/d16ba2716de6a0647b5e470f6643b470cb9f4b73/Executive%20Dashboard.png)

Key Financial Highlights (2013 Performance):

● Achieved a 179.77% Year-over-Year (YoY) revenue growth, reaching a total annual revenue of $16.34M.

● The United States ($5.2M) and Australia ($4.3M) emerged as the primary revenue drivers, contributing significantly to the global sales surge.

● Customers aged 30–49 represent the core demographic, contributing over $10.92M in combined revenue, with the 30–39 group leading at $6.03M.

● Mountain Bikes ($6.34M) and Road Bikes ($5.2M) remain the highest revenue-generating categories, anchoring the shop's market position.

![Image Alt](https://github.com/chantakornchw-max/Vagabond-Bike-Shop-Executive-Dashboard/blob/00c39111b118722907cd17c070e073bd66ca5ad4/YoY%20%25.png)

The Growth Engine:

● The most significant driver was a +551.18% jump in total orders (from 3,269 to 21,287), confirming a massive expansion in market reach.

● The analysis reveals a pivot from a bike-only model in 2011 to a diversified retail strategy in 2013. Revenue from Accessories and Clothing surged to nearly $1M combined, representing a massive expansion in product offerings.

● While total orders jumped by 551.18%, the Average Order Value (AOV) settled at $767.83. This decrease is a direct result of selling a higher volume of low-priced products (accessories/clothing), which successfully increased customer touchpoints and overall market reach.

![Image Alt](https://github.com/chantakornchw-max/Vagabond-Bike-Shop-Executive-Dashboard/blob/fc601043158542a96d787d80dcf0f643cfcfe171/Quarterly%20Revenue%20Performance%20Trends.png)

Growth Trajectory Analysis:

The continuous revenue timeline illustrates a strategic pivot from a stable market-testing phase (2011–2012) into a high-momentum trajectory starting in late 2012. This surge was fueled by an aggressive market penetration strategy that resulted in an unprecedented 551.18% increase in order volume and a 179.77% YoY revenue growth by the end of 2013. By Q4 2013, the business reached a new scalability milestone with quarterly revenue peaking at over $5M, proving the success of its transition from a high-value/low-volume model to a dominant high-volume global retail leader.

## Strategic Recommendations

