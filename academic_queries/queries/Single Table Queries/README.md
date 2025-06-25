## Academic SQL Practice Queries

This file includes practical SQL query examples written for three academic databases:

### 1. Virtual Art Gallery – `v_art` Database
- Add, update, and delete artists
- Sort and filter artists by name and date
- Search by full name

### 2. Bike Shop – `bike` Database
- Customer and staff filters by city or store
- Product discounts and price filters
- Search for product keywords and price ranges

### 3. Magazine Subscription – `magazine` Database
- Apply discounts to prices
- Calculate subscription duration
- Format end dates from start date and length

### Sample Run

```sql
USE v_art;
SELECT * FROM artist ORDER BY lname LIMIT 7;

USE bike;
SELECT product_name, list_price FROM product WHERE list_price BETWEEN 500 AND 550;

USE magazine;
SELECT subscriptionStartDate, subscriptionLength, 
       DATE_ADD(subscriptionStartDate, INTERVAL subscriptionLength MONTH) AS EndDate
FROM subscription;
