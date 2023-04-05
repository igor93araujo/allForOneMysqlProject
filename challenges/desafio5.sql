SELECT 
  u.song_name AS cancao,
  COUNT(p.song_id) AS reproducoes
FROM SpotifyClone.songs AS u
INNER JOIN SpotifyClone.playlists AS p ON u.song_id = p.song_id
GROUP BY u.song_name
ORDER BY reproducoes DESC, cancao ASC
LIMIT 2;

