use master;
drop database if exists osnovna_skola;
go
create database osnovna_skola;
go
use osnovna_skola;


create table radionica(
	sifra int not null primary key identity(1,1),
	naziv varchar(15),
	uciteljica int
);

create table dijete(
	sifra int not null primary key identity(1,1),
	ime varchar(20),
	prezime varchar(20),
	oib char(11)
);

create table uciteljica(
	sifra int not null primary key identity(1,1),
	ime varchar(20),
	prezime varchar(20),
	oib char(11)
);

create table radionica_dijete(
	radionica int,
	dijete int
);


alter table radionica_dijete add foreign key (radionica) references radionica(sifra);
alter table radionica_dijete add foreign key (dijete) references dijete(sifra);
alter table radionica add foreign key (uciteljica) references uciteljica(sifra);


insert into uciteljica(sifra,ime,prezime,oib)
values
	(1,'Maja','Majiæ','31258552697'),
	(2,'Ana','Aniæ','54933258703'),
	(3,'Dajana','Goriæ','6017982245');

insert into radionica(sifra,naziv,uciteljica)
values
	(1,'Think&Solve','1'),
	(2,'Samokontrola','2'),
	(3,'LEGO Edukacija','3');

update radionica set uciteljica='1' where sifra=3
update radionica set uciteljica='3' where sifra=1

--drop database if exists osnovna_skola;
