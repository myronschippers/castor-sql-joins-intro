CREATE TABLE "people" (
	id serial primary key,
	name varchar(50) not null
);

CREATE TABLE "social_security" (
	id serial primary key,
	number int not null,
	people_id int references "people"
);

-- All joined data
SELECT * FROM "people"
JOIN "social_security" ON "people".id = "social_security".people_id;

-- 
SELECT "people"."id", "people"."name", "social_security"."number" FROM "people"
JOIN "social_security" ON "people".id = "social_security".people_id;

SELECT * FROM "people"
JOIN "social_security" ON "social_security".people_id = "people".id;

SELECT * FROM "social_security"
JOIN "people" ON "social_security".people_id = "people".id;

SELECT * FROM "social_security"
JOIN "people" ON "social_security".people_id = "people".id
WHERE "people".id = 1;


-- One-to-Many

CREATE TABLE "cohort" (
	id serial primary key,
	name varchar(50) not null,
	start_date date
);

CREATE TABLE "students" (
	id serial primary key,
	name varchar(100) not null,
	cohort_id int references "cohort"
);

SELECT * FROM "cohort";

SELECT * FROM "students";


SELECT * FROM "cohort"
JOIN "students" ON "cohort".id = "students".cohort_id;

-- COUNTING

SELECT count(*) FROM "students";

SELECT count(*) as number_of_students FROM "students";

SELECT count(*) FROM "cohort"
JOIN "students" ON "cohort".id = "students".cohort_id
WHERE "cohort".name = 'Castor';

-- GROUPING
SELECT "cohort".name, count(*) FROM "cohort"
JOIN "students" ON "cohort".id = "students".cohort_id
GROUP BY "cohort".name;

-- SORTING
SELECT * FROM "students"
JOIN "cohort" ON "students".cohort_id = "cohort".id
WHERE "cohort".name = 'Castor'
ORDER BY "students".name DESC;




