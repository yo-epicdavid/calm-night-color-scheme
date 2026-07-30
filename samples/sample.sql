-- Calm Night — SQL sample (DataGrip).
-- Top merchants by settled revenue in the last 30 days.
SELECT
    m.id                         AS merchant_id,
    m.name                       AS merchant_name,
    COUNT(c.id)                  AS charge_count,
    SUM(c.amount_cents) / 100.0  AS revenue_usd
FROM charges AS c
JOIN merchants AS m ON m.id = c.merchant_id
WHERE c.status = 'approved'
  AND c.created_at >= NOW() - INTERVAL '30 days'
GROUP BY m.id, m.name
HAVING SUM(c.amount_cents) > 100000   -- more than $1,000.00
ORDER BY revenue_usd DESC
LIMIT 10;
