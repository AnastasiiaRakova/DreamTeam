﻿CREATE DATABASE DreamTeam
ON (NAME=DreamTeam_dat, 
FILENAME='D:\DB\DreamTeam.mdf')
LOG ON (NAME=DreamTeam_Log,
FILENAME='D:\DB\DreamTeam.ldf')


use DreamTeam
CREATE TABLE Країни
(id int NOT NULL,
Назва nchar(30) NOT NULL,
ЧасПольоту nchar(30),
ПочатокЛітньогоСезону nchar(30),
КінецьЛітньогоСезону nchar(30),
ПочатокЗимовогоСезону nchar(30),
КінецьЗимовогоСезону nchar(30),
Валюта nchar(30),
АльтернативнаВалюта nchar(30),
Віза nchar(30),
Столиця nchar(30),
Мова nchar(30)
constraint prim_Країна primary key (id))

USE DreamTeam
ALTER TABLE  Країни
ADD CONSTRAINT unique_столиця UNIQUE (Столиця)

use DreamTeam
alter table Країни
add constraint check_віза CHECK (Віза in ('+','-'))

use DreamTeam
INSERT INTO Країни
VALUES ('1','США','9','Травень','Вересень','Грудень','Лютий','Долар', NULL,'+','Олбані','англійська'),
('2','Італія','2','Червень','Вересень','Грудень','Березень','Євро', NULL,'-','Рим','iталiйська'),
('3','Туреччина','2','Червень','Серпень','Грудень','Березень','Лiра','Долар','-','Анкара','турецька'),
('4','Таїланд','11','Листопад','Грудень','-','-','Бат','Долар','+','Бангкок','тайська'),
('5','Франція', '2,50','Червень','Серпень','Грудень','Березень','Євро',	NULL,'-','Париж','французька'),
('6','Iндія','8','Листопад','Травень','Грудень','Березень','Рупiя','Долар','+','Нью-Делi','гiнда/англ'),
('7','Австралія','18','Грудень','Лютий','Червень','Серпень','Австралiйський долар','Долар',	'+','Канберра','англійська'),
('8','ПАР','9','Жовтень','Лютий','Червень','Серпень','Ранд','Долар','+','Кейптаун',	'англійська'),
('9','Мальдіви','13','Весь рiк','Весь рiк','-','-','Руфiя','Долар','+','Мале','мальдiвська'),
('10','Балі','16','Травень','Серпень','-','-','Рупiй','iндонезiйський	Долар','+','Денпасар','iндонезiйська'),
('11','Хорватія','1,5','Травень','Серпень','Грудень','Квiтень','Куна','Євро','-','Загреб','хорватська'),
('12','Португалія','5','Квiтень','Жовтень','Грудень','Сiчень','Євро', NULL,'-',	'Лiсабон','португальська'),
('13','Iспанія','4','Червень','Вересень','Грудень','Березень','Євро', NULL,'-','Мадрид','iспанська'), 
('14','Барбадос','12','Вересень','Травень','-','-','Барбадоський долар','Долар','+','Бриджтаун','англійська'),
('15','Домініканська республіка','12','Листопад','Березень','-','-','Домініканський песо','Євро','+','Санто-Домінго','іспанська'),
('16','Куба','12','Травень','Серпень','-','-','Кубинський песо','Євро','+','Гавана','іспанська'),
('17','Мадейра','6','Весь рiк','Весь рiк','-','-','Євро', NULL, '+','Фуншал','португальська'),
('18','Багами','12','Листопад','Травень','-','-','Багамський долар','Долар',	'+','Нассау','англійська'),
('19','Мальта','3','Травень','Серпень','-','-','Євро', NULL,	'+','Валета','мальтійська/англ'),
('20','Аргентина','18','Грудень','Лютий','Червень','Серпень','Аргентинське песо','Євро','+','Буенос-Айрес','іспанська')

alter table Країни
drop column Мова


CREATE TABLE Візи
(id int NOT NULL,
Назва nchar(30) NOT NULL,
Ціна INT NOT NULL,
ЧасВиготовлення nchar(30),
Країни_id int NOT NULL
CONSTRAINT prim_віза PRIMARY KEY (id)
CONSTRAINT foreign_віза_країна FOREIGN KEY (Країни_id)
REFERENCES Країни (id))

USE DreamTeam
alter table Візи
alter column Ціна int not null 

USE DreamTeam
ALTER TABLE Візи
ADD СпосібОтримання nchar(30)


alter table Візи
drop CONSTRAINT foreign_віза_країна


USE DreamTeam
INSERT INTO Візи(id,Назва, Ціна, ЧасВиготовлення, СпосібОтримання, Країни_id)
VALUES
('1','Національна','150','7-30днів','У Консульстві','1'),
('2','Шенген','65','7-30днів','У Консульстві','2'),
('3','По  прибуттю','35','2-10хвилин','В країні','3'),
('4','По  прибуттю','60', '2-10хвилин', 'В країні','4'),
('5','Шенген','100','7-10днів','У Консульстві','5'),
('6','По  прибуттю','55','2-10хвилин','В країні','6'),
('7','Національна','135','14-30днів','У Консульстві','7'),
('8','Національна','35','14-30днів','У Консульстві','8'),
('9','По  прибуттю','65','2-10хвилин','В країні','9'),
('10','По  прибуттю','65','2-10хвилин','В країні','10'),
('11','Національна','36','3-7днів','У Консульстві','11'),
('12','Шенген','35','7-30днів','У Консульстві','12'),
('13','Шенген','35','7-30днів','У Консульстві','13'),
('14','Національна','45','7-30днів','У Консульстві','14'),
('15','Шенген','90','3-7днів','У Консульстві','15'),
('16','По  прибуттю','60','2-10хвилин','В країні','16'),
('17','По  прибуттю','65','2-10хвилин','В країні','17'),
('18','По  прибуттю','60','2-10хвилин','В країні','18'),
('19','Шенген','35','7-10днів','У Консульстві','19'),
('20','Національна','120','7-10днів','У Консульстві','20')


use DreamTeam
create table ВізиКраїни
(id_Країни int not null,
id_Візи int not null
CONSTRAINT foreign_візакраїни_країна FOREIGN KEY (id_Країни)
REFERENCES Країни (id))

alter table ВізиКраїни
add CONSTRAINT foreign_віза_країна FOREIGN KEY (id_Візи)
REFERENCES Візи (id)

INSERT INTO ВізиКраїни
VALUES
('1','1'),
('2','2'),
('3','3'),
('4','4'),
('5','5'),
('6','6' ),
('7','7'),
('8','8'),
('9','9'),
('10','10'),
('11','11'),
('12','12'),
('13','13'),
('14','14'),
('15','15'),
('16','16'),
('17','17'),
('18','18'),
('19','19'),
('20','20')


use DreamTeam
CREATE TABLE Свята
(Країна_id int NOT NULL,
Назва nchar(30) NOT NULL,
Дата NVARCHAR (10),
Опис nchar(300) NOT NULL,
CONSTRAINT prim_свято PRIMARY KEY (Країна_id))

use DreamTeam
alter table Свята
add constraint foreign_країна_свято foreign key (Країна_id)
references Країни (id)

alter table Свята
drop constraint foreign_країна_свято

alter table Свята
drop CONSTRAINT prim_свято

alter table Свята
add id_Свята int  

alter table Свята
DROP COLUMN id_Свята 

alter table Свята
add id_Свята int NOT NULL

alter table Свята
ADD CONSTRAINT prim_свято PRIMARY KEY (id_Свята)

alter table Свята
drop CONSTRAINT prim_свято

alter table Свята
drop column id_Свята 


alter table Свята
add id int NOT NULL

alter table Свята
ADD CONSTRAINT prim_свято PRIMARY KEY (id)


use DreamTeam
insert into  Свята
values
('1','День подяки','27.11','традиційне північноамериканське свято, засноване з метою віддати дяку Богові за жнива та за одержані блага протягом року','1'),
('2','Феррагостро','24.08','релігійне свято, відоме як день жатви або завершення великих польових робіт','2'),
('3','Рамядян', '15.06' , 'релігійне мусульманське свято, символізує закінчення посту','3'),
('4','Фестиваль повітряних зміїв', '10.03', 'народне свято, яке проводилось під патронатом монахів як вид спорту','4'),
('5','День взяття Бастилії', '14.07', 'французьке національне свято, відзначається феєрверками по всій країні та військовим парадом в Парижі','5'),
('6','Холі' , '13.03',  'фестиваль та найбарвистіше свято Індії','6'),
('7','День Австралії','26.01','Національне свято. У цей день у 1788 р. в Сіднейській бухті висадилась перша партія англійських переселенців','7'),
('8','День незалежності' , '27.04' , 'державне свято','8'),
('9','День незалежності' , '26.07','державне свято','9'),
('10','Свято Драхми', '31.03', 'Свято галунган символізує перемогу сили добра над силами зла і невігластва. Це один з найважливіших свят для балійців, свято на честь творця всесвіту і духів предків','10'),
('11','Богоявлення' , '6.01' , 'релігійне свято, подія під час хрещення Ісуса Христа в ріці Йордан, у якій Христос об"являє себе людям як Месію і Спасителя','11'),
('12','Страсна пятниця' , '22.04' , 'релігійне свято, день розпяття Христа','12'),
('13','Памплони' ,'14.07' , 'свято не для людей вразливих і слабкодухих, оскільки це знамениті перегони биків – Санфермінес','13'),
('14','День різвяних подарунків' , '26.12' , 'державне свято у Барбадосі','14'),
('15','День незалежності' , '27.02' , 'державне свято','15'),
('16','День незалежності Куби' , '10.10' , 'У цей день Карлос Мануель Сеспедес в 1868 році дарував свободу рабам і очолив повстання проти іспанців','16'),
('17','Різдво' , '25.07' , 'релігійне свято,у християнстві день народження Ісуса Христа, Господа Нашого і Спасителя, у Вифлиємі від Діви Марії','17'),
('18','День святого духа' , '16.05' , 'релігійне свято','18'),
('19','Новий рік' , '1.01' , '1-й день року в григоріанському календарі. До кінця року залишається 364 дні (365 днів — у високосні роки)','19'),
('20','Новий рік' , '1.01' , '1-й день року в григоріанському календарі. До кінця року залишається 364 дні (365 днів — у високосні роки)','20')


use DreamTeam
create table СвятоКраїни
(id_Країни int not null,
id_Свята int not null
CONSTRAINT foreign_святокраїни_країна FOREIGN KEY (id_Країни)
REFERENCES Країни (id))

alter table СвятоКраїни
add CONSTRAINT foreign_свято FOREIGN KEY (id_Свята)
REFERENCES Свята (id)


INSERT INTO СвятоКраїни
VALUES
('1','1'),
('2','2'),
('3','3'),
('4','4'),
('5','5'),
('6','6' ),
('7','7'),
('8','8'),
('9','9'),
('10','10'),
('11','11'),
('12','12'),
('13','13'),
('14','14'),
('15','15'),
('16','16'),
('17','17'),
('18','18'),
('19','19'),
('20','20')



CREATE TABLE Мови
(Країна_id int NOT NULL,
Назва nchar(30) NOT NULL
CONSTRAINT prim_мови PRIMARY KEY (Країна_id)
CONSTRAINT foreign_мови_країна FOREIGN KEY (Країна_id)
REFERENCES Країни (id))

USE DreamTeam
INSERT INTO Мови
VALUES ('1','Англійська'),
('2','Італійська'),
('3','Турецька'),
('4','Тайська'),
('5','Французька'),
('6','Гiнда'),
('7','Англійська'),
('8','Англійська'),
('9','Мальдiвська'),
('10','Індонезiйська'),
('11','Хорватська'),
('12','Португальська'),
('13','Іспанська'),
('14','Англійська'),
('15','Іспанська'),
('16','Іспанська'),
('17','Португальська'),
('18','Англійська'),
('19','Мальтійська'),
('20','Іспанська')


CREATE TABLE ЕкстреніСлужби
(id int NOT NULL,
Назва nchar(30) NOT NULL,
Телефон INT NOT NULL,
Країни_id int NOT NULL
CONSTRAINT prim_служба PRIMARY KEY (id )
CONSTRAINT foreign_країна_служба FOREIGN KEY (Країни_id)
REFERENCES Країни (id))

use DreamTeam
INSERT INTO ЕкстреніСлужби
VALUES ('1','Єдина служба порятунку','911', '1'),
('2','Єдина служба порятунку','112', '2'),
('3','Швидка допомога','112', '3'),
('4','Поліція','155', '4'),
('5','Пожежна','110', '5'),
('6','Єдина служба порятунку','911', '6'),
('7','Єдина служба порятунку','112', '7'),
('8','Єдина служба порятунку','100', '8'),
('9','Швидка допомога','102', '9'),
('10','Поліція','119', '10'),
('11','Пожежна','118', '11'),
('12','Єдина служба порятунку','112', '12'),
('13','Єдина служба порятунку','112','13'),
('14','Єдина служба порятунку','119','14'),
('15','Єдина служба порятунку','911','15'),
('16','Єдина служба порятунку','171','16'),
('17','Єдина служба порятунку','112','17'),
('18','Єдина служба порятунку','112','18'),
('19','Єдина служба порятунку','112','19'),
('20','Єдина служба порятунку','911','20')




USE DreamTeam
CREATE TABLE Курорти
(Країни_id int NOT NULL,
Назва nchar(30) NOT NULL
CONSTRAINT prim_курорт PRIMARY KEY (Країни_id)
CONSTRAINT foreign_курорт_країна FOREIGN KEY (Країни_id)
REFERENCES Країни (id))

use DreamTeam
alter table Курорти
drop foreign_курорт_країна

use DreamTeam
alter table Курорти
drop prim_курорт

alter table Курорти
add CONSTRAINT prim_курорт PRIMARY KEY (Назва)

alter table Курорти
add CONSTRAINT foreign_курорт_країна FOREIGN KEY (Країни_id)
REFERENCES Країни (id)


USE DreamTeam
INSERT INTO Курорти
VALUES 
('1','Нью-Йорк'), 
('2','Ріміні'),
('3','Анкара'),
('4','Бангкок'),
('5','Канни'),
('6','Нью-Делi'),
('7','Канберра'),
('8','Кейптаун'),
('9','Мале'),
('10','Денпасар'),
('11','Загреб'),
('12','Фаро'),
('13','Мадрид'),
('14','Бриджтаун'),
('15','Пуерто кана'),
('16','Гавана'),
('17','Фуншал'),
('18','Нассау'),
('19','Валета'),
('20','Буенос-Айрес')


CREATE TABLE Екскурсії
(Назва nchar(30) NOT NULL,
Курорт nchar(30) NOT NULL,
Ціна INT NOT NULL,
Опис nchar(900)
CONSTRAINT prim_екскурсії PRIMARY KEY (Назва)
CONSTRAINT foreign_курорт_екскурсії FOREIGN KEY (Курорт)
REFERENCES Курорти (Назва))

alter table Екскурсії
drop CONSTRAINT prim_екскурсії

alter table Екскурсії
alter column 
Назва nchar(300) NOT NULL

alter table Екскурсії
add constraint prim_екскурсії PRIMARY KEY (Назва)

USE DreamTeam
INSERT INTO Екскурсії (Назва, Курорт, Опис, Ціна)
VALUES
('Billet coupe-file à l"observatoire One World à New York', 'Нью-Йорк', 'Екскурсія проходить по острову Манхеттен - центральному району Нью-Йорка, де розташовані основні пам"ятки «Столиці світу».  Повний оглядовий тур з круїзом до Статуї Свободи', '90'),
('Ріміні - два міста в одному','Ріміні', 'Якщо відійти від берега на півтора кілометра, Ви побачите спокійний середньовічний Ріміні. Це місто зберегло сліди Римського періоду. В кінці Фламінієвої дороги височить тріумфальна арка Августа, до сих пір діючий міст Тіберіо, а також сліди епохи Відродження: замок і храм Малатеста', '80'),
('Holiday Inn Ankara', 'Анкара','Анкара, здіймається на крутому схилі берегів Інгурі-Су. Це сучасний європейський мегаполіс, де багато що нагадує про історію міста', '40'),
('Оглядовий тур по Бангкоку','Бангкок','Досвідчений гід покаже вам найбільш популярні місця Бангкока: Королівський Палац і храм Смарагдового Будди, храм Лежачого Будди Ват-ПХО і храм Ранкової Зорі Ват Арун. Ви дізнаєтеся про історію країни, Бангкока, королівської сім"ї, буддистські вірування і звичаї в Таїланді','90'),
('Канни - кінозірка Ривєри','Канни','В ході екскурсії по Каннам ми відвідаємо історичний центр міста, розташований на пагорбі Сюке (La Suquet) і складається з десятка мальовничих вуличок. Звідси відкривається дивовижна панорама на все місто, зокрема, на масив Естерель (Massif de l"Esterel) і Леринські острови (Îles de Lérins)','100'),
('Оглядовий тур по Нью-Делі','Нью-Делi','Столичний округ Нью-Делі сам по собі є пам"яткою величезного мегаполісу Делі. Особливість столиці в тому, що вона побудована відносно недавно, на початку минулого століття, британськими архітекторами. Тут розташовані головні урядові будівлі Індії, музеї, а також прекрасні парки','20'),
('Cерце нації','Канберра','Канберра - це місто, в якому є досить багато пам"ятників і меморіалів. Найзнаменитіший - це Австралійський військовий меморіал, який був зведений на честь брали участь у війнах Австралійського Союзу солдатів. У цьому меморіалі є і сад скульптур, який присвячений всім армійським підрозділам','100'),
('Винні ферми','Кейптаун','Найкращі винні маєтки Південної Африки знаходяться в передмістях Кейптауна, в провінції Західний Кейп. Найпопулярніші винні маршрути пролягають по Стелленбош, парла і Франчхук. Ці провінції буде дуже цікаво відвідати, навіть якщо ви не дуже цікавитеся вишукуваннями майстерних виноробів','110'),
('Екскурсії на гідролітаках','Мале','Пропонується кілька типів вертолітних екскурсій коротка екскурсія для зйомок з повітря островів, що оточують їх лагун, коралових рифів, і, якщо пощастить, величезних скатів і зграй дельфінів. Політ над островами на гідролітаку - одне з найбільш хвилюючих вражень від відпочинку','180'),
('Неймовірні водоспади Балі','Денпасар','Під час цієї екскурсії ви побачите найкрасивіші водоспади, а також дивовижну природу острова Богів!','45'),
('Загреб в машині часу','Загреб','Загреб - столиця і найважливіший економічний центр Хорватії. Це місто часто називають воротами в Західну Європу. Загреб знаходиться на берегах річки Сава і у самого підніжжя гори Медведніца. Таке розташування забезпечило місту транспортний зв"язок зі станами Адріатичного узбережжя, Центральної Європи','65'),
('Історія 3 округів','Фаро','Фару в Римський період був древній столицею - Ossónoba. Ми відвідаємо Віла-Adentro оточену фортечною стіною.Муніципальний музей Фару розташований в стінах монастиря Успіння Богородиці, в якому проводять виставки присвячені римському спадщині, арабській культурі і сучасності','45'),
('Скарби Прадо','Мадрид','Прадо навряд чи можна назвати самим грандіозним або повним з музеїв світу. Однак, мабуть, він цілком заслужив звання самого виразного музею. Його експозиції збудовані з величезною любов"ю, тому наша екскурсія доставить вам справжнє задоволення. Ви побачите роботи Тиціана, Рубенса, Рафаеля, загадкового Босха, екзальтованого Ель Греко, великого Веласкеса, різного Гойю','30'),
('Coconut Tours','Бриджтаун','Бриджтаун є культурним центром - Барбадосу. На тлі пам"ятників колоніальної архітектури сучасні ділові будівлі виглядають невибагливо. На Трафагальской площі стоїть Будинок уряду (1870). Найвідомішим культовою будівлею є собор св.Михаїла','24'),
('Puerto Plata City Tour with Cable Car Ride','Пуерто кана','Відвідайте місцеві визначні пам"ятки, зокрема Музей Домініканського Янтарю. Потім поспішайте на канатну дорогу міста, щоб відвідати вершину гори Ізабель-дель-Торрес. По дорозі слухайте інформативний та розважальний коментар від вашого гіда. Трансфер в обидва кінці від готелів Пуерто Плата включений','50'),
('Шоу «Buena Vista Social Club» + міні-тур по нічній Гавані','Гавана', 'Жива кубинська легенда Buena Vista Social Club - ветерани кубинської естради, проект унікальний і актуальний на початку 21 століття, коли кубинська музика переживає справжній бум по всьому світу','80'),
('Морська прогулянка на Мадейрі','Фуншал','Морська подорож в групі на каравели Санта Марія вздовж південно-західного узбережжя острова Мадейра. Ця човен є точною копією каравели Санта Марія, на якій була відкрита Америка Христофором Колумбом! Чудові декорації, команда в піратських костюмах того часу, папуга і вино Мадейра-ви відчуєте себе першовідкривачами, зможете побачити дельфінів, морських черепах і якщо пощастить - китів','32'),
('Island Time Charters','Нассау','Нассау заслуговує на звання історичного центру Багамських островів. Тут все пронизано духом минулих часів – архітектура, пам"ятники, музеї. Варто зазирнути до головної міської Площі Парламенту. Тут на початку 19 століття було зведено будівлю Верховного суду, колоніальної адміністрації','60'),
('Оглядова екскурсія по Валетте','Валета','Пішохідна екскурсія від воріт фортеці міста, старовинними вуличками до Верхнім садам Баракка, звідки можна помилуватися прекрасним видом Великій Гавані. Далі, по гучних вулицях Валетти Ви пройдете до Кафедрального собору Св. Іоанна Хрестителя (Кафедральний Собор лицарів Мальтійського ордена) і відвідайте Палац Великого магістра Мальтійського ордена, де можна буде оглянути парадні і урядові зали (можливо відвідування збройового музею, розташований також у Палаці Великого Магістра)','55'),
('Буенос-Айрес - місто контрастів','Буенос-Айрес','Тут сучасні хмарочоси є сусідами з вишуканими архітектурними будівлями, а дорогі квартали - з нетрями будинків. Це один з найбільш густонаселених і багатонаціональних міст Південної Америки. Своє місто місцеві жителі - портеньос - називають ласкаво-скорочено – Байрес','83')


use DreamTeam
create table Готелі
(Курорт nchar (30),
Назва_готелю nchar (30)
constraint prim_готелі primary key (Назва_готелю),
CONSTRAINT foreign_готель_країна FOREIGN KEY (Курорт)
REFERENCES Курорти (Назва))

use DreamTeam
alter table Готелі
drop constraint prim_готелі

use DreamTeam
alter table Готелі
alter column Назва_готелю nchar (300) 


use DreamTeam
alter table Готелі
alter column Назва_готелю nchar (300) not null 


use DreamTeam
alter table Готелі
add constraint prim_готелі primary key (Назва_готелю)

use DreamTeam
INSERT INTO Готелі
VALUES
('Нью-Йорк','The Hills'), 
('Ріміні','Qualys Hotel Royal Torino '),
('Анкара','Malta Bosphorus Hotel & Spa'),
('Бангкок','Dome Resort'),
('Канни','Color Design Hotel'),
('Нью-Делi','Dunhill Beach Resort'),
('Канберра','BreakFree Bell City '),
('Кейптаун','The Stellenbosch Hotel '),
('Мале','Filitheyo Island Resort '),
('Денпасар','Alamdini Resort Ubud '),
('Загреб','Hotel Degenija'),
('Фаро','Alma do Pico '),
('Мадрид','Platjador '),
('Бриджтаун','Palm Garden Hotel Barbados '),
('Пуерто кана','Cayo Arena Beach Eco-Hotel'),
('Гавана','Villa Havane '),
('Фуншал','Holiday Inn Express & Suites - St. Petersburg - Seminole Area '),
('Нассау','Abaco Beach Resort & Boat Harbour'),
('Валета','Dolmen Resort Hotel & SPA'),
('Буенос-Айрес','Gaviotas Apart Hotel ')


use DreamTeam
create table Ціни
(Ціна int not null,
Назва_готелю nchar (300) not null,
Дати nchar (10),
Харчування nchar (30)
constraint prim_ціни primary key (Назва_готелю),
CONSTRAINT foreign_готель_ціна FOREIGN KEY (Назва_готелю)
REFERENCES Готелі (Назва_готелю))

use DreamTeam
INSERT INTO Ціни
VALUES
('111','The Hills','01.окт','Bed & Breakfast'),
('112','Qualys Hotel Royal Torino ', '08.июн','Bed & Breakfast'),
('63','Malta Bosphorus Hotel & Spa','01.июл','Continental Breakfast'),
('50','Dome Resort','02.окт','Continental Breakfast'),
('125','Color Design Hotel','1.июн','Bed & Breakfast'),
('62','Dunhill Beach Resort', '11.дек','Ultra All Inclusive'),
('114','BreakFree Bell City ','23.фев','Bed & Breakfast'),
('147','The Stellenbosch Hotel ','13.окт','Bed & Breakfast'),
('215','Filitheyo Island Resort ','04.дек','Bed & Breakfast'),
('45','Alamdini Resort Ubud ','09.июл','Half Board'),
('37',	'Hotel Degenija','10.авг','Ultra All Inclusive'),
('69',	'Alma do Pico ','18.июн','Continental Breakfast'),
('1943',	'Platjador' ,'19.сен','Half Board'),
('120','Palm Garden Hotel Barbados', '13.фев','Bed & Breakfast'),
('64','Cayo Arena Beach Eco-Hotel','17.янв	','Half Board'),
('68',	'Villa Havane', '03.май','Continental Breakfast'),
('107','Holiday Inn Express & Suites - St. Petersburg - Seminole Area', '21.июл','Half Board'),
('316','Abaco Beach Resort & Boat Harbour','03.янв','Bed & Breakfast'),
('63','Dolmen Resort Hotel & SPA','16.июл','Continental Breakfast'),
('183',	'Gaviotas Apart Hotel', '25.дек','Bed & Breakfast')

use DreamTeam
create table Температура
(Дата nchar (10),
Курорт nchar (30),
Температура int not null
constraint prim_температура primary key (Курорт),
CONSTRAINT foreign_курорт_темп FOREIGN KEY (Курорт)
REFERENCES Курорти (Назва))

use DreamTeam
INSERT INTO Температура
VALUES
('01.Жов','Нью-Йорк','19'),
('08.Чер','Ріміні','28'),
('01.Лип','Анкара','33'),
('02.Жов','Бангкок','31'),
('11.Чер','Канни','27'),
('11.Гру','Нью-Делi','26'),
('23.Лют','Канберра','36'),
('13.Жов','Кейптаун','28'),
('04.Гру','Мале',	'31'),
('09.Лип','Денпасар','27'),
('10.Сер','Загреб','28'),
('18.Чер','Фаро','33'),
('19.Вер','Мадрид','25'),
('13.Лют','Бриджтаун','29'),
('17.Січ','Пуерто кана','26'),
('03.Тра','Гавана','32'),
('21.Лип','Фуншал','25'),
('03.Січ','Нассау','29'),
('16.Лип','Валета','31'),
('25.Гру','Буенос-Айрес','29')


USE DreamTeam
UPDATE Країни 
SET ЧасПольоту='24'
WHERE Назва='Аргентина'

USE DreamTeam
UPDATE Країни 
SET Віза='-'
WHERE id='7'

USE DreamTeam
UPDATE Країни 
SET ПочатокЗимовогоСезону='Січень'
WHERE КінецьЗимовогоСезону='Лютий'

USE DreamTeam
UPDATE Свята
SET Дата='25.12'
WHERE Назва='День різвяних подарунків'

USE DreamTeam
UPDATE Свята
SET Дата='31.12-1.01'
WHERE Назва='Новий рік'

USE DreamTeam
UPDATE Свята
SET Опис='Релігійне свято'
WHERE id='11' OR id='12'


delete from ЕкстреніСлужби
where Телефон='911'

update ЕкстреніСлужби
set Телефон='911'
where Назва='Швидка допомога'

update ЕкстреніСлужби
set Телефон='911'
where id='8' or Країни_id='19'

update ЕкстреніСлужби
set Назва='ЄСП'
where Телефон='911' or Телефон='112'

DELETE ЕкстреніСлужби
WHERE Назва='ЄСП' AND Телефон='112'


USE DreamTeam
UPDATE Курорти
SET Країни_id='18'
WHERE Назва='Валета'

USE DreamTeam
UPDATE Мови
SET Назва='Англійська'
WHERE Країна_id='19'

DELETE Мови
WHERE Назва='Іспанська'

USE DreamTeam
UPDATE Візи
SET Ціна='125'
WHERE Назва='Шенген'

USE DreamTeam
UPDATE Екскурсії
SET Ціна=Ціна*2


DELETE FROM Екскурсії
WHERE Ціна<'50'
