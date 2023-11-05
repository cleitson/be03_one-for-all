select DISTINCT a.nome_album as album, count(mf.musica_id) as favoritadas
	from musicas as m
    INNER join albums as a on m.album_id = a.id
    INNER JOIN musicas_favoritas as mf on mf.musica_id = m.id
    GROUP BY album
    ORDER BY favoritadas desc LIMIT 3;