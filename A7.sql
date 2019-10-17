
//Code for Cursor:
drop procedure if exists p_grade;

    delimiter //
    create procedure p_grade()
    begin

	DECLARE done INT DEFAULT FALSE;

        declare s_marks int;
        declare s_rollno int;
        declare s_name varchar(30);
        declare s_class varchar(80);
        declare s_student cursor For Select  rollno, name, marks from stud_marks;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

         open s_student;
	
	 read_loop: LOOP
        	  fetch s_student  into s_rollno,s_name,s_marks;

	IF done THEN
	      LEAVE read_loop;
	END IF;

         if(s_marks<=1500 and s_marks>=990) then
	         set s_class='Distinction';

        elseif(s_marks<=989 and s_marks>=900) then
        	 set s_class='First Class';
        
        elseif (s_marks<=899 and s_marks>=825) then
            set s_class='Higher Second Class';

	else
	 set s_class='Pass';

	end if;
	 insert into result(rollno,name,class) values(s_rollno,s_name,s_class);

  END LOOP;
         close s_student;
         end;
//

delimiter ;

mysql> create table stud_marks(rollno int, name varchar(20), marks int);
Query OK, 0 rows affected (0.30 sec)

mysql> create table result(rollno int, name varchar(20),class varchar(20));
Query OK, 0 rows affected (0.31 sec)

mysql> insert into stud_marks values(1,'kalpesh',1200);
Query OK, 1 row affected (0.05 sec)

mysql> insert into stud_marks values(2,'ariza',980);
Query OK, 1 row affected (0.04 sec)

mysql> insert into stud_marks values(3,'ajinkya',890);
Query OK, 1 row affected (0.05 sec)

mysql> insert into stud_marks values(4,'abc',800);
Query OK, 1 row affected (0.05 sec)

mysql> select * from stud_marks;
+--------+---------+-------+
| rollno | name | marks |
+--------+---------+-------+
| 1 | kalpesh 	| 1200 |
| 2 | ariza 	| 980 |
| 3 | ajinkya 	| 890 |
| 4 | abc 	| 800 |
+--------+---------+-------+
4 rows in set (0.00 sec)

mysql> select * from result;
Empty set (0.00 sec)

mysql> source curs.sql;
Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

mysql> call p_grade();
Query OK, 0 rows affected (0.25 sec)

mysql> select * from result;
+--------+---------+---------------------+
| rollno | name | class |
+--------+---------+---------------------+
| 1 | kalpesh 	| Distinction |
| 2 | ariza 	| First Class |
| 3 | ajinkya 	| Higher Second Class |
| 4 | abc 	| Pass |
+--------+---------+---------------------+
4 rows in set (0.00 sec)


