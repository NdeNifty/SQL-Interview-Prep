-- Question Show MAU for every month from Jan 2024 → Dec 2025 (show 0 where no activity)

-- DB schema
CREATE TABLE logins (
    user_id    INT,
    login_date DATE
);

INSERT INTO logins VALUES
(1,'2024-01-05'),(1,'2024-01-20'),(2,'2024-01-10'),(3,'2024-02-01'),
(1,'2024-02-15'),(2,'2024-03-03'),(1,'2024-04-12'),(4,'2024-06-30');

-- solution
WITH calendar AS (
    -- Generate every month from 2024-01 to 2025-12
    SELECT generate_series(
        '2024-01-01'::date,
        '2025-12-01'::date,
        interval '1 month'
    ) AS month_start
),
monthly_logins AS (
    SELECT 
        DATE_TRUNC('month', login_date)::date AS month_start,
        COUNT(DISTINCT user_id)                AS active_users
    FROM logins
    WHERE login_date >= '2024-01-01' 
      AND login_date <  '2026-01-01'
    GROUP BY DATE_TRUNC('month', login_date)
)
SELECT 
    c.month_start,
    COALESCE(ml.active_users, 0) AS mau
FROM calendar c
LEFT JOIN monthly_logins ml USING (month_start)
ORDER BY c.month_start;
