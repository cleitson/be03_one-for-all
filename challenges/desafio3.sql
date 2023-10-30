select u.nome_pessoa as pessoa_usuaria, COUNT(h.musica_id) as musicas_ouvidas, SUM(round((m.duracao_segundos / 60), 2)) as total_minutos
	from usuarios as u
    INNER JOIN historico_reproducao as h on h.pessoa_id = u.id
    INNER JOIN musicas as m on h.musica_id = m.id
    GROUP BY u.nome_pessoa ORDER BY u.nome_pessoa;