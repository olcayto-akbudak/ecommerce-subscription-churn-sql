CREATE VIEW vw_monthly_churn_metrics AS
WITH monthly_customers AS (
    SELECT DISTINCT
        DATE_TRUNC('month', p.payment_date) AS month,
        c.customer_id
    FROM customers c
    JOIN subscriptions s ON c.customer_id = s.customer_id
    JOIN payments p
        ON s.subscription_id = p.subscription_id
    WHERE p.payment_status = 'success'
)
SELECT
    mc.month,
    COUNT(DISTINCT mc.customer_id) AS active_customers,
    SUM(CASE WHEN vcs.is_churned = 1 THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN vcs.is_churned = 1 THEN 1 ELSE 0 END)::DECIMAL
        / COUNT(DISTINCT mc.customer_id) * 100, 2
    ) AS churn_rate
FROM monthly_customers mc
JOIN vw_customer_churn_status vcs
    ON mc.customer_id = vcs.customer_id
GROUP BY mc.month
ORDER BY mc.month;
