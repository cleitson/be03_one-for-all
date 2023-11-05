SELECT a.nome_artista as artista, ab.nome_album as album
	from artistas as a
	inner join albums as ab on a.id = ab.artista_id
    where a.nome_artista LIKE "Elis Regina"
    ORDER BY album;