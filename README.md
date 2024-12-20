# Analyze Walmart Sales Data
 To analyze and derive insights from Walmart's sales data to improve business decision-making 
processes.

Dataset:

• The dataset consists of the following columns:

• Invoice_ID: Unique identifier for each invoice.

• Branch: Branch of the store where the sale took place.

• City: City where the store branch is located.

• Customer_type: Type of customer (e.g., Member, Normal).

• Gender: Gender of the customer.

• Product_line: Category of the product sold.

• Unit_price: Price per unit of the product.

• Quantity: Quantity of the product sold.

• Tax_5%: Tax applied on the sale.

• Total: Total amount of the sale.

• Date: Date of the transaction.

• Time: Time of the transaction.

• Payment: Payment method used (e.g., Cash, Credit Card).

• cogs: Cost of goods sold.

• gross_margin_percentage: Gross margin percentage.

• gross_income: Gross income from the sale.

• Rating: Customer rating for the purchase.


# Analysis List
## 1.Product Analysis
Conduct analysis on the data to understand the different product lines, the products lines performing best and the product lines that need to be improved.

## 2.Sales Analysis
This analysis aims to answer the question of the sales trends of product. The result of this can help use measure the effectiveness of each sales strategy the business applies and what modificatoins are needed to gain more sales.

## 3.Customer Analysis
This analysis aims to uncover the different customers segments, purchase trends and the profitability of each customer segment


# Approach Used


## Feature Engineering:  use to generate some new columns from existing ones.
Add a new column named time_of_day to give insight of sales in the Morning, Afternoon and Evening. This will help answer the question on which part of the day most sales are made.
Add a new column named day_name that contains the extracted days of the week on which the given transaction took place (Mon, Tue, Wed, Thur, Fri). This will help answer the question on which week of the day each branch is busiest.
Add a new column named month_name that contains the extracted months of the year on which the given transaction took place (Jan, Feb, Mar). Help determine which month of the year has the most sales and profit.

# Exploratory Data Analysis (EDA): using following Quetions

## Generic Question
1.How many unique cities does the data have?
2.In which city is each branch?
## Product
1.How many unique product lines does the data have?
2.What is the most common payment method?
3.What is the most selling product line?
4.What is the total revenue by month?
5.What month had the largest COGS?
6.What product line had the largest revenue?
7.What is the city with the largest revenue?
8.What product line had the largest VAT?
9.Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales
10.Which branch sold more products than average product sold?
11.What is the most common product line by gender?
12.What is the average rating of each product line?
## Sales
1.Number of sales made in each time of the day per weekday
2.Which of the customer types brings the most revenue?
3.Which city has the largest tax percent/ VAT (Value Added Tax)?
4.Which customer type pays the most in VAT?
## Customer
1.How many unique customer types does the data have?
2.How many unique payment methods does the data have?
3.What is the most common customer type?
4.Which customer type buys the most?
5.What is the gender of most of the customers?
6.What is the gender distribution per branch?
7.Which time of the day do customers give most ratings?
8.Which time of the day do customers give most ratings per branch?
9.Which day fo the week has the best avg ratings?
10.Which day of the week has the best average ratings per branch?
## Some Extra Quetions 
1. Retrieve all columns for sales made in a specific branch (e.g., Branch 'A').
2. Find the total sales for each product line.
3. List all sales transactions where the payment method was 'Cash'.
4.  Calculate the total gross income generated in each city. 
5. Find the average rating given by customers in each branch. 
6. Determine the total quantity of each product line sold.
7. List the top 5 products by unit price. 
8. Find sales transactions with a gross margin percentage greater than 30%.
9.  Retrieve sales transactions that occurred on weekends.
10.  Calculate the total sales and gross income for each month. 
11.  Find the number of sales transactions that occurred after 6 PM.
12.  List the sales transactions that have a higher total than the average total of all transactions. 
13.  Find customers who made more than 5 purchases in a single month.
14. Calculate the cumulative gross income for each branch by date.
15. Find the total cogs for each customer type in each city.



