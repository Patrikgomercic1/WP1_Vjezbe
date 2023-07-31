﻿use master;
drop database if exists Kolokvij_vjezba_13;
go
create database Kolokvij_vjezba_13;
go
use Kolokvij_vjezba_13;



-- 0 --
create table muskarac(
	sifra int not null primary key identity(1,1),
	dukserica varchar(34),
	gustoca decimal(13,10),
	haljina varchar(42) not null,
	majica varchar(39),
	suknja varchar(50) not null,
	kuna decimal(17,9) not null
);

create table neprijatelj(
	sifra int not null primary key identity(1,1),
	bojakose varchar(32),
	novcica decimal(12,6) not null,
	prviputa datetime,
	indiferentno bit not null,
	suknja varchar(44),
	jmbag char(11),
	muskarac int not null
);

create table svekar(
	sifra int not null primary key identity(1,1),
	suknja varchar(40),
	stilfrizura varchar(34) not null,
	gustoca decimal(15,10) not null,
	carape varchar(35) not null
);

create table svekrva(
	sifra int not null primary key identity(1,1),
	hlace varchar(35),
	ogrlica int,
	ekstrovertno bit not null,
	narukvica int 
);

create table svekrva_svekar(
	sifra int not null primary key identity(1,1),
	svekrva int not null,
	svekar int not null
);

create table ostavljen(
	sifra int not null primary key identity(1,1),
	kratkamajica varchar(34),
	drugiputa datetime,
	asocijalno bit not null,
	stilfrizura varchar(40),
	svekrva int not null
);

create table mladic(
	sifra int not null primary key identity(1,1),
	drugiputa datetime not null,
	carape varchar(48) not null,
	ogrlica int,
	kratkamajica varchar(42) not null,
	introvertno bit not null,
	asocijalno bit not null,
	ostavljen int 
);

create table cura(
	sifra int not null primary key identity(1,1),
	ogrlica int,
	hlace varchar(42),
	vesta varchar(31) not null,
	majica varchar(50),
	mladic int
);

alter table neprijatelj add foreign key(muskarac) references muskarac(sifra);
alter table cura add foreign key(mladic) references mladic(sifra);
alter table mladic add foreign key(ostavljen) references ostavljen(sifra);
alter table ostavljen add foreign key(svekrva) references svekrva(sifra);
alter table svekrva_svekar add foreign key(svekrva) references svekrva(sifra);
alter table svekrva_svekar add foreign key(svekar) references svekar(sifra);

-- 1 --
insert into mladic(drugiputa, carape, kratkamajica, introvertno, asocijalno, ostavljen)  
values  
	('2014-01-12', 5, 4, 0, 1, 2),
	('2015-01-13', 5, 4, 1, 0, 1),
	('2016-01-14', 5, 4, 0, 1, 3);
       
insert into ostavljen(asocijalno, svekrva)
values  
	(1, 1),
	(1, 2),
	(1, 3);
        
insert into svekrva_svekar(svekrva, svekar)
values  
	(3, 3),
	(1, 1),
	(2, 2);

-- 2 --
update neprijatelj set novcica = 13.77;  

-- 3 --
delete from cura where hlace like '%AB%';

-- 4 --
select asocijalno from ostavljen where drugiputa is null;

-- 5 --
select a.gustoca , f.majica , e.carape 
from svekar a
inner join svekrva_svekar b on a.sifra = b.svekar 
inner join svekrva c on b.svekrva = c.sifra 
inner join ostavljen d on c.sifra=d.svekrva 
inner join mladic e on d.sifra=e.ostavljen
inner join cura f on e.sifra= f.mladic
where d.drugiputa is not null and c.ogrlica =193
order by e.carape desc;

-- 6 --
select	a.ogrlica , a.ekstrovertno 
from	svekrva a left join svekrva_svekar b on a.sifra=b.svekrva
where	b.svekrva is null;