CREATE TABLE Motorista (
    id_motorista INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    cnh VARCHAR(20) NOT NULL,
    telefone VARCHAR(20)
);

CREATE TABLE Veiculo (
    id_veiculo INT PRIMARY KEY AUTO_INCREMENT,
    placa VARCHAR(8) NOT NULL UNIQUE,
    modelo VARCHAR(50),
    tipo VARCHAR(30)
);

CREATE TABLE Portaria (
    id_portaria INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    localizacao VARCHAR(100)
);

CREATE TABLE RegistroAcesso (
    id_registro INT PRIMARY KEY AUTO_INCREMENT,
    id_veiculo INT NOT NULL,
    id_motorista INT NOT NULL,
    id_portaria INT NOT NULL,
    data_hora_entrada DATETIME NOT NULL,
    data_hora_saida DATETIME,
    status VARCHAR(20) NOT NULL DEFAULT 'pendente',
    FOREIGN KEY (id_veiculo) REFERENCES Veiculo(id_veiculo),
    FOREIGN KEY (id_motorista) REFERENCES Motorista(id_motorista),
    FOREIGN KEY (id_portaria) REFERENCES Portaria(id_portaria)
);

CREATE TABLE Carga (
    id_carga INT PRIMARY KEY AUTO_INCREMENT,
    id_registro INT NOT NULL,
    status_basculante VARCHAR(20) NOT NULL,
    data_hora_verificacao DATETIME NOT NULL,
    FOREIGN KEY (id_registro) REFERENCES RegistroAcesso(id_registro)
);
