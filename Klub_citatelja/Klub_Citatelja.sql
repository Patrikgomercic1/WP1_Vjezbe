use master;
drop database if exists klub_citatelja;
go
create database klub_citatelja;
go
use klub_citatelja;


create table citatelj(
	sifra int not null primary key identity(1,1),
	ime varchar(25),
	prezime varchar(25),
	kontakt varchar(25),
	vlasnik int
);

create table knjiga(
	sifra int not null primary key identity(1,1),
	vrsta varchar(25),
	naziv varchar(25),
	duzina int,
	citatelj int
);


alter table citatelj add foreign key (vlasnik) references citatelj(sifra);
alter table knjiga add foreign key (citatelj) references citatelj(sifra);


insert into citatelj(sifra,ime,prezime,kontakt,vlasnik)
values
	(1,'Marko','Bariæ','0952648221', null),
	(2,'Matija','Stojiæ','0915861432', null),
	(3,'Mirta','Bartoloviæ','0927514835', null);

insert into knjiga(sifra,vrsta,naziv,duzina,citatelj)
values
	(1,'Triler','Sjeverne vode','288', 2),
	(2,'Kriminalistièki','Poklapanje','344', 1),
	(3,'Znanstvena fantastika','Djeca vremena','584', 3);

update citatelj set ime='Matej' where sifra=2

--drop database if exists klub_citatelja;
