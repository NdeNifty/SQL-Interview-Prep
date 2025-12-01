-- Find customers who never made a purchase 

-- DB Schema 
CREATE TABLE customers (
    customer_id INT,
    name VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT,
    customer_id INT
);

INSERT INTO customers VALUES
(1, 'John'),
(2, 'Mary'),
(3, 'Peter'),
(4, 'Anna');

INSERT INTO orders VALUES
(201, 1),
(202, 2),
(203, 1);


-- solution 

Select c.name
from customers c
left join orders o using(customer_id)
where o.customer_id is Null
