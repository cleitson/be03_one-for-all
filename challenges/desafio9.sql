select count(h.data_reproducao) as musicas_no_historico
	from historico_reproducao as h
    inner join usuarios as u  on u.id = h.pessoa_id
    where u.nome_pessoa like "Barbara Liskov";