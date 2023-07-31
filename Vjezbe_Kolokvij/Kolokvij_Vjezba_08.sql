﻿use master;
drop database if exists Kolokvij_vjezba_8;
go
create database Kolokvij_vjezba_8;
go
use Kolokvij_vjezba_8;



-- 0 --
create table prijateljica(
	sifra int not null primary key identity(1,1),
	vesta varchar(50),
	nausnica int not null,
	introvertno bit not null
);

create table cura(
	sifra int not null primary key identity(1,1),
	nausnica int not null,
	indiferentno bit,
	ogrlica int not null,
	gustoca decimal(12,6),
	drugiputa datetime,
	vesta varchar(33),
	prijateljica int
);

create table decko(
	sifra int not null primary key identity(1,1),
	kuna decimal(12,10),
	lipa decimal(17,10),
	bojakose varchar(44),
	treciputa datetime not null,
	ogrlica int not null,
	ekstrovertno bit not null
);

create table muskarac(
	sifra int not null primary key identity(1,1),
	haljina varchar(47),
	drugiputa datetime not null,
	treciputa datetime
);

create table muskarac_decko(
	sifra int not null primary key identity(1,1),
	muskarac int not null,
	decko int not null
);

create table becar(
	sifra int not null primary key identity(1,1),
	eura decimal(15,10) not null,
	treciputa datetime,
	prviputa datetime,
	muskarac int not null
);

create table neprijatelj(
	sifra int not null primary key identity(1,1),
	kratkamajica varchar(44),
	introvertno bit,
	indiferentno bit,
	ogrlica int not null,
	becar int not null
);

create table brat(
	sifra int not null primary key identity(1,1),
	introvertno bit,
	novcica decimal(14,7) not null,
	treciputa datetime,
	neprijatelj int
);

alter table cura add foreign key(prijateljica) references prijateljica(sifra);
alter table brat add foreign key(neprijatelj) references neprijatelj(sifra);
alter table neprijatelj add foreign key(becar) references becar(sifra);
alter table becar add foreign key(muskarac) references muskarac(sifra);
alter table muskarac_decko add foreign key(muskarac) references muskarac(sifra);
alter table muskarac_decko add foreign key(decko) references decko(sifra);

-- 1 --
insert into neprijatelj(ogrlica, becar)
values  
	(3, 1),
	(2, 2),
	(1, 3);

insert into becar(eura, muskarac)
values 
	(22.22, 1),
	(33.33, 2),
	(44.44, 3);
               
insert into muskarac_decko(muskarac, decko)
values  
	(1, 3),
	(2, 2),
	(3, 1);

-- 2 --
update cura set indiferentno=0;

-- 3 --
delete from brat where novcica!='12.75';

-- 4 --
select prviputa from becar where treciputa is null;

-- 5 --
select a.bojakose , f.neprijatelj , e.introvertno 
from decko a
inner join muskarac_decko  b on a.sifra      = b.decko
inner join muskarac        c on b.muskarac   = c.sifra
inner join becar           d on c.sifra      = d.muskarac 
inner join neprijatelj     e on d.sifra      = e.becar
inner join brat            f on e.sifra      = f.neprijatelj 
where d.treciputa is not null and c.drugiputa is not null
order by e.introvertno desc;

-- 6 --
select	a.drugiputa , a.treciputa 
from	muskarac a left join muskarac_decko b on b.muskarac = a.sifra 
where	b.muskarac is null;