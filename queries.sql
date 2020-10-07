-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

select   ProductName , CategoryName 
from product as p 
join category as c on p.CategoryId = c.Id;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

select o.id , o.OrderDate, s.companyName from [order] as o
join Shipper as s on o.ShipVia = s.Id
where o.orderDate < '2012-08-09';

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

select p.ProductName, o.Quantity from orderDetail as o
join product as p on o.ProductId = p.Id
where o.OrderId = 10251
order by p.ProductName;

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
select DISTINCT od.orderId, c.CompanyName, e.lastname from [order] as o
join orderDetail as od on o.Id = od.OrderId
join customer as c on o.CustomerId = c.Id
join employee as e on o.EmployeeId = e.id 