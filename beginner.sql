SELECT  *
FROM parks_and_recreation.employee_demographics
where age > 40; # >= <=

SELECT  *
FROM parks_and_recreation.employee_demographics
where gender = 'male'; # != not equal to 

SELECT  *
FROM parks_and_recreation.employee_demographics
where birth_date <= '1987-01-01';


-- AND OR NOT -- LOGICAL OPERATORS
SELECT  *
FROM parks_and_recreation.employee_demographics
where birth_date <= '1987-01-01'
AND gender = 'female' # this will choose low 1987 and female
;


-- like statement #we can use ( % or _ )
SELECT  *
FROM parks_and_recreation.employee_demographics
where first_name like 'a%' or birth_date like '198%'
;


-- group by 
SELECT  gender, avg(age) , max(age), min(age), count(age)
FROM parks_and_recreation.employee_demographics
group by gender
;

SELECT  occupation, salary # difference is on occupation shows 1 office manager ....
FROM parks_and_recreation.employee_salary
group by occupation, salary
;

-- order by # asc or desc
SELECT  *
FROM parks_and_recreation.employee_demographics
order by age desc
;
-- having and where
SELECT  occupation 
FROM parks_and_recreation.employee_salary
where occupation like '%manager%'
group by occupation, salary
having avg(salary) > 35000 #just change here/ amount to see difference
;

-- limit aliasing
select *
from parks_and_recreation.employee_demographics
order by age desc #from old to young 
limit 4  # show many row in this case is 4
;

-- aliasing
select gender, avg(age) as avg_age
from parks_and_recreation.employee_demographics
group by gender
having avg_age >40
;