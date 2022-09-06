/* I. CREATE TABLES */

-- faculty (Khoa trong tr??ng)
create table faculty (
	id number primary key,
	name nvarchar2(30) not null
);

-- subject (M�n h?c)
create table subject(
	id number primary key,
	name nvarchar2(100) not null,
	lesson_quantity number(2,0) not null -- t?ng s? ti?t h?c
);

-- student (Sinh vi�n)
create table student (
	id number primary key,
	name nvarchar2(30) not null,
	gender nvarchar2(10) not null, --gi?i t�nh
	birthday date not null,
	hometown nvarchar2(100) not null, -- qu� qu�n
	scholarship number, -- h?c b?ng
	faculty_id number not null constraint faculty_id references faculty(id) -- m� khoa
);

-- exam management (B?ng ?i?m)
create table exam_management(
	id number primary key,
	student_id number not null constraint student_id references student(id),
	subject_id number not null constraint subject_id references subject(id),
	number_of_exam_taking number not null, --s? l?n thi (thi tr�n 1 l?n ???c g?i l� thi l?i) 
	mark number(4,2) not null -- ?i?m
);



/*================================================*/

/* II. INSERT SAMPLE DATA */

-- subject
insert into subject (id, name, lesson_quantity) values (1, n'C? s? d? li?u', 45);
insert into subject values (2, n'Tr� tu? nh�n t?o', 45);
insert into subject values (3, n'Truy?n tin', 45);
insert into subject values (4, n'?? h?a', 60);
insert into subject values (5, n'V?n ph?m', 45);
insert into subject values (6, n'H�a h?c', 40);
insert into subject values (7, n'To�n h?c', 37);


-- faculty
insert into faculty values (1, n'Anh - V?n');
insert into faculty values (2, n'Tin h?c');
insert into faculty values (3, n'Tri?t h?c');
insert into faculty values (4, n'V?t l�');

insert into faculty values (5, n'CNTT');


-- student
insert into student values (1, n'Nguy?n Th? H?i', n'N?', to_date('19900223', 'YYYYMMDD'), 'H� N?i', 130000, 2);
insert into student values (2, n'Tr?n V?n Ch�nh', n'Nam', to_date('19921224', 'YYYYMMDD'), 'B�nh ??nh', 150000, 4);
insert into student values (3, n'L� Thu Y?n', n'N?', to_date('19900221', 'YYYYMMDD'), 'TP HCM', 150000, 2);
insert into student values (4, n'L� H?i Y?n', n'N?', to_date('19900221', 'YYYYMMDD'), 'TP HCM', 170000, 2);
insert into student values (5, n'Tr?n Anh Tu?n', n'Nam', to_date('19901220', 'YYYYMMDD'), 'H� N?i', 180000, 1);
insert into student values (6, n'Tr?n Thanh Mai', n'N?', to_date('19910812', 'YYYYMMDD'), 'H?i Ph�ng', null, 3);
insert into student values (7, n'Tr?n Th? Thu Th?y', n'N?', to_date('19910102', 'YYYYMMDD'), 'H?i Ph�ng', 10000, 1);

insert into student values (8, n'Nguy?n Ho�ng Nam', n'Nam', to_date('19931220', 'YYYYMMDD'), 'H?i D??ng', 130000, 1);
insert into student values (9, n'V? V?n Minh', n'Nam', to_date('19921120', 'YYYYMMDD'), 'H� Nam', 160000, 1);
insert into student values (10, n'Phan Th? H??ng', n'N?', to_date('19940220', 'YYYYMMDD'), 'TP ?� N?ng', 140000, 2);


-- exam_management
insert into exam_management values (1, 1, 1, 1, 3);
insert into exam_management values (2, 1, 1, 2, 6);
insert into exam_management values (3, 1, 2, 2, 6);
insert into exam_management values (4, 1, 3, 1, 5);
insert into exam_management values (5, 2, 1, 1, 4.5);
insert into exam_management values (6, 2, 1, 2, 7);
insert into exam_management values (7, 2, 3, 1, 10);
insert into exam_management values (8, 2, 5, 1, 9);
insert into exam_management values (9, 3, 1, 1, 2);
insert into exam_management values (10, 3, 1, 2, 5);
insert into exam_management values (11, 3, 3, 1, 2.5);
insert into exam_management values (12, 3, 3, 2, 4);
insert into exam_management values (13, 4, 5, 2, 10);
insert into exam_management values (14, 5, 1, 1, 7);
insert into exam_management values (15, 5, 3, 1, 2.5);
insert into exam_management values (16, 5, 3, 2, 5);
insert into exam_management values (17, 6, 2, 1, 6);
insert into exam_management values (18, 6, 4, 1, 10);




--A Basic query
-- 1. Li?t k� danh s�ch sinh vi�n s?p x?p theo th? t?:
--      a. id t?ng d?n

select *
from student
ORDER BY id ASC

--      b. gi?i t�nh

select *
from student
ORDER BY gender

--      c.ng�y sinh T?NG D?N v� h?c b?ng GI?M D?N
SELECT *
FROM student
ORDER BY birthday ASC,scholarship DESC

-- 2. M�n h?c c� t�n b?t ??u b?ng ch? 'T'
SELECT *
FROM subject
WHERE name like'T%'

-- 3. Sinh vi�n c� ch? c�i cu?i c�ng trong t�n l� 'i'
select *
from student
where name like'%i'

-- 4. Nh?ng khoa c� k� t? th? hai c?a t�n khoa c� ch?a ch? 'n'
select *
from faculty
where name like'_n%'

-- 5. Sinh vi�n trong t�n c� t? 'Th?'
select *
from student
where name like'%Th?'

-- 6. Sinh vi�n c� k� t? ??u ti�n c?a t�n n?m trong kho?ng t? 'a' ??n 'm', s?p x?p theo h? t�n sinh vi�n
select *
from student
where name like N'[A-M]%'
ORDER BY name DESC--CH?A ???C


SELECT * FROM student
WHERE name between 'A' and 'M'
ORDER by name asc

-- 7. Sinh vi�n c� h?c b?ng l?n h?n 100000, s?p x?p theo m� khoa gi?m d?n
select *
from student
where scholarship>100000
ORDER BY faculty_id DESC

-- 8. Sinh vi�n c� h?c b?ng t? 150000 tr? l�n v� sinh ? H� N?i
select *
from student
where scholarship>=150000 and hometown=N'H� N?i'

-- 9. Nh?ng sinh vi�n c� ng�y sinh t? ng�y 01/01/1991 ??n ng�y 05/06/1992
select *
from student 
where birthday between '01-JAN-91' and '05-JUN-92'

-- 10. Nh?ng sinh vi�n c� h?c b?ng t? 80000 ??n 150000
select *
from student
where scholarship between 80000 and 150000

-- 11. Nh?ng m�n h?c c� s? ti?t l?n h?n 30 v� nh? h?n 45
select *
from subject
where lesson_quantity>30 and lesson_quantity<45

/********* B. CALCULATION QUERY *********/

-- 1. Cho bi?t th�ng tin v? m?c h?c b?ng c?a c�c sinh vi�n, g?m: M� sinh vi�n, Gi?i t�nh, M� 
		-- khoa, M?c h?c b?ng. Trong ?�, m?c h?c b?ng s? hi?n th? l� �H?c b?ng cao� n?u gi� tr? 
		-- c?a h?c b?ng l?n h?n 500,000 v� ng??c l?i hi?n th? l� �M?c trung b�nh�.
select id,name,gender,faculty_id,(case
when scholarship>100000 then N'H?c b?ng cao'
else N'M?c trung b�nh'
end)
from student

-- 2. T�nh t?ng s? sinh vi�n c?a to�n tr??ng
select Count(*) as "T?ng s? SV to�n tr??ng"
from student

-- 3. T�nh t?ng s? sinh vi�n nam v� t?ng s? sinh vi�n n?.
select *
from (select count(*) as "T?ng s? SV Nam" from student where gender=N'Nam'),
(select count(*) as "T?ng s? SV n?" from student where gender=N'N?')

-- 4. T�nh t?ng s? sinh vi�n t?ng khoa
select count(id) as "T?ng s? SV",faculty_id as "M� khoa"
from student
group by student.faculty_id

-- 5. T�nh t?ng s? sinh vi�n c?a t?ng m�n h?c
select Count(id) as "T?ng SV",subject_id as "M� M�n"
from exam_management
group by subject_id

-- 6. T�nh s? l??ng m�n h?c m� sinh vi�n ?� h?c
select Count(subject_id) as SoMonDaHoc
from exam_management   

-- 7. T?ng s? h?c b?ng c?a m?i khoa	
select Sum(scholarship) as TongHocBong
from student
group by faculty_id

-- 8. Cho bi?t h?c b?ng cao nh?t c?a m?i khoa
select Max(scholarship) as HocBongCaoNhat
from student
group by faculty_id

-- 9. Cho bi?t t?ng s? sinh vi�n nam v� t?ng s? sinh vi�n n? c?a m?i khoa
SELECT faculty_id as "M� khoa",  count(case gender when N'Nam'then 1 else 0 end) 
as"T?ng sinh vi�n nam" ,count(case gender when N'N?'then 1 else 0 end) as"T?ng sinh vi�n n?"
FROM student
group by faculty_id

-- 10. Cho bi?t s? l??ng sinh vi�n theo t?ng ?? tu?i
select Count(id),EXTRACT(YEAR FROM CURRENT_TIMESTAMP)-EXTRACT(YEAR FROM birthday) as "?? tu?i"
from student
group by EXTRACT(YEAR FROM CURRENT_TIMESTAMP)-EXTRACT(YEAR FROM birthday)
-- 11. Cho bi?t nh?ng n?i n�o c� �t nh?t 2 sinh vi�n ?ang theo h?c t?i tr??ng
select hometown
from student
group by hometown
having count(id)>=2

-- 12. Cho bi?t nh?ng sinh vi�n thi l?i �t nh?t 2 l?n
select student_id as "m� sv",subject_id as "m� m�n thi l?i 2 l?n",count(number_of_exam_taking) as "so lan thi lai"
from exam_management
group by student_id,subject_id
having count(number_of_exam_taking)>=2--------

-- 13. Cho bi?t nh?ng sinh vi�n nam c� ?i?m trung b�nh l?n 1 tr�n 7.0 
select student_id as "m� sv",sv.name as "T�n",number_of_exam_taking ,avg(mark) as "?i?m TB"
from exam_management ex,student sv
where ex.student_id=sv.id and number_of_exam_taking=1 and GENDER=N'Nam'
group by student_id,number_of_exam_taking,gender,name
HAVING avg(mark)>7.0

-- 14. Cho bi?t danh s�ch c�c sinh vi�n r?t �t nh?t 2 m�n ? l?n thi 1 (r?t m�n l� ?i?m thi c?a m�n kh�ng qu� 4 ?i?m)
select student_id as "m� sv",count(subject_id) as "S? m�n r?t"
from exam_management
where number_of_exam_taking=1 and mark<4
group by student_id
having count(subject_id)>=2

-- 15. Cho bi?t danh s�ch nh?ng khoa c� nhi?u h?n 2 sinh vi�n nam
select fa.name as "T�n",count(sv.id) as "S? SV"
from student sv,faculty fa
where sv.faculty_id=fa.id and gender=N'Nam'
group by faculty_id,fa.name
having count(sv.id)>2

-- 16. Cho bi?t nh?ng khoa c� 2 sinh vi�n ??t h?c b?ng t? 200000 ??n 300000
select fa.name as "T�n Khoa",count(sv.id) as "S? SV"
from student sv,faculty fa
where sv.faculty_id=fa.id and scholarship between 100000 and 200000
group by sv.faculty_id,fa.name
having count(sv.id)>=2

-- 17. Cho bi?t sinh vi�n n�o c� h?c b?ng cao nh?t
select *
from student
where scholarship =(select max(scholarship) from student)


/********* C. DATE/TIME QUERY *********/
-- 1. Sinh vi�n c� n?i sinh ? H� N?i v� sinh v�o th�ng 02
select *
from student
where hometown=N'H� N?i' and EXTRACT(MONTH FROM birthday)=2

-- 2. Sinh vi�n c� tu?i l?n h?n 20
select *
from student
where EXTRACT(YEAR FROM CURRENT_TIMESTAMP)-EXTRACT(YEAR FROM birthday)>30

-- 3. Sinh vi�n sinh v�o m�a xu�n n?m 1990
select *
from student
where EXTRACT(MONTH FROM birthday) in (1,2,3) and EXTRACT(YEAR FROM birthday)=1990


/********* D. JOIN QUERY *********/

-- 1. Danh s�ch c�c sinh vi�n c?a khoa ANH V?N v� khoa V?T L�
select *
from student sv inner join faculty fa on sv.faculty_id=fa.id
where fa.name LIKE N'Anh - V?n' or fa.name like N'V?t l�'



-- 2. Nh?ng sinh vi�n nam c?a khoa ANH V?N v� khoa TIN H?C
select sv.id,sv.name "T�n",sv.gender "Gi?i t�nh",fa.name "Khoa"
from student sv inner join faculty fa on sv.faculty_id=fa.id
where (fa.name LIKE N'Anh - V?n' or fa.name like N'Tin h?c') and gender=N'Nam' 

-- 3. Cho bi?t sinh vi�n n�o c� ?i?m thi l?n 1 m�n c? s? d? li?u cao nh?t

select sv.name,ex.subject_id as "M� m�n",ex.mark as "?i?m"
from student sv join exam_management ex on sv.id=ex.student_id join subject sb on sb.id=ex.subject_id
where number_of_exam_taking=1 and sb.name=N'C? s? d? li?u' and 
mark=(
select Max(ex.mark) 
from exam_management ex,subject sb 
where ex.subject_id=sb.id and sb.name=N'C? s? d? li?u' and ex.number_of_exam_taking=1
)


-- 4. Cho bi?t sinh vi�n khoa anh v?n c� tu?i l?n nh?t.


select sv.name "H? t�n sinh vi�n",birthday "Ng�y sinh",sv.faculty_id "M� khoa"
from student sv
where birthday=(
select min(birthday)
from student
where faculty_id='1'
)





-- 5. Cho bi?t khoa n�o c� ?�ng sinh vi�n nh?t

--select *
--from faculty fa,student sv
--where Max(count(sv.id)) 

select fa.name, count(*) as "So luong"
from faculty fa join student sv on fa.id=sv.faculty_id
group by fa.name
having count(fa.name)>=all(select count(sv.id)
from student
group by faculty_id)



-- 6. Cho bi?t khoa n�o c� ?�ng n? nh?t
select fa.name,count(*) as "So luong"
from faculty fa,student sv
where sv.faculty_id=fa.id and gender=N'N?'
group by fa.name
having count(fa.name)>=all(select count(sv.id)
from student
group by faculty_id)


-- 7. Cho bi?t nh?ng sinh vi�n ??t ?i?m cao nh?t trong t?ng m�n
--select sv.name as "T�n", sb.name as "M�n"
--from student sv,subject sb,exam_management ex
--where sv.id=ex.studetn_id
--group by ex.subject_id
--having count(subject_id)>=all(select Max(sv.mark)
--from exam_management
--)--sai

select exam_management.student_id,exam_management.subject_id,mark
from exam_management, (select exam_management.subject_id, max(mark) as maxdiem
from exam_management
group by exam_management.subject_id) a
where exam_management.subject_id=a.subject_id and mark=a.maxdiem


-- 8. Cho bi?t nh?ng khoa kh�ng c� sinh vi�n h?c

select *
from faculty
where not exists (select distinct faculty_id
from exam_management ex join student sv on ex.student_id=sv.id where  sv.faculty_id=faculty.id)



-- 9. Cho bi?t sinh vi�n ch?a thi m�n c? s? d? li?u
select *
FROM student
where not exists
(select distinct*
from exam_management
where subject_id = '1' and student_id = student.id)



-- 10. Cho bi?t sinh vi�n n�o kh�ng thi l?n 1 m� c� d? thi l?n 2
select student_id,sv.name
from exam_management ex join student sv on ex.student_id=sv.id
where number_of_exam_taking=2 and not exists
(select*
from exam_management
where number_of_exam_taking=1 and student_id=ex.student_id)



