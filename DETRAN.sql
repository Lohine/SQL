create database detran;
use detran;

create table TBmarca(
cod int primary key,
descrição varchar(100)
);

INSERT INTO TBmarca VALUES (01, "Chevrolet");
INSERT INTO TBmarca VALUES (02, "Ford");
INSERT INTO TBmarca VALUES (03, "VolksWagen");
INSERT INTO TBmarca VALUES (04, "Ferrari");
INSERT INTO TBmarca VALUES (05, "Lamborghini");
INSERT INTO TBmarca VALUES (06, "Aston Martin");
INSERT INTO TBmarca VALUES (07, "Audi");
INSERT INTO TBmarca VALUES (08, "Fiat");
INSERT INTO TBmarca VALUES (09, "Honda");

create table TBmodelo(
cod int primary key,
descrição varchar(100),
marca int,
foreign key (marca) references TBmarca(cod)
);

INSERT INTO TBmodelo VALUES (01, "Palio", 08);
INSERT INTO TBmodelo VALUES (02, "Uno", 08);
INSERT INTO TBmodelo VALUES (03, "Chevrolet", 01);
INSERT INTO TBmodelo VALUES (04, "FIT", 09);
INSERT INTO TBmodelo VALUES (05, "Ferrari 812 GTS", 04);
INSERT INTO TBmodelo VALUES (06, "Argo", 08);
INSERT INTO TBmodelo VALUES (07, "Ford Ka", 02);

create table TBcor(
cod int primary key,
descrição varchar(100)
);

INSERT INTO TBcor VALUES (01, "Preto");
INSERT INTO TBcor VALUES (02, "Cinza");
INSERT INTO TBcor VALUES (03, "Branco");
INSERT INTO TBcor VALUES (04, "Vermelho");
INSERT INTO TBcor VALUES (05, "Azul");
INSERT INTO TBcor VALUES (06, "Verde");
INSERT INTO TBcor VALUES (07, "Rosa");
INSERT INTO TBcor VALUES (08, "Amarelo");

create table TBcarro(
placa char (7) primary key,
proprietario varchar (100),
modelo int,
ano int,
cor int,
foreign key (modelo) references TBmodelo(cod),
foreign key (cor) references TBcor(cod)
);

INSERT INTO TBcarro VALUES ("AAA1A11", "Gabriel", 04, 2021, 01);
INSERT INTO TBcarro VALUES ("BBB1B11", "Thales", 05, 2022, 04);
INSERT INTO TBcarro VALUES ("CCC1C11", "Tiago", 01, 2008, 02);
INSERT INTO TBcarro VALUES ("DDD1D11", "Lohine", 02, 2011, 07);
INSERT INTO TBcarro VALUES ("EEE1E11", "Brunno", 06, 2021, 02);
INSERT INTO TBcarro VALUES ("FFF1F11", "Bruno", 04, 2020, 03);
INSERT INTO TBcarro VALUES ("GGG1G11", "Sidnei", 04, 2019, 01);
INSERT INTO TBcarro VALUES ("HHH1H11", "Antonio", 02, 2019, 04);
INSERT INTO TBcarro VALUES ("III1I11", "Anderson", 03, 2019, 04);
INSERT INTO TBcarro VALUES ("JJJ1J11", "Jaime", 01, 2019, 04);
/*4 carros vermelhos, 2 cinzas, 2 pretos e um rosa*/
/*8 carros que não são pretados*/
/*5 carros que não são Fiat*/

/* popular as tabelas de tal forma que permita construir a prova de 
conceito para as tres informações propostas*/
/**- numero de linhas
Atributo- numero de ocorrencia de valores validos 

Não pode popular o carro primeiro por causa da dependencia 

AlterTable- cuidado 

Criar a tabela e popula 
Ou popula depois

modelo e cor é relacionamento (cardianilidade)
placa, proprietário e ano é atributo */


/* INFORMACAO 1 - quantos carros do ano 2021 existem entre os carros 
cadastrados? Construir a instrução SELECT que extraia esta informação. */
SELECT count(*) AS "QTD. CARROS DE 2021"
FROM TBcarro 
WHERE ano = 2021;

/* INFORMACAO 2 - quais são as 2 cores mais frequentes entre os carros 
cadastrados? Construir a instrução SELECT que extraia esta informação. */
SELECT TBcarro.cor AS "Código da Cor", TBCor.descrição AS "Descrição"
FROM TBcarro, TBCor
WHERE TBcarro.cor = TBcor.cod
GROUP BY TBcarro.cor 
ORDER BY count(TBcarro.cor) desc
LIMIT 2;																				
                                                                  
                                                                   
/* INFORMACAO 3 - quantos carros do ano 2021 do modelo FIT existem entre 
os carros cadastrados? Construir a instrução SELECT que extraia esta 
informação.*/
SELECT count(*) AS "QTND carro e Modelo- FIT e 2021"
FROM TBcarro, TBmodelo
WHERE TBcarro.modelo = TBmodelo.cod and (TBmodelo.descrição = "FIT") and (TBcarro.ano = "2021");

/*INFORMACAO 4 - Quantidade de carros que não são da cor preta*/
SELECT count(*) AS "QTD. DE CARROS QUE NÃO SÃO PRETOS"
FROM TBcarro
WHERE Cor NOT IN (
	SELECT TBcor.cod
    FROM TBcor
    WHERE TBcor.descrição = "Preto"
);
/*Or*/
SELECT count(*) AS "QTD. DE CARROS QUE NÃO SÃO PRETOS"
FROM TBcarro, TBcor
WHERE TBcarro.Cor = TBcor.Cod And TBcor.Cod <> 1;

/*INFORMAÇÃO 5 - Quantos carros não são da FIAT*/
SELECT count(TBcarro.Placa) AS "QTD. DE CARROS QUE NÃO SÃO FIAT"
FROM  TBcarro, TBmodelo
WHERE TBcarro.modelo = TBmodelo.cod And TBcarro.modelo Not In(
	SELECT TBmodelo.cod    
    FROM TBmodelo, TBmarca
    WHERE TBmodelo.marca = TBmarca.cod And TBmarca.descrição = "Fiat"
);
/*Quantos carros não sao de 2021*/
SELECT count(*) AS "QTD carros que nao sao de 2021"
FROM TBcarro
WHERE ano NOT IN (
	SELECT ano
    FROM TBcarro
    WHERE TBcarro.ano = 2021
);
/*Or*/
SELECT count(*) AS "QTD carros que nao sao de 2021"
FROM TBcarro
WHERE ano <> 2021;

/*Quantidade de Proprietários de carro que a letra inicial do nome é Gr*/

SELECT count(*) AS "QTD de proprietários que começam com a letra inical G"
FROM TBcarro
WHERE Proprietario LIKE '%__al__%';

