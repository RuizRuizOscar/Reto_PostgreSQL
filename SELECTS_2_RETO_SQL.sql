--VISTAS
--1 Enlista la ubicacion de todas las locaciones / oficinas

select 	city, 
		postal_code,
		country.name,
		region.name
from location
inner join country
on location.country_id = country.id
inner join region
on country.region_id = region.id;

--2 Lista la ubicacion de todas las locaciones / oficinas por region

select 	region.name,
		country.name,
		city
from location
inner join country
on location.country_id = country.id
inner join region
on country.region_id = region.id
order by region.id;

--3 Enlista todos los empleados de la empresa

select 	employee.id, 
		concat(first_name,' ', last_name) as employee_name
from 	employee
order by id;

--4 Muestra todos los datos de un empleado (datos personales y laborales)
select 	employee.id,
		concat(first_name,' ',last_name) as employee_name,
		phone_number,
		email,
		hire_date,
		job_title,
		department_name
	--	salary,
	--	commission_pct 
from 	employee
inner join job
on employee.job_id = job.id
inner join department
on job.department_id = department.id
--inner join historialJob
--on job.job_id = historialJob.job_id
order by employee.id;

--5 Muestra el historial del empleado dentro de la empresa (todos los puestos que ha ocupado)
select 	employee.id,
		concat(first_name,' ',last_name) as employee_name,
		hire_date,
		start_date,
		end_date,
		salary,
		commission_percentage
from employee
inner join historialJob
on employee.id = historialJob.employee_id;

--ALTER TABLE "historialJob" ADD FOREIGN KEY ("employee_id") REFERENCES "employee" ("employee_id");
		
		
--6 Muestra una lista de locaciones / oficinas por locacion
select 	location.id as oficina,
		country.name,
		city
from location
inner join country
on location.country_id = country.id
order by location.id;

--7 Enlista todos los empleados de una locacion
select 	location.id,
		city,
		employee.id, 
		concat(first_name,' ', last_name) as employee_name
from 	location
inner join department
on location.id = department.location_id 
inner join job
on department.id = job.department_id 
inner join employee
on job.id = employee.job_id
order by location.id;

--8 Lista todos los empleados de un departamento
select 	department.id,
		department_name,
		employee.id, 
		concat(first_name,' ', last_name) as employee_name
from 	department
inner join job
on department.id = job.department_id 
inner join employee
on job.id = employee.job_id
order by department.id;

--9 Lista de todos los empleados por puesto
select 	job.id,
		job_title,
		employee.id, 
		concat(first_name,' ', last_name) as employee_name
from 	job 
inner join employee
on job.id = employee.job_id
order by job.id;

--10 Muestra los detalles de un puesto de trabajo
select *
from job
where id = 1;

--11 Muestra los detalles de un departamento (supervisior, empleados, ubicacion)
select 	department.id,
		department_name,
		manager_id,
		city,
		employee.id, 
		concat(first_name,' ', last_name) as employee_name
from 	location
inner join department
on location.id = department.location_id 
inner join job
on department.id = job.department_id 
inner join employee
on job.id = employee.job_id
where department.id = 1
--order by department.department_id
;


--12 Muestra los empleados que trabajan para un supervisor

select 	department.manager_id,
		department.id,
		department_name,
		employee.id, 
		concat(first_name,' ', last_name) as employee_name
from 	department
inner join job
on department.id = job.department_id 
inner join employee
on job.id = employee.job_id
where department.manager_id = 101;
;