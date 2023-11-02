SELECT 
    u.nome_pessoa as pessoa_usuaria,
    CASE 
        WHEN h.data_reproducao >= '2021-01-01' THEN 'Ativa'
        ELSE 'Inativa' 
    END as status_pessoa_usuaria
FROM 
    (SELECT pessoa_id, MAX(data_reproducao) as data_reproducao 
		 FROM historico_reproducao 
		 GROUP BY pessoa_id) as h
	INNER JOIN usuarios as u 
	ON u.id = h.pessoa_id
	ORDER BY pessoa_usuaria;