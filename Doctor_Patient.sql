create database HospitalDB;
use HospitalDB;

create table province_names (
    province_id char(2) primary key,
    province_name varchar(30)
);

create table patients (
    patient_id int primary key,
    first_name varchar(30),
    last_name varchar(30),
    gender char(1),
    birth_date date,
    city varchar(30),
    province_id char(2),
    allergies varchar(80),
    height decimal(3,0),
    weight decimal(4,0),
    foreign key (province_id) references province_names(province_id)
);

create table doctors (
    doctor_id int primary key,
    first_name varchar(30),
    last_name varchar(30),
    specialty varchar(25)
);

create table admissions (
    patient_id int,
    admission_date date,
    discharge_date date,
    diagnosis varchar(50),
    attending_doctor_id int,
    foreign key (patient_id) references patients(patient_id),
    foreign key (attending_doctor_id) references doctors(doctor_id)
);

insert into province_names (province_id, province_name) values
('MH', 'Maharashtra'),
('DL', 'Delhi'),
('KA', 'Karnataka'),
('TN', 'Tamil Nadu'),
('GJ', 'Gujarat');

insert into patients (patient_id, first_name, last_name, gender, birth_date, city, province_id, allergies, height, weight) values
(1, 'Amit', 'Shah', 'M', '1980-02-15', 'Mumbai', 'MH', null , 175, 75),
(2, 'Sneha', 'Iyer', 'F', '1990-06-22', 'Chennai', 'TN', 'Penicillin', 160, 60),
(3, 'Raj', 'Patel', 'M', '2000-10-12', 'Ahmedabad', 'GJ', 'Morphine', 180, 80),
(4, 'Chetan', 'Verma', 'M', '2020-01-01', 'Delhi', 'DL', 'Dust', 105, 18),
(5, 'Catherine', 'Fernandez', 'F', '1985-03-30', 'Bangalore', 'KA', null , 165, 55);

insert into doctors (doctor_id, first_name, last_name, specialty) values
(101, 'Dr. Anjali', 'Mehta', 'Cardiology'),
(102, 'Dr. Rahul', 'Desai', 'Orthopedics'),
(103, 'Dr. Neha', 'Rao', 'Neurology');

insert into admissions (patient_id, admission_date, discharge_date, diagnosis, attending_doctor_id) values
(1, '2023-01-10', '2023-01-15', 'Heart Disease', 101),
(2, '2023-03-12', '2023-03-18', 'Fracture', 102),
(3, '2023-05-05', '2023-05-10', 'Migraine', 103),
(4, '2024-02-20', '2024-02-22', 'Cold & Cough', 101),
(1, '2024-06-01', '2024-06-07', 'Checkup', 102);


-- 1.	Show the first name, last name and gender of patients who’s gender is ‘M’

select first_name,last_name,gender from patients where gender = 'M'; 

-- 2.	Show the first name & last name of patients who does not have any allergies

select first_name,last_name from patients where allergies is null ;

-- 3.	Show the patients details that start with letter ‘C’

select * from patients where first_name like 'c%';

-- 4.	Show the patients details that height range 100 to 200

select * from patients where height between 100 and 200;

-- 5.	Update the patient table for the allergies column. Replace ‘NKA’ where allergies is null

update patients set allergies = 'NKA' where allergies is null;

-- 6.	Show how many patients have birth year is 2020

select count(*) as birth_year from patients where year(birth_date)= 2020;

-- 7.	Show the patients details who have greatest height

select * from patients where height = (select max(height) from patients); 

select * from patients
order by height desc
limit 1;

-- 8.	Show the total amount of male patients and the total amount of female patients in the patients table.

select gender, count(*) as total from patients group by gender;

-- 9.	Show first and last name, allergies from patients which have allergies to either 'Penicillin' or 'Morphine'. Show results ordered ascending by allergies then by first_name then by last_name.

select first_name,last_name,allergies from patients where allergies like '%Penicillin%' or allergies like '%Morphine%' order by allergies,first_name,last_name;

-- 10.	Show first_name, last_name, and the total number of admissions attended for each doctor. Every admission has been attended by a doctor.

select d.first_name,d.last_name, count(*) as total_admissions
from admissions a
inner join doctors d on a.attending_doctor_id = d.doctor_id
group by d.first_name,d.last_name;

-- 11.	For every admission, display the patient's full name, their admission diagnosis, and their doctor's full name who diagnosed their problem.

select 
  concat(p.first_name, ' ', p.last_name) as patient_name,a.diagnosis,
  concat(d.first_name, ' ', d.last_name) as doctor_name
from admissions a
inner join patients p on a.patient_id = p.patient_id
inner join doctors d on a.attending_doctor_id = d.doctor_id;
