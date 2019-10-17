/*
Database Trigger (All Types: Row level and Statement level triggers, Before and After
Triggers). Write a database trigger on Library table. The System should keep track of the
records that are being updated or deleted. The old value of updated or deleted records should
be added in Library_Audit table.

Name:Arpita Anil Devargaonkar.
RollNo:34
Class:TE_A

*/

//Code For Triggers

drop trigger if exists Make_audit;
delimiter //
CREATE TRIGGER Make_audit
  AFTER UPDATE ON lib_book
  FOR EACH ROW
BEGIN
  INSERT INTO lib_Audit (bid, bname, qty)
  VALUES (OLD.bid, OLD.bname,OLD.qty);
END;
//
delimiter ;


show tables;
+----------------+
| Tables_in_mydb |
+----------------+
| A |
| B |
| account |
| borower |
| borowerr |
| borrower |
| borrower01 |
| borrower2 |
| borrower3 |
| fine |
| lib_Audit |
| lib_book |
| loan |
| new_table |
| old_table |
| result |
| stud_marks |
+----------------+
17 rows in set (0.00 sec)

mysql> select * from lib_Audit;
+-----+-------+------+
| bid | bname | qty |
+-----+-------+------+
| 1 | c++ | 50 |
+-----+-------+------+
1 row in set (0.00 sec)

mysql> select * from lib_book;
+-----+-------+------+
| bid | bname | qty |
+-----+-------+------+
| 1 | c++ | 150 |
+-----+-------+------+
1 row in set (0.01 sec)

mysql> delete from lib_Audit;
Query OK, 1 row affected (0.05 sec)

mysql> select * from lib_Audit;
Empty set (0.00 sec)

mysql> select * from lib_book;
+-----+-------+------+
| bid | bname | qty |
+-----+-------+------+
| 1 | c++ | 150 |
+-----+-------+------+
1 row in set (0.00 sec)

mysql> insert into lib_book values(2,'dbms',100);
Query OK, 1 row affected (0.05 sec)

mysql> select * from lib_book;
+-----+-------+------+
| bid | bname | qty |
+-----+-------+------+
| 1 | c++ | 150 |
| 2 | dbms | 100 |
+-----+-------+------+
2 rows in set (0.00 sec)

mysql> source pr8_1.sql;
Query OK, 0 rows affected (0.06 sec)

Query OK, 0 rows affected (0.06 sec)

mysql> update lib_book set qty=80 where bid=2;
Query OK, 1 row affected (0.06 sec)
Rows matched: 1 Changed: 1 Warnings: 0

mysql> select * from lib_book;
+-----+-------+------+
| bid | bname | qty |
+-----+-------+------+
| 1 | c++ | 150 |
| 2 | dbms | 80 |
+-----+-------+------+
2 rows in set (0.00 sec)

mysql> select * from lib_Audit;
+-----+-------+------+
| bid | bname | qty |
+-----+-------+------+
| 2 | dbms | 100 |
+-----+-------+------+
1 row in set (0.00 sec)

mysql> source pr8_2.sql;
Query OK, 0 rows affected (0.04 sec)

mysql> source pr8_2.sql;
Query OK, 0 rows affected, 1 warning (0.00 sec)

mysql> source pr8_2.sql;
Query OK, 0 rows affected (0.01 sec)

Query OK, 0 rows affected (0.08 sec)

mysql> select * from lib_Audit;
+-----+-------+------+
| bid | bname | qty |
+-----+-------+------+
| 2 | dbms | 100 |
+-----+-------+------+
1 row in set (0.00 sec)

mysql> select * from lib_book;
+-----+-------+------+
| bid | bname | qty |
+-----+-------+------+
| 1 | c++ | 150 |
| 2 | dbms | 80 |
+-----+-------+------+
2 rows in set (0.00 sec)

mysql> delete from lib_book where bid=1;
Query OK, 1 row affected (0.06 sec)

mysql> select * from lib_book;
+-----+-------+------+
| bid | bname | qty |
+-----+-------+------+
| 2 | dbms | 80 |
+-----+-------+------+
1 row in set (0.00 sec)

mysql> select * from lib_Audit;
+-----+-------+------+
| bid | bname | qty |
+-----+-------+------+
| 1 | c++ | 150 |
| 2 | dbms | 100 |
+-----+-------+------+
2 rows in set (0.00 sec)


