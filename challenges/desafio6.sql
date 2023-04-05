SELECT
  MIN(u.plan_id) AS faturamento_minimo,
  MAX(u.plan_id) AS faturamento_maximo,
  ROUND(AVG(u.plan_id), 2) AS faturamento_medio,
  ROUND(SUM(u.plan_id), 2) AS faturamento_total
FROM SpotifyClone.users AS u;

