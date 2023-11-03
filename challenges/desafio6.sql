select min(p.valor) as faturamento_minimo, max(p.valor) as faturamento_maximo, round(avg(p.valor), 2) as faturamento_medio, sum(p.valor) as faturamento_total
	from planos as p
    inner join usuarios as u on u.plano_id = p.id;