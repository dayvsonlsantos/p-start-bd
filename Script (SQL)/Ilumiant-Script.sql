use ilumiant;

/*

Adicionar dados:

*/

-- Caso usuário seja apenas cliente

#Cadastro do usuário:

insert into ilumi_cadastro(n_idcad, c_cpfcad, c_nomecad, c_emailcad, c_senhacad, c_telefonecad)
values ("3", "95862818425", "Juninho da silva marques", "juninhosm@gmail.com", "junin123", "081985146329");

#Completando cadastro do usuário

insert into ilumi_user(n_iduser, n_idcad, c_enderecouser, d_nasciuser, c_estadouser, c_cidadeuser, c_imguser, c_prestserv)
values ("3", "3", "Rua Rauh Morais Numero 02", "1987-04-15", "PE", "Olinda", "https://www.facebook.com/FotosAleatoriasDeGenteAleatoria", "0");

-- Serviços:

#Cadastrando serviços:

insert into ilumi_servicos (n_idservi, c_nomeservi, c_descservi) 
values ("2", "Desenvolvedor Front-End", "Responsável por criar a interface de utilização de um site ou aplicação web.");


-- Caso usuário seja prestador de serviço


#Cadastro do prestador de serviço:

insert into ilumi_cadastro(n_idcad, c_cpfcad, c_nomecad, c_emailcad, c_senhacad, c_telefonecad) 
values ("4", "82549221395", "Vitor Junior Ferreira", "vitinhodobrega@gmail.com", "Vito51", "081984826581");

#Completando o cadastro do prestador de serviço:

insert into ilumi_user(n_iduser, n_idcad, c_enderecouser, d_nasciuser, c_estadouser, c_cidadeuser, c_imguser, c_prestserv)
values ("4", "4", "Rua do buriti, numero 41", "1999-11-12", "PE", "Paulista", "https://www.facebook.com/FotosAleatoriasDeGenteAleatoria", "1");

#Cadastrando serviço fornecido pelo prestador de serviços:
insert into ilumi_servforn (`n_idservforn`, `n_iduser`, `n_idservi`, `n_cnpjcad`, `c_descservi`, `c_formaservi`, `c_estadoservi`, `c_cidadeservi`, `c_imgservia`, `c_imgservib`, `c_imgservic`, `c_imgservid`) 
values ("2", "4", "2", "", "Desenvolvo em HTML5, CCS3, JavaScript e React", "A distancia", "PE", "Recife", "https://www.facebook.com/FotosAleatoriasDeGenteAleatoria", "https://www.facebook.com/FotosAleatoriasDeGenteAleatoria", "https://www.facebook.com/FotosAleatoriasDeGenteAleatoria", "https://www.facebook.com/FotosAleatoriasDeGenteAleatoria");


-- Avaliação


#Cadastrando avaliação:
insert into ilumi_avali (n_iduser, n_idservforn, n_pontavali, c_comentavali) 
values ("1", "2", "5", "Serviço ótimo!");




/*

Exibir dados:

*/



-- Exibindo usuários cadastrados:

SELECT 
    ilumi_cadastro.n_idcad,
    ilumi_cadastro.c_cpfcad,
    ilumi_cadastro.c_nomecad,
    ilumi_cadastro.c_emailcad,
    ilumi_cadastro.c_senhacad,
    ilumi_cadastro.c_telefonecad,
    ilumi_user.c_enderecouser,
    ilumi_user.d_nasciuser,
    ilumi_user.c_cidadeuser,
    ilumi_user.c_imguser,
    ilumi_user.c_prestserv
FROM
    ilumi_cadastro
        INNER JOIN
    ilumi_user ON ilumi_cadastro.n_idcad = ilumi_user.n_idcad;



-- Visualizar serviços cadastrados:
select * from ilumi_servicos;



-- Exibindo os dados Prestador de serviço;
SELECT 
    ilumi_cadastro.c_nomecad,
    ilumi_cadastro.c_emailcad,
    ilumi_cadastro.c_telefonecad,
    ilumi_user.c_cidadeuser,
    ilumi_user.c_estadouser,
    ilumi_user.c_imguser,
    ilumi_servicos.c_nomeservi,
    ilumi_servforn.n_cnpjcad,
    ilumi_servforn.c_descservi,
    ilumi_servforn.c_formaservi,
    ilumi_servforn.c_imgservia,
    ilumi_servforn.c_imgservib,
    ilumi_servforn.c_imgservic,
    ilumi_servforn.c_imgservid
FROM
    ilumi_cadastro
        INNER JOIN
    ilumi_user ON ilumi_cadastro.n_idcad = ilumi_user.n_idcad
        INNER JOIN
    ilumi_servforn ON ilumi_servforn.n_iduser = ilumi_user.n_iduser
        INNER JOIN
    ilumi_servicos ON ilumi_servicos.n_idservi = ilumi_servforn.n_idservi;


-- Avaliações do prestador de serviço:

select * from ilumi_avali;

SELECT 
    ilumi_cadastro.c_nomecad,
    ilumi_servicos.c_nomeservi,
    ilumi_avali.n_pontavali,
    ilumi_avali.c_comentavali,
    ilumi_avali.n_iduser
FROM
    ilumi_cadastro
        INNER JOIN
    ilumi_user ON ilumi_cadastro.n_idcad = ilumi_user.n_idcad
        INNER JOIN
    ilumi_servforn ON ilumi_user.n_iduser = ilumi_servforn.n_iduser
        INNER JOIN
    ilumi_servicos ON ilumi_servicos.n_idservi = ilumi_servforn.n_idservi
        INNER JOIN
    ilumi_avali ON ilumi_avali.n_idservforn = ilumi_servforn.n_idservforn;





/*

Como foi feito:

*/




#Cadastro do usuário:

insert into ilumi_cadastro(n_idcad, c_cpfcad, c_nomecad, c_emailcad, c_senhacad, c_telefonecad)
values ("1", "42196423297", "Antônio Lacerda de Nobrega", "toninholacerda@gmail.com", "tonho3297", "081994423232");

#Completando cadastro do usuário

insert into ilumi_user(n_iduser, n_idcad, c_enderecouser, d_nasciuser, c_estadouser, c_cidadeuser, c_imguser, c_prestserv)
values ("1", "1", "Rua das Palmeiras Numero 333", "2001-09-21", "PE", "Abreu e Lima", "https://www.facebook.com/FotosAleatoriasDeGenteAleatoria", "0");

-- Exibindo usuários cadastrados:

SELECT 
    ilumi_cadastro.n_idcad,
    ilumi_cadastro.c_cpfcad,
    ilumi_cadastro.c_nomecad,
    ilumi_cadastro.c_emailcad,
    ilumi_cadastro.c_senhacad,
    ilumi_cadastro.c_telefonecad,
    ilumi_user.c_enderecouser,
    ilumi_user.d_nasciuser,
    ilumi_user.c_cidadeuser,
    ilumi_user.c_imguser,
    ilumi_user.c_prestserv
FROM
    ilumi_cadastro
        INNER JOIN
    ilumi_user ON ilumi_cadastro.n_idcad = ilumi_user.n_idcad;

#Cadastro do prestador de serviço:

insert into ilumi_cadastro(n_idcad, c_cpfcad, c_nomecad, c_emailcad, c_senhacad, c_telefonecad) 
values ("2", "43851498957", "Marcos Aurelio Santana de Souza", "marcos.santana@gmail.com", "mar22946738", "081984325202");

#Completando o cadastro do prestador de serviço:

insert into ilumi_user(n_iduser, n_idcad, c_enderecouser, d_nasciuser, c_estadouser, c_cidadeuser, c_imguser, c_prestserv)
values ("2", "2", "Rua rose e silva, numero 53", "1995-10-05", "PE", "Recife", "https://www.facebook.com/FotosAleatoriasDeGenteAleatoria", "1");

#Cadastrando serviços:

insert into ilumi_servicos (n_idservi, c_nomeservi, c_descservi) 
values ("1", "Designer de Interiores", "Planeja e projeta os mais diferentes espaços internos residenciais, comerciais e institucionais.");


-- Visualizar serviços:
select * from ilumi_servicos;

#Cadastrando serviço fornecido pelo prestador de serviços:
insert into ilumi_servforn (`n_idservforn`, `n_iduser`, `n_idservi`, `n_cnpjcad`, `c_descservi`, `c_formaservi`, `c_estadoservi`, `c_cidadeservi`, `c_imgservia`, `c_imgservib`, `c_imgservic`, `c_imgservid`) 
values ("1", "2", "1", "", "Planejo o espaço interno de sua residência ou estabelecimento, com o intuito de prover um ambiente mais agradável para todos.", "Presencial", "PE", "Recife", "https://www.facebook.com/FotosAleatoriasDeGenteAleatoria", "https://www.facebook.com/FotosAleatoriasDeGenteAleatoria", "https://www.facebook.com/FotosAleatoriasDeGenteAleatoria", "https://www.facebook.com/FotosAleatoriasDeGenteAleatoria");

-- Exibindo os dados Prestador de serviço;
SELECT 
    ilumi_cadastro.c_nomecad,
    ilumi_cadastro.c_emailcad,
    ilumi_cadastro.c_telefonecad,
    ilumi_user.c_cidadeuser,
    ilumi_user.c_estadouser,
    ilumi_user.c_imguser,
    ilumi_servicos.c_nomeservi,
    ilumi_servforn.n_cnpjcad,
    ilumi_servforn.c_descservi,
    ilumi_servforn.c_formaservi,
    ilumi_servforn.c_imgservia,
    ilumi_servforn.c_imgservib,
    ilumi_servforn.c_imgservic,
    ilumi_servforn.c_imgservid
FROM
    ilumi_cadastro
        INNER JOIN
    ilumi_user ON ilumi_cadastro.n_idcad = ilumi_user.n_idcad
        INNER JOIN
    ilumi_servforn ON ilumi_servforn.n_iduser = ilumi_user.n_iduser
        INNER JOIN
    ilumi_servicos ON ilumi_servicos.n_idservi = ilumi_servforn.n_idservi;
    

#Cadastrando avaliação:
insert into ilumi_avali (n_iduser, n_idservforn, n_pontavali, c_comentavali) 
values ("1", "1", "4", "Serviço muito bom!");

-- Avaliações do prestador de serviço:

select * from ilumi_avali;

SELECT 
    ilumi_cadastro.c_nomecad,
    ilumi_servicos.c_nomeservi,
    ilumi_avali.n_pontavali,
    ilumi_avali.c_comentavali,
    ilumi_avali.n_iduser
FROM
    ilumi_cadastro
        INNER JOIN
    ilumi_user ON ilumi_cadastro.n_idcad = ilumi_user.n_idcad
        INNER JOIN
    ilumi_servforn ON ilumi_user.n_iduser = ilumi_servforn.n_iduser
        INNER JOIN
    ilumi_servicos ON ilumi_servicos.n_idservi = ilumi_servforn.n_idservi
        INNER JOIN
    ilumi_avali ON ilumi_avali.n_idservforn = ilumi_servforn.n_idservforn;

    