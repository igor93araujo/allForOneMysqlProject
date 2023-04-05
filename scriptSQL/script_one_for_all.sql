CREATE TABLE SpotifyClone.favorite_songs(
  user_id INT NOT NULL,
  song_id INT NOT NULL,
  PRIMARY KEY (user_id, song_id),
  FOREIGN KEY (user_id) REFERENCES SpotifyClone.users(user_id),
  FOREIGN KEY (song_id) REFERENCES SpotifyClone.songs(song_id)
);

INSERT INTO SpotifyClone.favorite_songs (user_id, song_id) VALUES
  (1, 9),
	(1, 10),
	(1, 3),
	(2, 7),
	(3, 1),
	(3, 9),
	(4, 4),
	(4, 7),
	(5, 3),
	(5, 2),
	(8, 7),
	(9, 4),
	(10, 9);
    
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

SELECT
    CASE
        WHEN users.user_age <= 30 THEN 'Até 30 anos'
        WHEN users.user_age >= 31 AND users.user_age <= 60 THEN 'Entre 31 e 60 anos'
        ELSE 'Maior de 60 anos'
    END AS faixa_etaria,
    COUNT(DISTINCT users.user_id) AS total_pessoas_usuarias,
    COUNT(favorite_songs.song_id) AS total_favoritadas
FROM SpotifyClone.users
LEFT JOIN SpotifyClone.favorite_songs ON users.user_id = favorite_songs.user_id
GROUP BY faixa_etaria
ORDER BY faixa_etaria;

