SELECT 
    albums.album_name AS album,
    COUNT(favorite_songs.song_id) AS favoritadas
FROM
    SpotifyClone.albums
        INNER JOIN
    SpotifyClone.songs ON albums.album_id = songs.album_id
        INNER JOIN
    SpotifyClone.favorite_songs ON songs.song_id = favorite_songs.song_id
GROUP BY albums.album_id
ORDER BY favoritadas DESC , album
LIMIT 3;