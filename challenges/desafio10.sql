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
