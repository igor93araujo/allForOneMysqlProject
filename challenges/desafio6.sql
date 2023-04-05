SELECT
  MIN (p.plan_price) AS faturamento_minimo,
  CONVERT (MAX (p.plan_price), CHAR) AS faturamento_maximo,
  CONVERT (ROUND (AVG (p.plan_price), 2), CHAR) AS faturamento_medio,
  CONVERT (ROUND (SUM (p.plan_price), 2), CHAR) AS faturamento_total
    FROM SpotifyClone.plans AS p
    INNER JOIN SpotifyClone.users AS u
    ON p.plan_id = u.plan_id;

    

