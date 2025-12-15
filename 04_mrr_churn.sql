CREATE VIEW vw_mrr_churn AS
SELECT
    DATE_TRUNC('month', p.payment_date) AS month,
    SUM(p.amount) AS total_mrr,
    SUM(
        CASE
            WHEN vcs.is_churned = 1 THEN p.amount ELSE 0
        END
    ) AS churned_mrr
FROM payments p
JOIN subscriptions s ON p.subscription_id = s.subscription_id
JOIN vw_customer_churn_status vcs ON s.customer_id = vcs.customer_id
WHERE p.payment_status = 'success'
GROUP BY month
ORDER BY month;
