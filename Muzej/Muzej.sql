use master;
drop database if exists muzej;
go
create database muzej;
go
use muzej;


create table izlozba(
	sifra int not null primary key identity(1,1),
	naziv varchar(20),
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
	naziv varchar(30),
);


alter table kustos add foreign key (izlozba) references izlozba(sifra);
alter table djelo add foreign key (izlozba) references izlozba(sifra);
alter table izlozba add foreign key (sponzor) references sponzor(sifra);