SELECT InvoiceId , SUM(Quantity) as sum_qty
FROM InvoiceLine il 
GROUP BY InvoiceId 
HAVING sum_qty > 10 