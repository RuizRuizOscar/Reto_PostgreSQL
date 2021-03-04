CREATE TABLE "location" (
  "location_id" SERIAL UNIQUE PRIMARY key not NULL,
  "city" varchar(100) not NULL,
  "postal_code" varchar(10) not NULL,
  "street_address" varchar(250) not NULL,
  "country_id" int not NULL,
  "created_date" timestamp not null default current_date,
  "updated_date" timestamp
);

CREATE TABLE "job" (
  "job_id" SERIAL UNIQUE PRIMARY key not NULL,
  "job_title" varchar(100),
  "max_salary" float,
  "min_salary" float,
  "department_id" int,
  "created_date" timestamp not null default current_date,
  "updated_date" timestamp
);

CREATE TABLE "department" (
  "department_id" SERIAL UNIQUE PRIMARY key not NULL,
  "department_name" varchar(100),
  "manager_id" int,
  "location_id" int,
  "created_date" timestamp not null default current_date,
  "updated_date" timestamp
);

CREATE TABLE "region" (
  "region_id" SERIAL UNIQUE PRIMARY key not NULL,
  "region_name" varchar(100),
  "created_date" timestamp not null default current_date,
  "updated_date" timestamp
);

CREATE TABLE "country" (
  "country_id" SERIAL UNIQUE PRIMARY key not NULL,
  "country_name" varchar(100),
  "region_id" int,
  "created_date" timestamp not null default current_date,
  "updated_date" timestamp
);

CREATE TABLE "historialJob" (
  "historial_id" SERIAL UNIQUE PRIMARY key not NULL,
  "start_date" date,
  "end_date" date,
  "job_id" int,
  "commission_pct" float,
  "salary" float,
  "employee_id" int,
  "created_date" timestamp not null default current_date,
  "updated_date" timestamp
);

CREATE TABLE "employee" (
  "employee_id" SERIAL UNIQUE PRIMARY key not NULL,
  "first_name" varchar(100),
  "last_name" varchar(100),
  "phone_number" varchar(15),
  "hire_date" date,
  "job_id" int,
  "created_date" timestamp not null default current_date,
  "updated_date" timestamp
);

ALTER TABLE "location" ADD FOREIGN KEY ("country_id") REFERENCES "country" ("country_id");

ALTER TABLE "country" ADD FOREIGN KEY ("region_id") REFERENCES "region" ("region_id");

ALTER TABLE "employee" ADD FOREIGN KEY ("job_id") REFERENCES "job" ("job_id");

ALTER TABLE "historialJob" ADD FOREIGN KEY ("job_id") REFERENCES "job" ("job_id");

ALTER TABLE "historialJob" ADD FOREIGN KEY ("employee_id") REFERENCES "employee" ("employee_id");

ALTER TABLE "job" ADD FOREIGN KEY ("department_id") REFERENCES "department" ("department_id");

ALTER TABLE "department" ADD FOREIGN KEY ("location_id") REFERENCES "location" ("location_id");