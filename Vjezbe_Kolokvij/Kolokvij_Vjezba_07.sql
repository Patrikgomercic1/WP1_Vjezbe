use master;
drop database if exists Kolokvij_vjezba_7;
go
create database Kolokvij_vjezba_7;
go
use Kolokvij_vjezba_7;



-- 0 --
create table cura(
	sifra int not null primary key identity(1,1),
	lipa decimal(12,9) not null,
	introvertno bit,
	modelnaocala varchar(40),
	narukvica int,
	treciputa datetime,
	kuna decimal(14,9)
);

create table punica(
	sifra int not null primary key identity(1,1),
	majica varchar(40),
	eura decimal(12,6) not null,
	prstena int,
	cura int not null
);

create table mladic(
	sifra int not null primary key identity(1,1),
	prstena int,
	lipa decimal(14,5) not null,
	narukvica int not null,
	drugiputa datetime not null
);

create table zarucnik(
	sifra int not null primary key identity(1,1),
	vesta varchar(34),
	asocijalno bit not null,
	modelnaocala varchar(43),
	narukvica int not null,
	novcica decimal(15,5) not null
);

create table zarucnik_mladic(
	sifra int not null primary key identity(1,1),
	zarucnik int not null,
	mladic int not null
);

create table ostavljen(
	sifra int not null primary key identity(1,1),
	lipa decimal(14,6),
	introvertno bit not null,
	kratkamajica varchar(38) not null,
	prstena int not null,
	zarucnik int
);

create table prijateljica(
	sifra int not null primary key identity(1,1),
	haljina varchar(45),
	gustoca decimal(15,10) not null,
	ogrlica int,
	novcica decimal(12,5),
	ostavljen int
);

create table sestra(
	sifra int not null primary key identity(1,1),
	bojakose varchar(34) not null,
	hlace varchar(36) not null,
	lipa decimal(15,6),
	stilfrizura varchar(40) not null,
	maraka decimal(12,8) not null,
	prijateljica int 
);

alter table punica add foreign key(cura) references cura(sifra);
alter table sestra add foreign key(prijateljica) references prijateljica(sifra);
alter table prijateljica add foreign key(ostavljen) references ostavljen(sifra);
alter table ostavljen add foreign key(zarucnik) references zarucnik(sifra);
alter table zarucnik_mladic add foreign key(zarucnik) references zarucnik(sifra);
alter table zarucnik_mladic add foreign key(mladic) references mladic(sifra);

-- 1 --
insert into prijateljica(gustoca, ostavljen)
values  
	(11.11, 1),
	(22.22, 2),
	(33.33, 3);
  
insert into ostavljen(introvertno,kratkamajica, prstena)
values  
	(0, ' Crna', 1),
	(0, 'Zlatna', 2),
	(1, 'Crvena', 10);             
              
insert into zarucnik_mladic(zarucnik, mladic)
values  
	(1, 3),
	(2, 2),
	(3, 1);

-- 2 --
update punica set eura=15.77;

-- 3 --      
delete from sestra where  hlace < 'AB';

-- 4 --
select kratkamajica from ostavljen where introvertno is null;

-- 5 --
select a.narukvica , f.stilfrizura , e.gustoca 
from mladic a
inner join zarucnik_mladic b on a.sifra      = b.mladic 
inner join zarucnik        c on b.zarucnik   = c.sifra
inner join ostavljen       d on c.sifra      = d.zarucnik 
inner join prijateljica    e on d.sifra      = e.ostavljen
inner join sestra          f on e.sifra      = f.prijateljica 
where d.introvertno is not null and c.asocijalno is not null
order by e.gustoca desc;

-- 6 --
select	a.asocijalno , a.modelnaocala 
from	zarucnik a left join zarucnik_mladic b on b.zarucnik = a.sifra 
where	b.zarucnik is null;