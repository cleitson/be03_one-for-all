select m.nome_musica as cancao, count(h.musica_id)as reproducoes
	from historico_reproducao as h 
    inner join musicas as m on m.id = h.musica_id
    group by h.musica_id
    ORDER BY reproducoes desc, cancao LIMIT 2;