DROP SCHEMA IF EXISTS SpotifyClone ;
CREATE SCHEMA IF NOT EXISTS SpotifyClone;
USE SpotifyClone;

CREATE TABLE IF NOT EXISTS planos(
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome_plano VARCHAR(50) NOT NULL,
  valor DECIMAL(5,2) NOT NULL
);

INSERT INTO planos (nome_plano, valor) VALUES
	('gratuito', '0'),
	('familiar', '7.99'),
	('universitario', '5.99'),
	('pessoal', '6.99');

CREATE TABLE IF NOT EXISTS artistas(
	id INT PRIMARY KEY AUTO_INCREMENT,
  nome_artista VARCHAR(255) NOT NULL
);

INSERT INTO artistas (nome_artista) VALUES
	('Beyoncé'),
	('Queen'),
	('Elis Regina'),
	('Baco Exu do Blues'),
	('Blind Guardian'),
	('Nina Simone');

CREATE TABLE IF NOT EXISTS usuarios(
	id INT PRIMARY KEY AUTO_INCREMENT,
  nome_pessoa VARCHAR(255) NOT NULL,
  idade INT NOT NULL,
  plano_id INT NOT NULL,
  data_assinatura DATE NOT NULL,
  FOREIGN KEY (plano_id) REFERENCES planos(id)
);
INSERT INTO usuarios (nome_pessoa, idade, plano_id, data_assinatura) VALUES
	('Barbara Liskov', '82', '1', '2019-10-20'),
	('Robert Cecil Martin', '58', '1', '2017-01-06'),
	('Ada Lovelace', '37', '2', '2017-12-30'),
	('Martin Fowler', '46', '2', '2017-01-17'),
	('Sandi Metz', '58', '2', '2018-04-29'),
	('Paulo Freire', '19', '3', '2018-02-14'),
	('Bell Hooks', '26', '3', '2018-01-05'),
	('Christopher Alexander', '85', '4', '2019-06-05'),
	('Judith Butler', '45', '4', '2020-05-13'),
	('Jorge Amado', '58', '4', '2017-02-17');

CREATE TABLE IF NOT EXISTS albums(
	id INT PRIMARY KEY AUTO_INCREMENT,
  nome_album VARCHAR(255) NOT NULL,
  artista_id INT NOT NULL,
  FOREIGN KEY (artista_id) REFERENCES artistas(id)
);
INSERT INTO albums (nome_album, artista_id) VALUES
	('Renaissance', '1'),
	('Jazz', '2'),
	('Hot Space', '2'),
	('Falso Brilhante', '3'),
	('Vento de Maio', '3'),
	('QVVJFA?', '4'),
	('Somewhere Far Beyond', '5'),
	('I Put A Spell On You', '6');
    
CREATE TABLE IF NOT EXISTS musicas(
	id INT PRIMARY KEY AUTO_INCREMENT,
  nome_musica VARCHAR(255) NOT NULL,
  duracao_segundos INT NOT NULL,
  album_id INT NOT NULL,
  FOREIGN KEY (album_id) REFERENCES albums(id)
);
INSERT INTO musicas (nome_musica, duracao_segundos, album_id) VALUES
	('BREAK MY SOUL', '279', '1'),
	("VIRGO'S GROOVE", '369', '1'),
	('ALIEN SUPERSTAR', '116', '1'),
	("Don't Stop Me Now", '203', '2'),
	('Under Pressure', '152', '3'),
	('Como Nossos Pais', '105', '4'),
	('O Medo de Amar é o Medo de Ser Livre', '207', '5'),
	('Samba em Paris', '267', '6'),
	("The Bard's Song", '244', '7'),
	('Feeling Good', '100', '8');
    
CREATE TABLE IF NOT EXISTS historico_reproducao(
  pessoa_id INT,
  musica_id INT,
  data_reproducao DATETIME,
  PRIMARY KEY (pessoa_id, musica_id),
  FOREIGN KEY (pessoa_id) REFERENCES usuarios(id),
  FOREIGN KEY (musica_id) REFERENCES musicas(id)
);
INSERT INTO historico_reproducao (pessoa_id, musica_id, data_reproducao) VALUES
	('1', '8', '2022-02-28 10:45:55'),
	('1', '2', '2020-05-02 05:30:35'),
	('1', '10', '2020-03-06 11:22:33'),
	('2', '10', '2022-08-05 08:05:17'),
	('2', '7', '2020-01-02 07:40:33'),
	('3', '10', '2020-11-13 16:55:13'),
	('3', '2', '2020-12-05 18:38:30'),
	('4', '8', '2021-08-15 17:10:10'),
	('5', '8', '2022-01-09 01:44:33'),
	('5', '5', '2020-08-06 15:23:43'),
	('6', '7', '2017-01-24 00:31:17'),
	('6', '1', '2017-10-12 12:35:20'),
	('7', '4', '2011-12-15 22:30:49'),
	('8', '4', '2012-03-17 14:56:41'),
	('9', '9', '2022-02-24 21:14:22'),
	('10', '3', '2015-12-13 08:30:22');

CREATE TABLE IF NOT EXISTS artistas_seguidos(
  pessoa_id INT NOT NULL,
  artista_id INT,
  PRIMARY KEY (pessoa_id, artista_id),
  FOREIGN KEY (pessoa_id) REFERENCES usuarios(id),
  FOREIGN KEY (artista_id) REFERENCES artistas(id)
);
INSERT INTO artistas_seguidos (pessoa_id, artista_id) VALUES
	('1', '1'),
	('1', '2'),
	('1', '3'),
	('2', '1'),
	('2', '3'),
	('3', '2'),
	('4', '4'),
	('5', '5'),
	('5', '6'),
	('6', '6'),
	('6', '1'),
	('7', '6'),
	('9', '3'),
	('10', '2');