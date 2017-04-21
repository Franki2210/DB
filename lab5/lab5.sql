--1.1 Узнать, кто из клиентов первый по записи
SELECT TOP 1 * FROM client;


--2.1 Выбрать имя парикмахера(ов) у которого(ых) неизвестен опыт работы 
SELECT * FROM hairdresser WHERE work_experience IS NULL;

--2.2 Выбрать имя парикмахера(ов) у которого(ых) известен опыт работы 
SELECT * FROM hairdresser WHERE work_experience IS NOT NULL;

--2.3 Кто из парикмахеров имеет опыт работы от 2 до 6 лет
SELECT * FROM hairdresser WHERE work_experience BETWEEN 2 AND 6;

--2.4 Выбрать парикмахеров которые работают в парикмахерских 1 и 3
SELECT * FROM hairdresser WHERE id_barbershop IN (1,3);

--2.5 Узнать имена клиентов у которых есть клубная карта
SELECT name_client FROM client WHERE club_card = True;

--2.6 Узнать имена клиентов у которых нет клубной карты
SELECT name_client FROM client WHERE club_card <> True;


--3.1 Выбрать значения из таблицы service и отсортировать по цене в порядке возрастания
SELECT * FROM service ORDER BY price ASC;

--3.2 Показать услуги по возрастанию
SELECT * FROM service ORDER BY price DESC

--3.3 Показать услуши в отсортированном порядке по цене и по времени выполнения
SELECT * FROM service ORDER BY price ASC, time_of_completion ASC;

--3.4 Показать услуги и их цену в порядке возрастания
SELECT price, name_service FROM service ORDER BY 1 ASC;


--4.1 Узнать минимальную цену услуги
SELECT MIN(price) FROM service;

--4.2 Узнать максимальную цену услуги
SELECT MAX(price) FROM service;

--4.3 Узнать среднюю цену услуг
SELECT AVG(price) FROM service;

--4.4 Узнать сколько всего было выплачено парикмахерам
SELECT SUM(amount) FROM salary;


--5.1 Узнать когда выдавалась зарплата
SELECT DISTINCT (date) FROM salary;

--5.2 Узнать кол-во парикмахерских в которых работают парикмахеры
SELECT COUNT(*) FROM (SELECT DISTINCT (id_barbershop) FROM hairdresser);


--6.1 Узнать сколько всего было выплачено парикмахеру
SELECT id_hairdresser, SUM (amount) FROM salary GROUP BY id_hairdresser;

--6.2 Узнать сколько было выплачено парикмахерам 7.04.2017
SELECT id_hairdresser, SUM (amount) FROM salary WHERE date = '07.04.2017' GROUP BY id_hairdresser;

--6.3 Узнать кто из парикмахеров получил в общем больше 100000
SELECT id_hairdresser, SUM (amount) FROM salary GROUP BY id_hairdresser HAVING SUM(amount) > 100000;
