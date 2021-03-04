CREATE TABLE "location" (
  "location_id" SERIAL PRIMARY KEY,
  "city" varchar,
  "postal_code" varchar,
  "street_address" varchar,
  "country_id" int,
  "created_date" date(now),
  "updated_date" date
);

CREATE TABLE "job" (
  "job_id" SERIAL PRIMARY KEY,
  "job_title" varchar,
  "max_salary" int,
  "min_salary" int,
  "department_id" int,
  "created_date" date(now),
  "updated_date" date
);

CREATE TABLE "department" (
  "department_id" SERIAL PRIMARY KEY,
  "department_name" varchar,
  "manager_id" int,
  "location_id" int,
  "created_date" date(now),
  "updated_date" date
);

CREATE TABLE "region" (
  "region_id" SERIAL PRIMARY KEY,
  "region_name" varchar,
  "created_date" date(now),
  "updated_date" date
);

CREATE TABLE "country" (
  "country_id" SERIAL PRIMARY KEY,
  "country_name" varchar,
  "region_id" int,
  "created_date" date(now),
  "updated_date" date
);

CREATE TABLE "historialJob" (
  "historial_id" SERIAL PRIMARY KEY,
  "start_date" date,
  "end_date" date,
  "job_id" int,
  "commission_pct" float,
  "salary" float,
  "employee_id" int,
  "created_date" date(now),
  "updated_date" date
);

CREATE TABLE "employee" (
  "employee_id" SERIAL PRIMARY KEY,
  "first_name" varchar,
  "last_name" varchar,
  "phone_number" varchar,
  "hire_date" date,
  "job_id" int,
  "created_date" date(now),
  "updated_date" date
);

ALTER TABLE "location" ADD FOREIGN KEY ("country_id") REFERENCES "country" ("country_id");

ALTER TABLE "country" ADD FOREIGN KEY ("region_id") REFERENCES "region" ("region_id");

ALTER TABLE "employee" ADD FOREIGN KEY ("job_id") REFERENCES "job" ("job_id");

ALTER TABLE "historialJob" ADD FOREIGN KEY ("job_id") REFERENCES "job" ("job_id");

ALTER TABLE "historialJob" ADD FOREIGN KEY ("employee_id") REFERENCES "employee" ("employee_id");

ALTER TABLE "job" ADD FOREIGN KEY ("department_id") REFERENCES "department" ("department_id");

ALTER TABLE "department" ADD FOREIGN KEY ("location_id") REFERENCES "location" ("location_id");
