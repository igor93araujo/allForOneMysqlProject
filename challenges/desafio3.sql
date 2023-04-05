SELECT
  u.user_name AS pessoa_usuaria,
  COUNT(so.song_name) AS musicas_ouvidas,
  ROUND(SUM(so.song_duration) / 60, 2) AS total_minutos
FROM SpotifyClone.users AS u
INNER JOIN SpotifyClone.playlists AS p ON u.user_id = p.user_id
INNER JOIN SpotifyClone.songs AS so ON p.song_id = so.song_id
GROUP BY u.user_name
ORDER BY u.user_name;