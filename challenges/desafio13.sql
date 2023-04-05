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

