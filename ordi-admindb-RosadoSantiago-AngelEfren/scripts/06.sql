USE ordi-admindb-RosadoSantiago-AngelEfren;

SELECT u.user_id, u.name, u.email,
       SUM(l.duration_listened_seconds)/60.0 AS total_minutes_2025
FROM listens l
JOIN users u ON u.user_id = l.user_id
WHERE YEAR(l.listened_at) = 2025
GROUP BY u.user_id
ORDER BY total_minutes_2025 DESC
LIMIT 1;
SELECT s.user_id, u.name, COUNT(*) AS contrataciones_2025
FROM subscriptions s
JOIN users u ON u.user_id = s.user_id
WHERE YEAR(s.start_date) = 2025 OR YEAR(s.end_date) = 2025
GROUP BY s.user_id
ORDER BY contrataciones_2025 DESC
LIMIT 1;
SELECT s.user_id, u.name,
       GROUP_CONCAT(DISTINCT DATE_FORMAT(s.end_date, '%Y-%m') ORDER BY s.end_date SEPARATOR ', ') AS meses_cancelado
FROM subscriptions s
JOIN users u ON u.user_id = s.user_id
WHERE YEAR(s.end_date) = 2025
GROUP BY s.user_id
ORDER BY COUNT(*) DESC
LIMIT 1;
SELECT DATE_FORMAT(start_date, '%Y-%m') AS mes, SUM(price) AS total_recaudado
FROM subscriptions
WHERE YEAR(start_date) = 2025
GROUP BY mes
ORDER BY mes;