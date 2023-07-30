use master;
drop database if exists taksi_sluzba;
go
create database taksi_sluzba;
go
use taksi_sluzba;


create table vozilo(
	sifra int not null primary key identity(1,1),
	oznaka varchar(20),
	marka varchar(30)
);

create table vozac(
	sifra int not null primary key identity(1,1),
	ime varchar(20) not null,
	prezime varchar(20) not null,
	oib char(11),
	kontakt int,
	vozilo int
);

create table putnik(
	sifra int not null primary key identity(1,1),
	lokacija varchar(50),
	kontakt varchar(20),
);

create table voznja(
	sifra int not null primary key identity(1,1),
	dužina int,
	cijena decimal(8,2),
	vozac int
);

create table voznja_putnik(
	voznja int,
	putnik int
);


alter table vozac add foreign key (vozilo) references vozilo(sifra);
alter table voznja_putnik add foreign key (voznja) references voznja(sifra);
alter table voznja_putnik add foreign key (putnik) references putnik(sifra);
alter table voznja add foreign key (vozac) references vozac(sifra);


insert into vozilo(sifra,oznaka,marka)
values
	(1,'ZG 8208-AS','Dacia Sandero'),
	(2,'OS 123-AB','Dacia Duster'),
	(3,'SB 360-OS','Volkswagen Passat');

insert into vozac(sifra,ime,prezime,kontakt,vozilo)
values
	(1,'Mario','Majiæ','0953172464','2'),
	(2,'Ana','Tajiæ','0925421828','1'),
	(3,'Josip','Markoviæ','0953584139','3');

update vozac set kontakt='0953174741' where sifra=1

--drop database if exists taksi_sluzba;
