   SELECT 
    COUNT( distinct so.song_id) AS cancoes,
    COUNT( distinct ar.artist_id) AS artistas,
    COUNT( distinct al.album_id) AS albuns
     FROM SpotifyClone.songs AS so
     INNER JOIN SpotifyClone.albums AS al
       ON so.album_id = al.album_id
     INNER JOIN SpotifyClone.artists AS ar
       ON al.artist_id = ar.artist_id;
