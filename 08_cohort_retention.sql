CREATE VIEW vw_cohort_retention_rate AS
SELECT
    r.cohort_month,
    r.month_index,
    COUNT(DISTINCT r.customer_id) AS retained_customers,
    cs.cohort_size,
    ROUND(
        COUNT(DISTINCT r.customer_id)::DECIMAL / cs.cohort_size * 100,
        2
    ) AS retention_rate
FROM vw_cohort_activity_index r
JOIN (
    SELECT
        cohort_month,
        COUNT(DISTINCT customer_id) AS cohort_size
    FROM vw_customer_cohort
    GROUP BY cohort_month
) cs
    ON r.cohort_month = cs.cohort_month
GROUP BY
    r.cohort_month,
    r.month_index,
    cs.cohort_size
ORDER BY
    r.cohort_month,
    r.month_index;
