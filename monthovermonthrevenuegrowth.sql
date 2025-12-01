-- Calculate month-over-month revenue growth percentage.
-- Db schema

CREATE TABLE monthly_sales (
    sale_date DATE,
    revenue INT
);

INSERT INTO monthly_sales VALUES
('2024-01-15', 1000),
('2024-02-15', 1200),
('2024-03-15', 1500),
('2024-04-15', 1300);

-- Solution 
select sale_date, revenue,
lag(revenue) Over(order by sale_date) as prevmonth,

Round(100* (revenue - lag(revenue) Over(order by sale_date))/lag(revenue) Over(order by sale_date)
) as mon_growth_pct
from monthly_sales
order by sale_date
