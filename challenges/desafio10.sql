CREATE TABLE IF NOT EXISTS musicas_favoritas(
  pessoa_id INT NOT NULL,
  musica_id INT,
  PRIMARY KEY (pessoa_id, musica_id),
  FOREIGN KEY (pessoa_id) REFERENCES usuarios(id),
  FOREIGN KEY (musica_id) REFERENCES musicas(id)
);

INSERT INTO musicas_favoritas (pessoa_id, musica_id) VALUES
	('1','3'),
  ('1','6'),
  ('1','10'),
  ('2','4'),
  ('3','1'),
  ('3','3'),
  ('4','7'),
  ('4','4'),
  ('5','10'),
  ('5','2'),
  ('6','4'),
  ('7','7'),
  ('8','3');	
