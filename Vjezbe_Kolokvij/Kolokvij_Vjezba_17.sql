﻿use master;
drop database if exists Kolokvij_vjezba_17;
go
create database Kolokvij_vjezba_17;
go
use Kolokvij_vjezba_17;



-- 0 --
create table prijatelj(
	sifra int not null primary key identity(1,1),
	maraka decimal(13,6),
	narukvica int,
	nausnica int,
	lipa decimal(15,10),
	carape varchar(33) not null,
	stilfrizura varchar(35)
);

create table punica(
	sifra int not null primary key identity(1,1),
	indiferentno bit,
	narukvica int,
	gustoca decimal(18,10) not null,
	prijatelj int
);

create table becar(
	sifra int not null primary key identity(1,1),
	narukvica int,
	asocijalno bit not null,
	vesta varchar(48),
	kuna decimal(13,10),
	kratkamajica varchar(30) not null
);

create table brat(
	sifra int not null primary key identity(1,1),
	asocijalno bit not null,
	dukserica varchar(35),
	novcica decimal(15,6) not null,
	introvertno bit not null
);

create table brat_becar(
	sifra int not null primary key identity(1,1),
	brat int not null,
	becar int not null
);

create table ostavljen(
	sifra int not null primary key identity(1,1),
	bojaociju varchar(45),
	bojakose varchar(33),
	novcica decimal(16,7) not null,
	brat int not null
);

create table cura(
	sifra int not null primary key identity(1,1),
	ogrlica int,
	kuna decimal(16,8),
	indiferentno bit,
	jmbag char(11),
	maraka decimal(12,7) not null,
	ostavljen int not null
);

create table prijateljica(
	sifra int not null primary key identity(1,1),
	lipa decimal(12,9),
	haljina varchar(37),
	maraka decimal(13,8) not null,
	modelnaocala varchar(41) not null,
	cura int
);

alter table punica add foreign key(prijatelj) references prijatelj(sifra);
alter table prijateljica add foreign key(cura) references cura(sifra);
alter table cura add foreign key(ostavljen) references ostavljen(sifra);
alter table ostavljen add foreign key(brat) references brat(sifra);
alter table brat_becar add foreign key(brat) references brat(sifra);
alter table brat_becar add foreign key(becar) references becar(sifra);

-- 1 --
insert into cura(maraka, ostavljen, kuna)
values  
	(11.22, 1, 44.55),
	(22.33, 2, 55.66),
	(33.44, 3, 66.77);
	 
insert into ostavljen(novcica, brat)
values  
	(77.88, 2),
	(88.99, 3),
	(99.99, 1);

insert into brat_becar(brat, becar)
values  
	(2, 3),
	(3, 2),
	(1, 1);

-- 2 --
update punica set narukvica = 11;

-- 3 --
delete from prijateljica where haljina != 'AB';

-- 4 --
select novcica from ostavljen where bojakose like '%ana%';

-- 5 --
select a.vesta , f.modelnaocala , e.kuna 
from becar a
inner join brat_becar         b on a.sifra      = b.brat 
inner join brat               c on b.brat       = c.sifra
inner join ostavljen          d on c.sifra      = d.brat 
inner join cura               e on d.sifra      = e.ostavljen
inner join prijateljica       f on e.sifra      = f.cura
where d.bojakose like 'a&' and c.dukserica like '%ba%'
order by e.kuna desc;

-- 6 --
select	a.dukserica , a.novcica 
from	brat a left join brat_becar b on b.brat = a.sifra
where	b.brat is null; 