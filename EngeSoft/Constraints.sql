alter table Avaliador
add constraint CP_avaliador primary key (idAvaliador)

alter table Tema
add constraint CP_tema primary key (idTema)

alter table Edicao
add constraint CP_edicao primary key(numero),
    constraint CE_temaEdicao foreign key(tema) references Tema(idTema),
	constraint CE_avaliadorEdicao foreign key(avaliadorChefe) references Avaliador(idAvaliador),
	constraint mesPadraoEdicao default month(getDate()) for mes,
	constraint anoPadraoEdicao default year(getDate()) for ano;

alter table Autor
add constraint CP_autor primary key (idAutor)

alter table Artigo
add constraint CP_artigo primary key(idArtigo),
    constraint CE_autorcontatoArtigo foreign key(autorContato) references Autor(idAutor),
	constraint CE_edicaoArtigo foreign key(edicao) references Edicao(numero);

alter table Instituicao
add constraint CP_instituicao primary key(idInstituicao)

alter table ClientePessoa
add constraint CP_clientePessoa primary key(cpf)

alter table ClienteEmpresa
add constraint CP_clienteEmpresa primary key(cnpj)

alter table Cliente
add constraint CP_cliente primary key(idCliente),
    constraint CE_clientePessoa foreign key(pessoa) references ClientePessoa(cpf),
	constraint CE_clienteEmpresa foreign key(empresa) references ClienteEmpresa(cnpj);

alter table Avaliacao
add constraint CP_Avaliacao primary key(idAvaliacao),
	constraint CE_avaliadorAvaliacao foreign key(avaliador) references Avaliador(idAvaliador),
	constraint CE_artigoAvaliacao foreign key(artigo) references Artigo(idArtigo);

alter table AvaliadorTema
add constraint CP_avaliadorTema primary key(idAvaliadorTema),
	constraint CE_temaAvaliador foreign key(tema) references Tema(idTema),
	constraint CE_avaliadorTema foreign key(avaliador) references Avaliador(idAvaliador);

alter table Selecao
add constraint CP_selecao primary key(idSelecao),
	constraint CE_edicaoSelecao foreign key(edicao) references Edicao(numero),
	constraint CE_artigoSelecao foreign key(artigo) references Artigo(idArtigo);

alter table AutorArtigo
add constraint CP_autorArtigo primary key(idAutorArtigo),
	constraint CE_autorArtigo foreign key(autor) references Autor(idAutor),
	constraint CE_artigoAutor foreign key(artigo) references Artigo(idArtigo);

alter table AutorInstituicao
add constraint CP_autorInstituicao primary key(idAutorInstituicao),
	constraint CE_autorInstituicao foreign key(autor) references Autor(idAutor),
	constraint CE_instituicaoAutor foreign key(instituicao) references Instituicao(idInstituicao);

alter table Assinatura
add constraint CP_assinatura primary key(idAssinatura),
	constraint CE_edicaoAssinatura foreign key(edicaoInicial) references Edicao(numero),
	constraint CE_clienteAssinatura foreign key(cliente) references Cliente(idCliente);

alter table Pagamento
add constraint CP_pagamento primary key(idPagamento),
	constraint CE_clientePagamento foreign key(cliente) references Cliente(idCliente);
	
alter table PagamentoAssinatura
add constraint CP_pagamentoAssinatura primary key(idPagamentoAssinatura),
	constraint CE_pagamentoAssinatura foreign key(pagamento) references Pagamento(idPagamento),
	constraint CE_assinaturaPagamento foreign key(assinatura) references Assinatura(idAssinatura);