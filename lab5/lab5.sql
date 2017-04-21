--1.1 ������, ��� �� �������� ������ �� ������
SELECT TOP 1 * FROM client;


--2.1 ������� ��� �����������(��) � ��������(��) ���������� ���� ������ 
SELECT * FROM hairdresser WHERE work_experience IS NULL;

--2.2 ������� ��� �����������(��) � ��������(��) �������� ���� ������ 
SELECT * FROM hairdresser WHERE work_experience IS NOT NULL;

--2.3 ��� �� ������������ ����� ���� ������ �� 2 �� 6 ���
SELECT * FROM hairdresser WHERE work_experience BETWEEN 2 AND 6;

--2.4 ������� ������������ ������� �������� � �������������� 1 � 3
SELECT * FROM hairdresser WHERE id_barbershop IN (1,3);

--2.5 ������ ����� �������� � ������� ���� ������� �����
SELECT name_client FROM client WHERE club_card = True;

--2.6 ������ ����� �������� � ������� ��� ������� �����
SELECT name_client FROM client WHERE club_card <> True;


--3.1 ������� �������� �� ������� service � ������������� �� ���� � ������� �����������
SELECT * FROM service ORDER BY price ASC;

--3.2 �������� ������ �� �����������
SELECT * FROM service ORDER BY price DESC

--3.3 �������� ������ � ��������������� ������� �� ���� � �� ������� ����������
SELECT * FROM service ORDER BY price ASC, time_of_completion ASC;

--3.4 �������� ������ � �� ���� � ������� �����������
SELECT price, name_service FROM service ORDER BY 1 ASC;


--4.1 ������ ����������� ���� ������
SELECT MIN(price) FROM service;

--4.2 ������ ������������ ���� ������
SELECT MAX(price) FROM service;

--4.3 ������ ������� ���� �����
SELECT AVG(price) FROM service;

--4.4 ������ ������� ����� ���� ��������� ������������
SELECT SUM(amount) FROM salary;


--5.1 ������ ����� ���������� ��������
SELECT DISTINCT (date) FROM salary;

--5.2 ������ ���-�� �������������� � ������� �������� �����������
SELECT COUNT(*) FROM (SELECT DISTINCT (id_barbershop) FROM hairdresser);


--6.1 ������ ������� ����� ���� ��������� �����������
SELECT id_hairdresser, SUM (amount) FROM salary GROUP BY id_hairdresser;

--6.2 ������ ������� ���� ��������� ������������ 7.04.2017
SELECT id_hairdresser, SUM (amount) FROM salary WHERE date = '07.04.2017' GROUP BY id_hairdresser;

--6.3 ������ ��� �� ������������ ������� � ����� ������ 100000
SELECT id_hairdresser, SUM (amount) FROM salary GROUP BY id_hairdresser HAVING SUM(amount) > 100000;
