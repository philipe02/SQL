select nome, titulo from 
	Autor aut join AutorArtigo auar on aut.idAutor=auar.autor
	join Artigo art on art.idArtigo=auar.artigo
	join Avaliacao av on av.artigo=auar.artigo
where av.originalidade>=7
order by nome asc

select nome, idCliente from
	Edicao join Assinatura on edicaoInicial=numero
	join Cliente on cliente=idCliente
	join ClientePessoa on pessoa=cpf
where ano=2018

create view vwclientesBahia (email, endereco, bairro, cidade)
as select email, endereco, bairro, cidade from Cliente join Pagamento on cliente=idCliente
where idCliente in(select cliente from Pagamento) 
select * from vwclientesBahia

select volume, descricao, count(edicaoInicial) as assinaturas from 
	Edicao join Assinatura ass on numero=edicaoInicial
	join Tema on tema=idTema
group by volume, descricao
having count(edicaoInicial)=(select max(m.assinaturas) from (select count(edicaoInicial) as assinaturas from Assinatura join Edicao on numero=edicaoInicial group by volume) m)

create view vwclientesHotmail(razaoSocial, email)
as select razaoSocial, email from Cliente join ClienteEmpresa on empresa=cnpj
where email like '%hotmail%'

select idAvaliador, nome, email from Avaliador join AvaliadorTema on idAvaliador=avaliador
	join Tema on idTema=tema
group by idAvaliador, nome, email
having count(avaliador)=(select max(m.habilitado) from(select count(avaliador) as habilitado from AvaliadorTema join Avaliador on avaliador=idAvaliador group by nome) m)

select volume, descricao, count(edicaoInicial) as assinaturas from 
	Edicao join Assinatura ass on numero=edicaoInicial
	join Tema on tema=idTema
group by volume, descricao
having count(edicaoInicial)=(select min(m.assinaturas) from (select count(edicaoInicial) as assinaturas from Assinatura join Edicao on numero=edicaoInicial group by volume) m)

select titulo, count(autor) as autores from
	Autor join AutorArtigo on autor=idAutor
	join Artigo on artigo=idArtigo
group by titulo
having count(autor)>1

select titulo from
	Autor join AutorArtigo on autor=idAutor
	join Artigo on artigo=idArtigo
group by titulo
having count(idAutorArtigo)=1

select razaoSocial, email from 
	ClienteEmpresa join Cliente on cnpj=empresa
where idCliente not in(select cliente from Pagamento)
