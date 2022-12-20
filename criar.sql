PRAGMA foreign_keys = ON;

drop table if exists Clube;
drop table if exists Jogador;
drop table if exists Jogo;
drop table if exists Pavilhao;
drop table if exists Contrato;
drop table if exists EstatisticasClube;
drop table if exists Grupo;
drop table if exists Evento;
drop table if exists Campeonato;
drop table if exists Ponto;
drop table if exists Substituicao;

create table Clube (
    nome_clube VARCHAR(50) PRIMARY KEY,
    ano_fundacao YEAR NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    treinador VARCHAR(50) NOT NULL
);

create table Jogador (
    nr_licenca INTEGER(6) PRIMARY KEY,
    nome_jogador VARCHAR(50) NOT NULL,
    data_nascimento DATE NOT NULL,
    altura INTEGER(3) CHECK(altura >= 150 AND altura <= 270),
    sexo CHAR(1) CHECK(sexo = 'M'),
    nacionalidade VARCHAR(50) NOT NULL,
    pontos_marcados INTEGER CHECK(pontos_marcados >= 0) DEFAULT 0
);

create table Jogo (
    id_jogo INTEGER PRIMARY KEY,
    ano YEAR NOT NULL,
    jornada INTEGER NOT NULL CHECK(jornada >= 1),
    data_jogo DATE NOT NULL,
    visitado VARCHAR(50) NOT NULL CHECK(visitante <> visitado),
    visitante VARCHAR(50) NOT NULL,
    resultado VARCHAR(10) NOT NULL,
    fase VARCHAR(20) NOT NULL,
    FOREIGN KEY(ano) REFERENCES Campeonato(ano) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(visitante) REFERENCES Clube(nome_clube) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(visitado) REFERENCES Clube(nome_clube) ON DELETE CASCADE ON UPDATE CASCADE
);

create table Pavilhao (
    id_pavilhao INTEGER PRIMARY KEY,
    nome_pavilhao VARCHAR(50) NOT NULL,
    nome_clube VARCHAR(50) NOT NULL,
    morada VARCHAR(100) NOT NULL,
    capacidade INTEGER CHECK(capacidade >= 0) DEFAULT 0,
    FOREIGN KEY(nome_clube) REFERENCES Clube(nome_clube) ON DELETE CASCADE ON UPDATE CASCADE
);

create table Contrato (
    nr_licenca INTEGER(6) PRIMARY KEY,
    nome_clube VARCHAR(50) NOT NULL,
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL CHECK(data_fim > data_inicio),
    salario FLOAT NOT NULL CHECK(salario >= 0.0),
    FOREIGN KEY(nr_licenca) REFERENCES Jogador(nr_licenca) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(nome_clube) REFERENCES Clube(nome_clube) ON DELETE CASCADE ON UPDATE CASCADE
);

create table EstatisticasClube (
    idEstatistica INTEGER PRIMARY KEY,
    nome_clube VARCHAR(50),
    ano YEAR NOT NULL,
    posicao INTEGER CHECK(posicao >= 1 AND posicao <= 12) NOT NULL,
    n_jogos INTEGER CHECK(n_jogos >= 0) NOT NULL,
    pontuacao INTEGER CHECK(pontuacao >= 0) NOT NULL,
    n_vitorias INTEGER CHECK(n_vitorias >= 0) NOT NULL,
    n_derrotas INTEGER CHECK(n_derrotas >= 0) NOT NULL,
    n_pontos_marcados INTEGER CHECK(n_pontos_marcados >= 0) NOT NULL,
    n_pontos_sofridos INTEGER CHECK(n_pontos_sofridos >= 0) NOT NULL,
    FOREIGN KEY(nome_clube) REFERENCES Clube(nome_clube) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(ano) REFERENCES Campeonato(ano) ON DELETE CASCADE ON UPDATE CASCADE
);

create table Grupo (
    letra VARCHAR(1) NOT NULL CHECK(letra = 'A' OR letra = 'B' OR letra = 'C'),
    nome_clube VARCHAR(50) NOT NULL PRIMARY KEY,
    FOREIGN KEY(nome_clube) REFERENCES Clube(nome_clube) ON DELETE CASCADE ON UPDATE CASCADE
);

create table Campeonato (
    ano YEAR PRIMARY KEY,
    n_jogos INTEGER CHECK(n_jogos >= 0)
);

create table Evento (
    id_evento INTEGER PRIMARY KEY,
    minuto INTEGER CHECK(minuto >= 0 AND minuto < 40) NOT NULL,
    id_jogo INTEGER,
    FOREIGN KEY(id_jogo) REFERENCES Jogo(id_jogo) ON DELETE CASCADE ON UPDATE CASCADE
);

create table Ponto (
    id_ponto INTEGER PRIMARY KEY,
    quantidade INTEGER(1) NOT NULL CHECK(quantidade >= 0 AND quantidade <= 3),
    nr_licenca INTEGER(6) NOT NULL,
    id_evento INTEGER NOT NULL,
    FOREIGN KEY(nr_licenca) REFERENCES Jogador(nr_licenca) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(id_evento) REFERENCES Evento(id_evento) ON DELETE CASCADE ON UPDATE CASCADE
);

create table Substituicao (
    id_substituicao INTEGER PRIMARY KEY,
    jogador_saiu INTEGER(6) NOT NULL,
    jogador_entrou INTEGER(6) NOT NULL,
    id_evento INTEGER NOT NULL,
    FOREIGN KEY(jogador_saiu) REFERENCES Jogador(nr_licenca) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(jogador_entrou) REFERENCES Jogador(nr_licenca) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(id_evento) REFERENCES Evento(id_evento) ON DELETE CASCADE ON UPDATE CASCADE
);