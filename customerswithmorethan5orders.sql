-- Find the customers with more than 5 orders 

Schema 
CREATE TABLE customers (
    customer_id INT,
    name VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT,
    customer_id INT,
    order_date DATE
);

INSERT INTO customers VALUES
(1, 'John'),
(2, 'Mary'),
(3, 'Peter');

INSERT INTO orders VALUES
(101, 1, '2024-01-01'),
(102, 1, '2024-01-02'),
(103, 1, '2024-01-03'),
(104, 1, '2024-01-04'),
(105, 1, '2024-01-05'),
(106, 1, '2024-01-06'),
(107, 2, '2024-01-01');



--- Solution 

select c.name, count(o.order_id) as num_orders
from customers c
join orders o on c.customer_id = o.customer_id
group by o.customer_id, c.name
having count(o.order_id) > 5
