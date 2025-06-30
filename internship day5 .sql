
use E_commerce


-- Customers who has placed orders

select * from 
Customers c inner join Orders o
on c.CustomerID = o.CustomerID

--customers who didn't place any order

select C.* from 
Customers c left join Orders o
on c.CustomerID = o.CustomerID
where o.CustomerID is null


-- Purchases by each customer

select c.Name, count(o.CustomerID) No_of_purchases  from 
Customers c left join Orders o
on c.CustomerID = o.CustomerID
group by c.Name
having count(o.CustomerID)>1

-- All the details in customers and orders table

select * from 
Customers c full join Orders o
on c.CustomerID = o.CustomerID

-- Orders placed in 6th month

select * from 
Customers c inner join Orders o
on c.CustomerID = o.CustomerID
where MONTH(o.OrderDate)= 6

--City with maximum sales

select top 1 c.City,sum(o.Amount) as Total_sales from 
Customers c Right join Orders o
on c.CustomerID = o.CustomerID
group by c.City
order by sum(o.Amount) desc


--City with 2nd highest maximum sales

select c.City,sum(o.Amount) as Total_sales from 
Customers c Right join Orders o
on c.CustomerID = o.CustomerID
group by c.City
order by sum(o.Amount) desc
OFFSET 1 row 
fetch next 1 row only
