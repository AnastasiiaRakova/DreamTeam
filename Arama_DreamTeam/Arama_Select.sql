USE DreamTeam

select Назва, Опис
from Екскурсії

select Назва, Дата
from Свята


select avg(Ціна)
from Ціни

select min(Ціна)
from Екскурсії


select max(ЧасПольоту) 
from Країни

select count(Курорт) 
from Температура
where Температура>29


select distinct Назва, Ціна
from Візи
where Ціна between 65 and 130
order by Ціна desc

select Назва_готелю, Ціна
from Ціни
where Ціна in (120, 125)
order by Ціна


select Назва,Опис, Ціна
from Екскурсії where Ціна < (select avg(Ціна) from Екскурсії)

select Назва, Телефон
from ЕкстреніСлужби where Телефон = (select Телефон from ЕкстреніСлужби where Телефон like '%5%')


select Країни.Назва, Свята.Назва, Свята.Дата
from Свята inner join Країни on Свята.Країна_id = Країни.id

select Країни.Назва, Курорти.Назва
from Курорти inner join Країни on Курорти.Країни_id = Країни.id
where Країни.ПочатокЛітньогоСезону = 'Червень'