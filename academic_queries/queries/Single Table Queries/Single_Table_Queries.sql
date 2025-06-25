use v_art;

-- 1 Virtual Art Gallery Application Queries
insert into artist (fname, lname, dob, dod, country, local)
value
('Johannes', 'Vermeer', 1632, 1674, 'Netherlands', 'n');

-- 2 Virtual Art Gallery Application Queries
select * 
from artist
order by lname
limit 7;

-- 3 Virtual Art Gallery Application Queries
update artist
set dod = 1675
where artist_id = 10;

SELECT * FROM artist
WHERE fname = 'Johannes' AND lname = 'Vermeer';

-- 4 Virtual Art Gallery Application Queries
delete 
from artist
where artist_id = 10;

use bike;

-- 5 Bike Shop Queries:
select first_name, last_name, phone
from customer
where city = 'Houston';

-- 6 Bike Shop Queries:
select product_name, list_price, list_price - 500 as Discount_Price
from product
where list_price > 5000
order by list_price desc;

-- 7 Bike Shop Queries:
select first_name, last_name, email
from staff
where store_id != 1;

-- 8 Bike Shop Queries:
select product_name, model_year, list_price
from product
where product_name like '%spider%';

-- 9 Bike Shop Queries:
select product_name, list_price
from product
where list_price between 500 and 550
order by list_price;

-- 10 Bike Shop Queries:
select  first_name, last_name, phone, street, city, state, zip_code
from customer
where phone is not null and (city like '%ach%' or city like '%och%') or last_name = 'William'
limit 5;

-- 12 Bike Shop Queries:
select product_name, concat('$',round(list_price / 3 ,2))
from product
where model_year = 2019;


use magazine;

-- 13 Magazine Database:
select magazinename, round((magazineprice * 0.97), 2) as '3%of'
from magazine;

-- 14 Magazine Database:
select subscriberkey, round((datediff('2020-12-20', subscriptionstartdate)/ 365)) as 'years since subcription'
from subscription ;

-- 15 Magazine Database:
select subscriptionStartDate, subscriptionLength, 
date_format(DATE_ADD(subscriptionStartDate, interval subscriptionLength month), '%M %D, %Y')
from subscription;