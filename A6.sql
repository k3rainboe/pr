

delimiter //
CREATE PROCEDURE mycursr()
BEGIN
	DECLARE done INT DEFAULT FALSE;
	DECLARE  c_rollno int;
	DECLARE  c_name varchar(20);
	DECLARE  C_Student CURSOR  
	for SELECT rollno,name FROM old_RC where rollno not in(select rollno from new_RC);

	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

	BEGIN
		OPEN C_Student;
   		read_loop:LOOP
   			FETCH C_Student into c_rollno, c_name;   
    
   			IF done THEN
    	  		LEAVE read_loop;
   			END IF;           
    
    	  	insert into new_RC values(c_rollno, c_name);
   		END LOOP;
   		CLOSE C_Student;
	END;
END;
//
delimiter ;

/*Output:
mysql> use accent58;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> create table old_RC(rollno int, name varchar(30));
Query OK, 0 rows affected (0.34 sec)

mysql> insert into old_RC values(1,"Rohan"),(3,"Meena"),(5,"Priya"),(10,"Vijay");
Query OK, 4 rows affected (0.04 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> select * from old_RC;
+--------+-------+
| rollno | name  |
+--------+-------+
|      1 | Rohan |
|      3 | Meena |
|      5 | Priya |
|     10 | Vijay |
+--------+-------+
4 rows in set (0.01 sec)

mysql> create table new_RC(rollno int,name varchar(30));
Query OK, 0 rows affected (0.28 sec)

mysql> insert into new_RC values(3,"Meena"),(7,"Preeti"),(10,"Vijay"),(12,"Mohit");
Query OK, 4 rows affected (0.06 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> select * from new_RC;
+--------+--------+
| rollno | name   |
+--------+--------+
|      3 | Meena  |
|      7 | Preeti |
|     10 | Vijay  |
|     12 | Mohit  |
+--------+--------+
4 rows in set (0.00 sec)

mysql> source cursor.sql;
Query OK, 0 rows affected (0.00 sec)

mysql> call mycursor();
Query OK, 0 rows affected (0.10 sec)

mysql> select * from old_RC;
+--------+-------+
| rollno | name  |
+--------+-------+
|      1 | Rohan |
|      3 | Meena |
|      5 | Priya |
|     10 | Vijay |
+--------+-------+
4 rows in set (0.00 sec)

mysql> select * from new_RC;
+--------+--------+
| rollno | name   |
+--------+--------+
|      3 | Meena  |
|      7 | Preeti |
|     10 | Vijay  |
|     12 | Mohit  |
|      1 | Rohan  |
|      5 | Priya  |
+--------+--------+
6 rows in set (0.00 sec)

mysql> 
*/





