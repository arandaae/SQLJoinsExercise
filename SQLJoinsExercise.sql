/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
 SELECT products.Name, categories.Name
 FROM bestbuy.products
 INNER JOIN categories
 ON products.CategoryID=categories.CategoryID
 WHERE categories.Name = "Computers";
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 SELECT products.Name, products.Price, reviews.Rating
 FROM bestbuy.products
 INNER JOIN reviews
 ON products.ProductID=reviews.ReviewID
 WHERE Rating=5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT e.FirstName AS "First Name", e.LastName AS "Last Name", sum(s.Quantity) AS Quantity
FROM bestbuy.employees AS e
INNER JOIN sales AS s ON e.EmployeeID=s.EmployeeID
GROUP BY e.EmployeeID ORDER BY sum(s.Quantity) DESC LIMIT 2;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT c.Name AS Category, d.Name AS Department 
FROM bestbuy.categories AS c
INNER JOIN departments AS d ON c.DepartmentID=d.DepartmentID
WHERE c.Name = 'Appliances' OR c.Name = 'Games';

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT p.Name AS Product, SUM(s.Quantity) AS Quantity, (s.PricePerUnit*SUM(s.Quantity)) AS Total 
FROM bestbuy.products AS p
INNER JOIN sales AS s ON s.ProductID=p.ProductID
WHERE p.Name = 'Eagles: Hotel California';

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT p.Name, r.Reviewer, r.Rating, r.Comment 
FROM bestbuy.reviews AS r 
INNER JOIN products AS p ON p.ProductID=r.ProductID
WHERE Name="Visio TV" ORDER BY r.Rating LIMIT 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */
SELECT e.EmployeeID, e.FirstName, e.LastName, p.Name AS Product, s.Quantity
FROM bestbuy.employees AS e
INNER JOIN sales AS s ON s.EmployeeID=e.EmployeeID
INNER JOIN products AS p ON p.ProductID=s.ProductID
ORDER BY EmployeeID;
