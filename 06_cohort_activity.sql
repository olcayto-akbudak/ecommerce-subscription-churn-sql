CREATE VIEW vw_customer_monthly_activity AS
SELECT DISTINCT
    c.customer_id,
    DATE_TRUNC('month', p.payment_date) AS activity_month
FROM customers c
JOIN subscriptions s ON c.customer_id = s.customer_id
JOIN payments p ON s.subscription_id = p.subscription_id
WHERE p.payment_status = 'success';
