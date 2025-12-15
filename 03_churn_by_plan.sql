CREATE VIEW vw_churn_by_plan AS
SELECT
    s.plan_type,
    COUNT(DISTINCT s.customer_id) AS total_customers,
    SUM(CASE WHEN vcs.is_churned = 1 THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN vcs.is_churned = 1 THEN 1 ELSE 0 END)::DECIMAL
        / COUNT(DISTINCT s.customer_id) * 100, 2
    ) AS churn_rate
FROM subscriptions s
JOIN vw_customer_churn_status vcs
    ON s.customer_id = vcs.customer_id
GROUP BY s.plan_type;
