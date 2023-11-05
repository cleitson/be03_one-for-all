SELECT a.nome_artista as artista, ab.nome_album as album, count(DISTINCT s.pessoa_id) as pessoas_seguidoras
	from artistas_seguidos as s 
    inner join artistas as a on a.id = s.artista_id
	inner join albums as ab on a.id = ab.artista_id
    GROUP BY a.id, a.nome_artista, ab.nome_album
    ORDER BY pessoas_seguidoras desc, artista, album;