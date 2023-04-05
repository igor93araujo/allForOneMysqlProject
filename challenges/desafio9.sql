SELECT
  COUNT(p.song_id) AS musicas_no_historico
FROM SpotifyClone.users AS u
INNER JOIN SpotifyClone.playlists AS p ON u.user_id = p.user_id
WHERE u.user_name = 'Barbara Liskov';
