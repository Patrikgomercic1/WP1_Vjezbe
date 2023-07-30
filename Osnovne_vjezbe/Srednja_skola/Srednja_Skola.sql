use master;
drop database if exists srednja_skola;
go
create database srednja_skola;
go
use srednja_skola;


create table razred(
	sifra int not null primary key identity(1,1),
	naziv varchar(15),
	ucenik int
);

create table ucenik(
	sifra int not null primary key identity(1,1),
	ime varchar(20),
	prezime varchar(20),
	oib char(11)
);

create table profesor(
	sifra int not null primary key identity(1,1),
	ime varchar(20),
	prezime varchar(20),
	oib char(11),
	predmet varchar(20)
);

create table razred_profesor(
	razred int,
	profesor int
);


alter table razred add foreign key (ucenik) references ucenik(sifra);
alter table razred_profesor add foreign key (razred) references razred(sifra);
alter table razred_profesor add foreign key (profesor) references profesor(sifra);


insert into ucenik(sifra,ime,prezime,oib)
values
	(1,'Ante','Aniæ','02156966341'),
	(2,'Branimimir','Bradariæ','01017855294'),
	(3,'Matej','Stojiæ','96363658510');

insert into razred(sifra,naziv,ucenik)
values
	(1,'A','2'),
	(2,'B','3'),
	(3,'G','1');

update razred set naziv='D' where sifra=3

--drop database if exists srednja_skola;
