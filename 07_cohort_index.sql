CREATE VIEW vw_cohort_activity_index AS
SELECT
    cc.customer_id,
    cc.cohort_month,
    ca.activity_month,
    (
        EXTRACT(YEAR FROM ca.activity_month) - EXTRACT(YEAR FROM cc.cohort_month)
    ) * 12
    +
    (
        EXTRACT(MONTH FROM ca.activity_month) - EXTRACT(MONTH FROM cc.cohort_month)
    ) AS month_index
FROM vw_customer_cohort cc
JOIN vw_customer_monthly_activity ca
    ON cc.customer_id = ca.customer_id;
