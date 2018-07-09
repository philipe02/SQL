CREATE DATABASE EngeSoft;
USE EngeSoft;
CREATE TABLE Avaliador(
  idAvaliador INT NOT NULL,
  nome VARCHAR(40) NOT NULL,
  email VARCHAR(40) NOT NULL);

CREATE TABLE Tema (
  idTema INT NOT NULL,
  descricao VARCHAR(50) NOT NULL);

CREATE TABLE Edicao(
  numero INT NOT NULL,
  avaliadorChefe INT NOT NULL,
  tema INT NOT NULL,
  volume SMALLINT NOT NULL,
  mes TINYINT NOT NULL,
  ano SMALLINT NOT NULL);

CREATE TABLE Autor(
  idAutor INT NOT NULL,
  nome VARCHAR(40) NOT NULL,
  email VARCHAR(40) NOT NULL);

CREATE TABLE Artigo (
  idArtigo INT NOT NULL,
  edicao INT NOT NULL,
  autorContato INT NULL,
  titulo VARCHAR(50) NOT NULL,
  arquivo VARCHAR(100) NOT NULL,
  statusArtigo CHAR(1) NOT NULL);

CREATE TABLE Instituicao (
  idInstituicao INT NOT NULL,
  endereco VARCHAR(50) NOT NULL,
  bairro VARCHAR(20) NOT NULL,
  cidade VARCHAR(20) NOT NULL,
  estado CHAR(2) NOT NULL);

CREATE TABLE ClientePessoa (
  cpf CHAR(11) NOT NULL,
  nome VARCHAR(40) NOT NULL,
  sexo CHAR(1) NOT NULL,
  identidade CHAR(10) NOT NULL,
  dataNasc DATETIME NOT NULL);

CREATE TABLE ClienteEmpresa (
  cnpj CHAR(14) NOT NULL,
  responsavel CHAR(11) NOT NULL,
  razaoSocial VARCHAR(50) NOT NULL);

CREATE TABLE Cliente (
  idCliente INT NOT NULL,
  email VARCHAR(40) NOT NULL,
  endereco VARCHAR(50) NOT NULL,
  bairro VARCHAR(20) NOT NULL,
  cidade VARCHAR(20) NOT NULL,
  estado CHAR(2) NOT NULL,
  pessoa CHAR(11) NULL,
  empresa CHAR(14) NULL);

CREATE TABLE Avaliacao (
  idAvaliacao INT NOT NULL,
  avaliador INT NOT NULL,
  artigo INT NOT NULL,
  originalidade TINYINT NOT NULL,
  conteudo TINYINT NOT NULL,
  apresentacao TINYINT NOT NULL);

CREATE TABLE AvaliadorTema (
  idAvaliadorTema INT NOT NULL,
  tema INT NOT NULL,
  avaliador INT NOT NULL);

CREATE TABLE Selecao (
  idSelecao INT NOT NULL,
  artigo INT NOT NULL,
  edicao INT NOT NULL);

CREATE TABLE AutorArtigo (
  idAutorArtigo INT NOT NULL,
  autor INT NOT NULL,
  artigo INT NOT NULL);

CREATE TABLE AutorInstituicao (
  idAutorInstituicao INT NOT NULL,
  autor INT NOT NULL,
  instituicao INT NOT NULL);

CREATE TABLE Assinatura (
  idAssinatura INT NOT NULL,
  cliente INT NOT NULL,
  edicaoInicial INT NOT NULL,
  desconto TINYINT NOT NULL);

CREATE TABLE Pagamento (
  idPagamento INT NOT NULL,
  cliente INT NOT NULL,
  valor INT NOT NULL,
  admCartao VARCHAR(20) NOT NULL,
  numCartao VARCHAR(16) NOT NULL,
  valCartao DATETIME NOT NULL,
  codCartao CHAR(3) NOT NULL);

CREATE TABLE PagamentoAssinatura (
  idPagamentoAssinatura INT NOT NULL,
  pagamento INT NOT NULL,
  assinatura INT NOT NULL);




  