--Show a running total of daily revenue

-- DB schema 
CREATE TABLE daily_sales (
    sale_date DATE,
    revenue INT
);

INSERT INTO daily_sales VALUES
('2024-01-01', 100),
('2024-01-02', 150),
('2024-01-03', 200),
('2024-01-04', 120);

-- Solution 

select sale_date, revenue, 
SUM(revenue) OVER( order by sale_date
                  ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
                  as running_total
 From daily_sales
