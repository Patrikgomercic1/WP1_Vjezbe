use master;
drop database if exists postolar;
go
create database postolar;
go
use postolar;


create table obuca(
	sifra int not null primary key identity(1,1),
	vrsta varchar(20),
	korisnik int,
	brojpopravaka int
);

create table korisnik(
	sifra int not null primary key identity(1,1),
	ime varchar(20) not null,
	prezime varchar(20) not null,
	kontakt int
);

create table popravak(
	sifra int not null primary key identity(1,1),
	datum datetime,
	cijena decimal(6,2),
	segrt int
);

create table segrt(
	sifra int not null primary key identity(1,1),
	ime varchar(20) not null,
	prezime varchar(20) not null,
	oib char(11),
	kontakt int
);

create table obuca_popravak(
	obuca int,
	popravak int
);


alter table obuca_popravak add foreign key (obuca) references obuca(sifra);
alter table obuca_popravak add foreign key (popravak) references popravak(sifra);
alter table popravak add foreign key (segrt) references segrt(sifra);
alter table obuca add foreign key (korisnik) references korisnik(sifra);


insert into korisnik(sifra,ime,prezime,kontakt)
values
	(1,'Mario','Mariæ','0958545265'),
	(2,'Ante','Džukiæ','0952354121'),
	(3,'Anita','Babiæ','0915473825');

insert into popravak(sifra,datum,cijena,segrt)
values
	(1,'2022-03-06','59.99',null),
	(2,'2023-05-24','19.99',null),
	(3,'2023-06-10','27.49',null);

update popravak set cijena='20.99' where sifra=2
--drop database if exists postolar;
