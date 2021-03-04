drop table region CASCADE;

CREATE TABLE region (
  id SERIAL UNIQUE PRIMARY key not NULL,
  name varchar(100),
  created_date timestamp not null default current_date,
  updated_date timestamp
);

drop table country CASCADE;

CREATE TABLE country (
  id SERIAL UNIQUE PRIMARY key not NULL,
  name varchar(100),
  region_id int not null references region (id),
  created_date timestamp not null default current_date,
  updated_date timestamp
);

drop table location CASCADE;

CREATE TABLE location (
  id SERIAL UNIQUE PRIMARY key not NULL,
  city varchar(100) not NULL,
  postal_code varchar(10) not NULL,
  street_address varchar(250) not NULL,
  country_id int not null references country (id),
  created_date timestamp not null default current_date,
  updated_date timestamp
);

drop table department CASCADE;

CREATE TABLE department (
  id SERIAL UNIQUE PRIMARY key not NULL,
  department_name varchar(100),
  manager_id int,
  location_id int not null references location (id),
  created_date timestamp not null default current_date,
  updated_date timestamp
);

drop table job CASCADE;

CREATE TABLE job (
  id SERIAL UNIQUE PRIMARY key not NULL,
  job_title varchar(100),
  max_salary float,
  min_salary float,
  department_id int not null references department (id),
  created_date timestamp not null default current_date,
  updated_date timestamp
);

drop table employee CASCADE;

CREATE TABLE employee (
  id SERIAL UNIQUE PRIMARY key not NULL,
  first_name varchar(100),
  last_name varchar(100),
  phone_number varchar(15),
  email varchar(50) unique not null,
  hire_date timestamptz,
  job_id int not null references job (id),
  created_date timestamp not null default current_date,
  updated_date timestamp
);

drop table historialJob CASCADE;

CREATE TABLE historialJob (
  id SERIAL UNIQUE PRIMARY key not NULL,
  start_date timestamptz,
  end_date timestamptz,
  job_id int not null references job (id),
  commission_percentage float,
  salary float check (salary > 0),
  employee_id int not null references employee (id),
  created_date timestamp not null default current_date,
  updated_date timestamp
);



ALTER TABLE location 		ADD FOREIGN KEY (id) 	REFERENCES country (id);

ALTER TABLE country 		ADD FOREIGN KEY (id) 	REFERENCES region (id);

ALTER TABLE employee 		ADD FOREIGN KEY (id) 	REFERENCES job (id);

ALTER TABLE historialJob 	ADD FOREIGN KEY (id) 	REFERENCES job (id);

ALTER TABLE historialJob 	ADD FOREIGN KEY (id) 	REFERENCES employee (id);

ALTER TABLE job 			ADD FOREIGN KEY (id) 	REFERENCES department (id);

ALTER TABLE department 		ADD FOREIGN KEY (id) 	REFERENCES location (id);