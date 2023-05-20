CREATE TABLE Patient (

Patient_ID INT NOT NULL,
Patient_Name VARCHAR(100),
Patient_Age INT,
Patient_Address VARCHAR(100),
Patient_Gender VARCHAR(100),
Disease VARCHAR(100)
);

Alter Table Patient
Add doctor_ID INT NOT NULL

Alter Table Patient
Drop column Patient_Gender;

Alter table Patient
Add constraint Patient_PK
Primary Key (Patient_ID);

CREATE TABLE Doctor (

Doctor_ID INT NOT NULL,
Doctor_Name VARCHAR(100),
Doctor_Age INT,
Doctor_Address VARCHAR(100),
Patient_Gender VARCHAR(100),

Constraint Doctor_PK Primary Key (Doctor_ID)
);

Alter Table Doctor
Add Doctor_Gender VARCHAR(100);

Alter Table Doctor
Drop column Patient_Gender;

CREATE TABLE Room(
Room_number VARCHAR(50) NOT NULL,
Room_Type VARCHAR(100),
Room_Status VARCHAR(100),

Constraint Room_PK Primary Key (Room_number)
);


Alter Table Patient
Add constraint Patient_Doc_FK
Foreign Key (Doctor_ID) references Doctor (Doctor_ID);

Create Table Check_IN_OUT(
Patient_ID INT NOT NULL,
Room_number VARCHAR(50),
Join_date datetime,
Leave_date datetime,

constraint Patient_IN_FK
Foreign Key (Patient_ID) references Patient (Patient_ID),

constraint Room_IN_FK
Foreign Key (Room_number) references Room (Room_number)

);


Insert Into Doctor
values(1,'Philip', 35, 'Sao Paulo','male'),
(2,'Antonio', 30, 'Sao Paulo','male'),
(3,'Marisa', 55, 'Sao Paulo','female'),
(4,'Viviane', 32, 'Sao Paulo','female'),
(5,'Renato', 35, 'Sao Paulo','male');


Insert into Patient Values
(1,'Pedro',38,'Ipiranga','Bald',3),
(2,'Andre',29,'Ipiranga','flu',5),
(3,'Thiago',18,'Itaim','covid',4),
(4,'Bruno',55,'Morumbi','Liver stuff',2),
(5,'Wesley',48,'Butanta','covid',1);

Insert into Room Values
(1,'premium','empty'),
(2,'Suite','reserved'),
(3,'sharing room','empty'),
(4,'premium','reserved'),
(5,'Day care','reserved'),
(6,'premium','empty');

Insert into Check_IN_OUT Values
(2,2,'2023 - 05 - 17','' ),
(4,2,'2023 - 05 - 01','2023 - 05 - 17' ),
(1,5,'2023 - 05 - 17','' ),
(5,4,'2023 - 05 - 17','' );

UPDATE Check_IN_OUT
SET Leave_date = CASE WHEN Leave_date = '' Then NULL ELSE Leave_date END;


select *
from Doctor

select *
from Doctor
where Doctor_Age = 35


select Doctor_Name
from Doctor
where Doctor_Age = 35

Select Patient_Name, Disease, Doctor_Name
From Patient,Doctor
where Patient.Patient_ID = Doctor.Doctor_ID

Select Patient_Name,Patient.Disease, 
		Room.Room_number, 
		Check_IN_OUT.Join_date, 
		Check_IN_OUT.Leave_date
From Patient, Check_IN_OUT, Room
Where Patient.Patient_ID = Check_IN_OUT.Patient_ID 
	and Check_IN_OUT.Room_number = Room.Room_number 
	and Check_IN_OUT.Leave_date != ''



Select Patient.Patient_Name
	,Patient.Patient_ID
	,Doctor.Doctor_Name
	,Patient.Disease
	,Doctor.Doctor_Age
from Patient,Doctor
Where Patient.doctor_ID = Doctor.Doctor_ID 
	and Doctor.Doctor_Age > 30;


Select Patient.Patient_ID
	,Patient.Patient_Name
	,Patient.Disease
	,Check_IN_OUT.Join_date
	,Check_IN_OUT.Leave_date
	,Room.Room_number
	,Room.Room_Type
From Patient,Room,Check_IN_OUT
Where Patient.Patient_ID = Check_IN_OUT.Patient_ID
	and Check_IN_OUT.Patient_ID = Room.Room_number

Order by Patient.Patient_ID