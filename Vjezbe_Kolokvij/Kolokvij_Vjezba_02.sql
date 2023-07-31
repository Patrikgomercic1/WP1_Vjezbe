﻿use master;
drop database if exists Kolokvij_vjezba_02;
go
create database Kolokvij_vjezba_02;
go
use Kolokvij_vjezba_02;



-- 0 --
create table svekar(
	sifra int not null primary key identity(1,1),
	stilfrizura varchar(48),
	ogrlica int not null,
	asocijalno bit not null
);

create table prijatelj(
	sifra int not null primary key identity(1,1),
	modelnaocala varchar(37),
	treciputa datetime not null,
	ekstrovertno bit not null,
	prviputa datetime,
	svekar int not null
);

create table decko(
	sifra int not null primary key identity(1,1),
	indiferentno bit,
	vesta varchar(34),
	asocijalno bit not null
);

create table zarucnica(
	sifra int not null primary key identity(1,1),
	narukvica int,
	bojakose varchar(37) not null,
	novcica decimal(15,9),
	lipa decimal(15,8) not null,
	indiferentno bit not null
);

create table decko_zarucnica(
	sifra int not null primary key identity(1,1),
	decko int not null,
	zarucnica int not null
);

create table cura(
	sifra int not null primary key identity(1,1),
	haljina varchar(33) not null,
	drugiputa datetime not null,
	suknja varchar(38),
	narukvica int,
	introvertno bit,
	majica varchar(40) not null,
	decko int
);

create table neprijatelj(
	sifra int not null primary key identity(1,1),
	majica varchar(32),
	haljina varchar(43) not null,
	lipa decimal(16,8),
	modelnaocala varchar(49) not null,
	kuna decimal(12,6) not null,
	jmbag char(11),
	cura int 
);

create table brat(
	sifra int not null primary key identity(1,1),
	suknja varchar,
	ogrlica int not null,
	asocijalno bit not null,
	neprijatelj int not null
);

alter table prijatelj add foreign key(svekar) references svekar(sifra);
alter table brat add foreign key(neprijatelj) references neprijatelj(sifra);
alter table neprijatelj add foreign key(cura) references cura(sifra);
alter table cura add foreign key(decko) references decko(sifra);
alter table decko_zarucnica add foreign key(decko) references decko(sifra);
alter table decko_zarucnica add foreign key(zarucnica) references zarucnica(sifra);

-- 1 --
insert into neprijatelj (haljina, modelnaocala, kuna)
values 
	('Plava', 'Ray-Ban', 500),
	('Zelena', 'Gucci', 700),
	('Zuta', 'Molero', 600);


insert into cura(haljina, drugiputa, majica)
values  
	('Plava', '2011-09-11', 'Plava majica'),
	('Zelena', '2012-09-11', 'Zelena majica'),
	('Zuta', '2013-09-11', 'Zuta majica');
               
insert into decko_zarucnica(decko, zarucnica)
values
(3,1),
(2,2),
(3,3);

insert into svekar(ogrlica, asocijalno)
values  
(3, 1),
(3, 1),
(3, 0);

-- 2 --
update prijatelj set treciputa = '2020-04-30';

-- 3 --
delete from brat where ogrlica != 14;

-- 4 --
select suknja from cura where drugiputa is null;

-- 5 --
select a.novcica , f.neprijatelj , e.haljina
from zarucnica a 
inner join decko_zarucnica b on a.sifra = b.zarucnica 
inner join decko c           on b.decko = c.sifra 
inner join cura d            on c.sifra = d.decko
inner join neprijatelj e     on d.sifra = e.cura
inner join brat f            on e.sifra = f.neprijatelj
where c.vesta like '%ba%' and d.drugiputa is not null 
order by e.haljina desc;

-- 6 --
select	a.vesta , a.asocijalno 
from	decko a left join decko_zarucnica b on a.sifra = b.decko 
where	b.decko is null; 

