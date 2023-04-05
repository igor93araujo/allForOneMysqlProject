DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;

CREATE TABLE SpotifyClone.plans (
    plan_id INT PRIMARY KEY AUTO_INCREMENT,
    plan_name VARCHAR(255) NOT NULL,
    plan_price DECIMAL(10,2) NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.users (
    user_id INT auto_increment PRIMARY KEY ,
    user_name VARCHAR(255) NOT NULL,
    user_age INT NOT NULL,
    plan_id	INT NOT NULL,
		plan_data DATE,
		FOREIGN KEY (plan_id) REFERENCES SpotifyClone.plans(plan_id)
);

CREATE TABLE SpotifyClone.artists (
		artist_id INT auto_increment PRIMARY KEY,
    artist_name VARCHAR(512) NOT NULL
);

CREATE TABLE SpotifyClone.albums (
    album_id INT NOT NULL AUTO_INCREMENT,
    album_name VARCHAR(255) NOT NULL,
    album_year YEAR NOT NULL,
    artist_id INT NOT NULL,
    PRIMARY KEY (album_id),
    FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artists(artist_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.songs (
    song_id INT NOT NULL AUTO_INCREMENT,
    song_name VARCHAR(255) NOT NULL,
    song_duration INT NOT NULL,
    album_id INT NOT NULL,
    PRIMARY KEY (song_id),
    FOREIGN KEY (album_id) REFERENCES SpotifyClone.albums(album_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.playlists (
    user_id INT NOT NULL,
    song_id INT NOT NULL,
    reproduction_date DATETIME NOT NULL,
    PRIMARY KEY (user_id, song_id),
    FOREIGN KEY (user_id) REFERENCES SpotifyClone.users(user_id),
    FOREIGN KEY (song_id) REFERENCES SpotifyClone.songs(song_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.followers (
		user_id INT NOT NULL,
		artist_id INT NOT NULL,
		CONSTRAINT PRIMARY KEY (user_id, artist_id),
		FOREIGN KEY (user_id) REFERENCES SpotifyClone.users(user_id),
		FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artists(artist_id)
);


  INSERT INTO SpotifyClone.plans (plan_id, plan_name, plan_price) VALUES
	(1, 'gratuito', 0),
	(2, 'familiar', 7.99),
	(3, 'universitario', 5.99),
	(4, 'pessoal', 6.99);	

INSERT INTO SpotifyClone.users (user_id, user_name, user_age, plan_id, plan_data) VALUES
	('1', 'Barbara Liskov', '82', '1', '2019-10-20'),
	('2', 'Robert Cecil Martin', '58', '1', '2017-01-06'),
	('3', 'Ada Lovelace', '37', '2', '2017-12-30'),
	('4', 'Martin Fowler', '46', '2', '2017-01-17'),
	('5', 'Sandi Metz', '58', '2', '2018-04-29'),
	('6', 'Paulo Freire', '19', '3', '2018-02-14'),
	('7', 'Bell Hooks', '26', '3', '2018-01-05'),
	('8', 'Christopher Alexander', '85', '4', '2019-06-05'),
	('9', 'Judith Butler', '45', '4', '2020-05-13'),
	('10', 'Jorge Amado', '58', '4', '2017-02-17');
    
  INSERT INTO SpotifyClone.artists (artist_id, artist_name) VALUES
	(1, 'Beyoncé'),
	(2, 'Queen'),
	(3, 'Elis Regina'),
	(4, 'Baco Exu do Blues'),
	(5, 'Blind Guardian'),
	(6, 'Nina Simone');
    
      INSERT INTO SpotifyClone.albums (album_id, album_name, artist_id, album_year) VALUES
	(1, 'Renaissance', 1, 2022),
	(2, 'Jazz', 2, 1978),
	(3, 'Hot Space', 2, 1982),
	(4, 'Falso Brilhante', 3, 1998),
	(5, 'Vento de Maio', 3, 2001),
	(6, 'QVVJFA?', 4, 2003),
	(7, 'Somewhere Far Beyond', 5, 2007),
	(8, 'I Put A Spell On You', 6, 2012);
    
      INSERT INTO SpotifyClone.songs (song_id, song_name, song_duration, album_id) VALUES
	(1, 'BREAK MY SOUL', 279, 1),
	(2, "VIRGO'S GROOVE", 369, 1),
	(3, 'Feeling Good', 100, 8),
	(4, 'O Medo de Amar é o Medo de Ser Livre', 207, 5),
	(5, 'Samba em Paris', 267, 6),
	(6, 'Under Pressure', 152, 3),
	(7, "Don't Stop Me Now", 203, 2),
	(8, "The Bard's Song", 244, 7),
	(9, 'ALIEN SUPERSTAR', 116, 1),
	(10, 'Como Nossos Pais', 105, 4);
    
    INSERT INTO SpotifyClone.playlists (user_id, song_id, reproduction_date) VALUES
	(1, 5, '2022-02-28 10:45:55'),
	(1, 2, '2020-05-02 05:30:35'),
	(1, 3, '2020-03-06 11:22:33'),
	(2, 3, '2022-08-05 08:05:17'),
	(2, 4, '2020-01-02 07:40:33'),
	(3, 3, '2020-11-13 16:55:13'),
	(3, 2, '2020-12-05 18:38:30'),
	(4, 5, '2021-08-15 17:10:10'),
	(5, 5, '2022-01-09 01:44:33'),
	(5, 6, '2020-08-06 15:23:43'),
	(6, 4, '2017-01-24 00:31:17'),
	(6, 1, '2017-10-12 12:35:20'),
	(7, 7, '2011-12-15 22:30:49'),
	(8, 7, '2012-03-17 14:56:41'),
	(9, 8, '2022-02-24 21:14:22'),
	(10, 9, '2015-12-13 08:30:22');
    

  INSERT INTO SpotifyClone.followers (artist_id, user_id) VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(1, 2),
	(3, 2),
	(3, 3),
	(4, 4),
	(4, 5),
	(5, 5),
	(1, 6),
	(6, 6),
	(6, 7),
	/* (null, 8), */
	(3, 9),
	(2, 10)
