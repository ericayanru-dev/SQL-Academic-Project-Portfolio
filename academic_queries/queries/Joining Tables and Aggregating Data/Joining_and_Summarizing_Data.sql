use v_art;

-- question 1 
-- What query would be used in the code here to allow the user to see these images?
select artfile
from artwork
where period = "Impressionism";

-- question 2
-- What query would have allowed the user to get those results 
-- (remember, the keyword might have been 'flowers' but they typed 'flower') .
select artfile
from artwork a
join artwork_keyword ak
on a.artwork_id = ak.artwork_id
join keyword k
on k.keyword_id = ak.keyword_id
where keyword like "%flower%";

-- question 3
-- List all the artists from the artist table, 
-- but only the related artwork from the artwork table.
--  We need the first name, last name, and artwork title. 
select fname, lname,title
from artist a
left join artwork ar
on a.artist_id = ar.artist_id;


use magazine;

-- question 4
-- List all subscriptions with the magazine name, last name, first name, 
-- and sort alphabetically by magazine name. 
select magazinename, subscriberlastname, subscriberfirstname
from magazine m
join subscription s
on m.magazinekey = s.magazinekey
join subscriber su
on s.subscriberkey = su.subscriberkey
order by magazinename;

-- question 5
-- List all the magazines that Samantha Sanders subscribes to. 
select magazinename
from magazine m
join subscription s
on m.magazinekey = s.magazinekey
join subscriber su
on s.subscriberkey = su.subscriberkey
where subscriberfirstname = "Samantha" and subscriberlastname = "Sanders";


use employees;

-- question 6
-- List the first five employees from the Customer Service Department. 
-- Put them in alphabetical order by last name.
select  first_name, last_name
from employees e
join dept_emp de
on e.emp_no = de.emp_no
join departments d
on de.dept_no = d.dept_no
where dept_name = "Customer Service"
order by last_name
limit 5;

-- question 7
-- Find out the current salary and department of Berni Genin. 
-- You can use the ORDER BY and LIMIT to get just the most recent salary.
select first_name, Last_name, dept_name, salary, s.from_date
from employees e
join dept_emp de
on e.emp_no = de.emp_no
join departments d
on de.dept_no = d.dept_no
join salaries s
on s.emp_no = e.emp_no
where first_name = 'Berni' and last_name = 'Genin'
order by  s.from_date desc;


use bike;

-- question 8
-- Get the average quantity that we have in all our bike stocks.
-- Round to the nearest whole number.
select format(avg(quantity),0) as 'stock average'
from stock;

-- question 9
-- Show each bike that needs to be reordered.
-- Filter the results to only the lowest quantity of zero. Order by product_name
select distinct product_name
from product p
join stock s
on p.product_id = s.product_id
join store st
on s.store_id = st.store_id
where quantity = 0 
order by product_name;

-- question 10
-- How many of each category of bikes do we have in stock (inventory) at our "Baldwin Bikes"
-- store, which has the store_id of 2. 
select category_name, sum(quantity) as "instock"
from category c
join product p
on c.category_id = p.category_id
join stock s
on s.product_id = p.product_id
join store st
on st.store_id = s.store_id
where store_name = "Baldwin Bikes"
group by category_name with rollup
order by instock;


use employees;

-- question 11 
-- How many employees do we have? (3 points)
select count(DISTINCT e.emp_no) as "number of employees"
from employees e;

-- question 12
-- Get the average salaries in each department. 
-- We only need those departments that have average salaries that are below 60,000.
select dept_name, format(avg(salary),2) as "average_salary"
from departments d
join dept_emp de
on d.dept_no = de.dept_no
join employees e
on de.emp_no = e.emp_no
join salaries s
on e.emp_no = s.emp_no
group by dept_name
having  60000 > avg(salary);

-- question 13
-- Find out how many females work in each department. Sort by department name.
select dept_name, count(gender) as "number of females"
from departments d
join dept_emp de
on d.dept_no = de.dept_no
join employees e
on de.emp_no = e.emp_no
where gender = "f"
group by dept_name
order by dept_name;