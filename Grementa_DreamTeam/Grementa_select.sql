select Курорт, Дата
from Температура

select*
from ЕкстреніСлужби

select max(Ціна)
from Візи

select min(Ціна)
from Екскурсії

select Назва,Телефон
from ЕкстреніСлужби
where Телефон like'[0-9][0-9][^2]'

select distinct Назва, Ціна
from Візи
where Ціна in(65,75)
order by Ціна 

select Назва_готелю, Дати
from Ціни where Ціна =(select min(Ціна)from Ціни)

select Назва
from Курорти where Назва like'[^д][^о]%' 

select distinct Назва, Ціна, ЧасВиготовлення
from Візи
where Ціна < 120
order by Ціна desc
