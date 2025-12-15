CREATE VIEW vw_customer_churn_status AS
SELECT
    c.customer_id,
    MAX(p.payment_date) AS last_payment_date,
    MAX(s.status) AS subscription_status,
    CASE
        WHEN MAX(s.status) = 'cancelled'
             OR MAX(p.payment_date) < CURRENT_DATE - INTERVAL '30 DAY'
        THEN 1
        ELSE 0
    END AS is_churned
FROM customers c
LEFT JOIN subscriptions s ON c.customer_id = s.customer_id
LEFT JOIN payments p
    ON s.subscription_id = p.subscription_id
    AND p.payment_status = 'success'
GROUP BY c.customer_id;
