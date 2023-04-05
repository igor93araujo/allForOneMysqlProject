SELECT
    artists.artist_name AS artista,
    CASE    
        WHEN COUNT(favorite_songs.song_id) >= 5 THEN 'A'
        WHEN COUNT(favorite_songs.song_id) >= 3  THEN 'B'
        WHEN COUNT(favorite_songs.song_id) >= 1 THEN 'C'
        WHEN COUNT(favorite_songs.song_id) = 0 THEN '-'
    END AS ranking
FROM SpotifyClone.artists
INNER JOIN SpotifyClone.albums ON artists.artist_id = albums.artist_id
INNER JOIN SpotifyClone.songs ON albums.album_id = songs.album_id
LEFT JOIN SpotifyClone.favorite_songs ON songs.song_id = favorite_songs.song_id
GROUP BY artists.artist_name
ORDER BY COUNT(favorite_songs.song_id) DESC, artists.artist_name ASC;
