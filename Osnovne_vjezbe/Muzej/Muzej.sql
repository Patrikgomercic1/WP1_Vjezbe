use master;
drop database if exists muzej;
go
create database muzej;
go
use muzej;


create table izlozba(
	sifra int not null primary key identity(1,1),
	naziv varchar(50),
	sponzor int,
	datum datetime
);

create table djelo(
	sifra int not null primary key identity(1,1),
	naziv varchar(20) not null,
	datumnastanka datetime,
	izlozba int
);

create table kustos(
	sifra int not null primary key identity(1,1),
	ime varchar(20),
	prezime varchar(20),
	oib char(11),
	izlozba int
);

create table sponzor(
	sifra int not null primary key identity(1,1),
	naziv varchar(50)
);


alter table kustos add foreign key (izlozba) references izlozba(sifra);
alter table djelo add foreign key (izlozba) references izlozba(sifra);
alter table izlozba add foreign key (sponzor) references sponzor(sifra);


insert into sponzor(sifra,naziv)
values
	(1,'Hrvatsko društvo likovnih umjetnika'),
	(2,'Udruga Art Rencontre'),
	(3,'Kulturno športska braniteljska udruga');

insert into izlozba(sifra,naziv,sponzor,datum)
values
	(1,'Izložba Slavka Kopaèa','1','2021-12-16'),
	(2,'Zajedno u ratu, ujedinjeni u miru!','3','2022-03-25');

update izlozba set datum='2022-03-26' where sifra=2

--drop database if exists muzej;
