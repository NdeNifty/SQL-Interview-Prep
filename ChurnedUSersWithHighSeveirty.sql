-- Question: Users who had severity ≥ 8 ticket in the 30 days BEFORE churn_date
-- DB query
CREATE TABLE churn_events (user_id INT, churn_date DATE);
CREATE TABLE support_tickets (user_id INT, ticket_date DATE, severity INT);

INSERT INTO churn_events VALUES (101,'2024-07-15'),(102,'2024-08-20');
INSERT INTO support_tickets VALUES
(101,'2024-06-20',9),(101,'2024-07-10',8),(102,'2024-07-25',5),(103,'2024-06-01',10);

-- Solution 
Select c.user_id, c.churn_date, s.severity
From churn_events c
inner join support_tickets s using(user_id)
where severity >= 8
AND s.ticket_date >= DATE_SUB(c.churn_date, INTERVAL 30 DAY) 
AND s.ticket_date <= c.churn_date
Order by c.user_id, s.ticket_date
