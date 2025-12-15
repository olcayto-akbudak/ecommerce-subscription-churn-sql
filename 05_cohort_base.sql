CREATE VIEW vw_customer_cohort AS
SELECT
    c.customer_id,
    DATE_TRUNC('month', MIN(p.payment_date)) AS cohort_month
FROM customers c
JOIN subscriptions s ON c.customer_id = s.customer_id
JOIN payments p ON s.subscription_id = p.subscription_id
WHERE p.payment_status = 'success'
GROUP BY c.customer_id;
