SELECT c.customer_name  , e.first_name , COUNT(e.first_name) as jml_customerhandle
FROM customers c 
LEFT JOIN	employees e ON c.sales_rep_employee_number = e.employee_number 
GROUP BY e.first_name 
HAVING jml_customerhandle  > 3
ORDER BY e.first_name 

SELECT c.city , COUNT(DISTINCT o.order_number) as jmlorder
FROM customers c  
INNER JOIN orders o  ON o.customer_number = c.customer_number 
GROUP BY c.customer_number 
ORDER BY jmlorder DESC 

SELECT * , MAX(msrp) 
FROM products p 

SELECT c.city , AVG(o2.quantity_ordered) as basketsize
FROM customers c  
INNER JOIN orders o  ON o.customer_number = c.customer_number
INNER JOIN orderdetails o2 ON o.order_number = o2.order_number 
GROUP BY o2.order_number  
ORDER BY basketsize


