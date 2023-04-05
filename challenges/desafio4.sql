SELECT 
  u.user_name AS pessoa_usuaria,
  CASE
    WHEN MAX(p.reproduction_date) >= '2021-01-01' THEN 'Ativa'
    ELSE 'Inativa'
  END AS status_pessoa_usuaria
FROM SpotifyClone.users AS u
INNER JOIN SpotifyClone.playlists AS p ON u.user_id = p.user_id
GROUP BY u.user_name
ORDER BY u.user_name;
