select  COUNT(m.nome_musica) as cancoes, COUNT(DISTINCT a.nome_artista) as artistas, COUNT(DISTINCT ab.nome_album) as albuns
	from artistas as a    
	inner join albums as ab on a.id = ab.artista_id 
    inner join musicas as m on ab.id = m.album_id;