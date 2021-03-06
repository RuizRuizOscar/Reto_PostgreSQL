--1 Formulario para crear nuevas regiones
insert into region 
( 	
	name
)
values
('Norteamerica'),
('Europa'),
('Centroamérica'),
('Asia')
;

--2 Formulario para crear nuevos países
insert into country 
( 	
	name,
	region_id
)
values
	 ('Canada',1),
	 ('EEUU',1),
	 ('Mexico',1),
	 ('España',2),
	 ('Francia',2),
	 ('Alemania',2),
	 ('Belice',3),
	 ('Guatemala',3),
	 ('Costa Rica',3),
	 ('El Salvador',3),
	 ('Honduras',3),
	 ('Panama',3),
	 ('Japón',4),
	 ('China',4),
	 ('Rusia',4),
	 ('Mongolia',4),
	 ('Kuwait',4),
	 ('Hong Kong',4);

--delete from country where country_id = 1;
--drop table employee;
ALTER TABLE employee 
ADD COLUMN email varchar(50);

--3 Formulario para crear nuevos puestos
insert into job 
( 	
	job_title,
	max_salary,
	min_salary,
	department_id
)
values
(	'Sales Manager',	50000.05,	40000.04,	1),
(	'IT Manager',	51000.05,	41000.04,	2),
(	'Finance Manager',	52000.05,	42000.04,	3),
(	'HR Manager',	53000.05,	43000.04,	4),
(	'Marketing Manager',	54000.05,	44000.04,	5),
(	'Acquisitions Manager',	55000.05,	45000.04,	6),
(	'Infrastructure Manager',	56000.05,	46000.04,	7),
(	'Maintenance Manager',	57000.05,	47000.04,	8),
(	'Janitor Manager',	58000.05,	48000.04,	9),
(	'Real Estate Manager',	59000.05,	49000.04,	10);

--4 Formulario para crear nuevos departamentos
INSERT INTO department 
(
	department_name,
	manager_id,
	location_id
) VALUES
	('Sales',101,6),
	('IT',102,7),
	('Finance',103,8),
	('Human Resources',104,9),
	('Marketing',105,10),
	('Acquisitions',106,11),
	('Infrastructure',107,12),
	('Maintenance',108,13),
	('Janitor',109,14),
	('Real Estate',110,15);

/*insert into department 
( 	
	department_name,
	manager_id,
	location_id
)
values
(	'Marketing',	105,	10),
(	'Acquisitions',	106,	11),
(	'Infrastructure',	107,	12),
(	'Maintenance',	108,	13),
(	'Janitor',	109,	14),
(	'Real Estate',	110,	15);*/

--5 Formulario para crear nuevas locations

/*insert into "location" 
( 	
	city,
	postal_code,
	street_address,
	country_id
)
values
(	'Belmopan',	'87420',	'belicianos 33',	8),
(	'Guatemala',	'87445',	'guatepeor 88',	9),
(	'San Jose',	'84572',	'Ticos 99',	10),
(	'San Salvador',	'97482',	'la mara 125',	11),
(	'Tegucigalpa',	'84289',	'hondureños 68',	12),
(	'Tokyo',	'84572',	'Nipones 99',	14),
(	'Beijing',	'84572',	'lacios 99',	15),
(	'Madrid',	'84572',	'madrileños 99',	5),
(	'Paris',	'84572',	'galos 99',	6);*/

INSERT into location 
(
	city,
	postal_code,
	street_address,
	country_id
) VALUES
	('Ottawa','03698','Lafontaine 33',2),
	('New York','36985','Dakota 33',3),
	('Boston','36858','bostoniana 44',3),
	('San Francisco','68548','Franciscana 55',3),
	('Guadalajara','87452','Zapopan 66',4),
	('Monterrey','87420','Silla 77',4),
	('Zacatecas','87445','Cantera 88',4),
	('San Luis Potosi','84572','Dr Manuel Nava 99',4),
	('Querétaro','97482','Tollocan 125',4),
	('Ciudad Valles','84289','Ni idea 68',4),
	('Belmopan','87420','belicianos 33',8),
	('Guatemala','87445','guatepeor 88',9),
	('San Jose','84572','Ticos 99',10),
	('San Salvador','97482','la mara 125',11),
	('Tegucigalpa','84289','hondureños 68',12),
	('Tokyo','84572','Nipones 99',14),
	('Beijing','84572','lacios 99',15),
	('Madrid','84572','madrileños 99',5),
	('Paris','84572','galos 99',6);

--6 Formulario para crear nuevo empleado
insert into "employee" 
( 	
	first_name,
	last_name,
	phone_number,
	hire_date,
	job_id,
	email 
)
values
(	'Pedro', 'López',	'1234587420', '2015-12-17',	1, 'pedro@a.com'),
(	'Juan', 'Pavón',	'2344587420', '2014-12-17',	2, 'juan@a.com'),
(	'María', 'Ruiz',	'1232587420', '2013-12-17',	3, 'maria@a.com'),
(	'Ana', 'Juárez',	'1214587420', '2012-12-17',	4, 'ana@a.com'),
(	'Constanza', 'Robles',	'7234587420', '2011-12-17',5, 'constanza@a.com'),
(	'Samuel', 'Valerio',	'9234587420', '2010-12-17',6, 'samuel@a.com'),
(	'Colosforo', 'Sánchez',	'6234587420', '2009-12-17',7, 'colosforo@a.com'),
(	'Petra', 'Hernández',	'1634587420', '2005-12-17',8, 'petra@a.com'),
(	'Tomas', 'Martínez',	'1834587420', '2007-12-17',9, 'tomas@a.com'),
(	'Daniel', 'Rodriguez',	'1034587420', '2008-12-17',10, 'daniel@a.com');

--7 Update para cambiar de puesto a un empleado
update employee 
set 
	job_id = 1
where
	employee_id = 9;

--8 Formulario para editar datos de empleado
update employee 
set
	email = 'ar@b.com'
where 
	updated_date is null;
	
--9 Formulario para el historial
insert into historialJob 
(
	start_date,
	end_date,
	job_id,
	commission_percentage,
	salary,
	employee_id
)
values
('2000-12-17','2001-12-17',1,0.20,30000,1),
('2000-12-17','2001-12-17',2,0.20,30000,2),
('2000-12-17','2001-12-17',3,0.20,30000,3),
('2000-12-17','2001-12-17',4,0.20,30000,4),
('2000-12-17','2001-12-17',5,0.20,30000,5),
('2000-12-17','2001-12-17',6,0.20,30000,6),
('2000-12-17','2001-12-17',7,0.20,30000,7),
('2000-12-17','2001-12-17',8,0.20,30000,8),
('2000-12-17','2001-12-17',1,0.20,30000,9),
('2000-12-17','2001-12-17',10,0.20,30000,10);