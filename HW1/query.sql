CREATE TABLE Dept (
    Code        Char(5)         Primary Key,
    Name        Char(10)        NOT NULL,
    Phone       Char(8)         NOT NULL,
    Contact     Char(15)
);

CREATE TABLE Employee (
    ID          Integer         Primary Key,
    Name        Char(15)        NOT NULL,
    Dept                        NOT NULL    REFERENCES Dept (Code),
    Join_date   Date
);

CREATE TABLE Trip (
    ID          Integer         Primary Key,
    Emp_ID      Integer         References Employee (ID),
    To_City     Char(15),
    Dep_Date    Date            NOT NULL,
    Return_Date Date            NOT NULL,
    Est_Cost    Decimal(6, 2)   NOT NULL    CHECK (Est_Cost >= 1 AND Est_Cost <= 4000)
);

/* Assumption: Each trip ID associated with one employee only. */

CREATE TABLE Expense (
    Trip_ID     Integer         References TRIP (ID),
    Receipt_No  Integer,
    Amount      Decimal(6, 2)   NOT NULL    CHECK (Amount >= 1),
    Type        Char(2)         CHECK (Type in ('T', 'H', 'M')),
    Submitted   Date,

    PRIMARY KEY (Trip_ID, Receipt_No)
);


INSERT INTO Dept (Code, Name, Phone, Contact) VALUES('AAAAA', 'A PLACE', '1231234', 'ALEX ANDREWS');
INSERT INTO Dept (Code, Name, Phone, Contact) VALUES('BBBBB', 'B PLACE', '1231234', 'BOBA ANDREWS');
INSERT INTO Dept (Code, Name, Phone, Contact) VALUES('CCCCC', 'C PLACE', '1231234', 'CILA ANDREWS');
INSERT INTO Dept (Code, Name, Phone, Contact) VALUES('DDDDD', 'D PLACE', '1231234', 'DOUG ANDREWS');
INSERT INTO Dept (Code, Name, Phone, Contact) VALUES('EEEEE', 'E PLACE', '1231234', 'ELEX ANDREWS');
INSERT INTO Dept (Code, Name, Phone, Contact) VALUES('FFFFF', 'F PLACE', '1231234', 'FRED ANDREWS');
INSERT INTO Dept (Code, Name, Phone, Contact) VALUES('GGGGG', 'G PLACE', '1231234', 'GREG ANDREWS');
INSERT INTO Dept (Code, Name, Phone, Contact) VALUES('HHHHH', 'H PLACE', '1231234', 'HOLY ANDREWS');
INSERT INTO Dept (Code, Name, Phone, Contact) VALUES('IIIII', 'I PLACE', '1231234', 'ILES ANDREWS');
INSERT INTO Dept (Code, Name, Phone, Contact) VALUES('JJJJJ', 'J PLACE', '1231234', 'JIMM ANDREWS');

INSERT INTO Employee (ID, Name, Dept, Join_date) VALUES(1, 'ALEX', 'AAAAA', '01-JAN-18');
INSERT INTO Employee (ID, Name, Dept, Join_date) VALUES(2, 'BOBA', 'BBBBB', '02-JAN-18');
INSERT INTO Employee (ID, Name, Dept, Join_date) VALUES(3, 'CILA', 'CCCCC', '03-JAN-18');
INSERT INTO Employee (ID, Name, Dept, Join_date) VALUES(4, 'DOUG', 'DDDDD', '04-JAN-18');
INSERT INTO Employee (ID, Name, Dept, Join_date) VALUES(5, 'ELEX', 'EEEEE', '05-JAN-18');
INSERT INTO Employee (ID, Name, Dept, Join_date) VALUES(6, 'FRED', 'FFFFF', '06-JAN-18');
INSERT INTO Employee (ID, Name, Dept, Join_date) VALUES(7, 'GREG', 'GGGGG', '07-JAN-18');
INSERT INTO Employee (ID, Name, Dept, Join_date) VALUES(8, 'HOLY', 'HHHHH', '08-JAN-18');
INSERT INTO Employee (ID, Name, Dept, Join_date) VALUES(9, 'ILES', 'IIIII', '09-JAN-18');
INSERT INTO Employee (ID, Name, Dept, Join_date) VALUES(10, 'JIMM', 'JJJJJ', '10-JAN-18');

INSERT INTO Trip (ID, Emp_ID, To_City, Dep_Date, Return_Date, Est_Cost) VALUES(1, 1, 'TEST CITY', '01-JAN-18', '03-JAN-18', 100);
INSERT INTO Trip (ID, Emp_ID, To_City, Dep_Date, Return_Date, Est_Cost) VALUES(2, 1, 'TEST CITY', '02-JAN-18', '04-JAN-18', 200);
INSERT INTO Trip (ID, Emp_ID, To_City, Dep_Date, Return_Date, Est_Cost) VALUES(3, 3, 'TEST CITY', '03-JAN-18', '05-JAN-18', 300);
INSERT INTO Trip (ID, Emp_ID, To_City, Dep_Date, Return_Date, Est_Cost) VALUES(4, 4, 'TEST CITY', '04-JAN-18', '06-JAN-18', 400);
INSERT INTO Trip (ID, Emp_ID, To_City, Dep_Date, Return_Date, Est_Cost) VALUES(5, 5, 'TEST CITY', '05-JAN-18', '07-JAN-18', 500);
INSERT INTO Trip (ID, Emp_ID, To_City, Dep_Date, Return_Date, Est_Cost) VALUES(6, 6, 'TEST CITY', '06-JAN-18', '10-JAN-18', 600);
INSERT INTO Trip (ID, Emp_ID, To_City, Dep_Date, Return_Date, Est_Cost) VALUES(7, 7, 'TEST CITY', '07-JAN-18', '12-JAN-18', 700);
INSERT INTO Trip (ID, Emp_ID, To_City, Dep_Date, Return_Date, Est_Cost) VALUES(8, 8, 'TEST CITY', '08-JAN-18', '21-JAN-18', 800);
INSERT INTO Trip (ID, Emp_ID, To_City, Dep_Date, Return_Date, Est_Cost) VALUES(9, 9, 'TEST CITY', '09-JAN-18', '20-JAN-18', 900);
INSERT INTO Trip (ID, Emp_ID, To_City, Dep_Date, Return_Date, Est_Cost) VALUES(10, 10, 'TEST CITY', '10-JAN-18', '15-JAN-18', 3750);

INSERT INTO Expense (Trip_ID, Receipt_No, Amount, Type, Submitted) VALUES(1, 152345, 100.01, 'T', '01-JAN-18');
INSERT INTO Expense (Trip_ID, Receipt_No, Amount, Type, Submitted) VALUES(2, 329846, 200.01, 'H', '01-JAN-18');
INSERT INTO Expense (Trip_ID, Receipt_No, Amount, Type, Submitted) VALUES(3, 428732, 300.01, 'M', '01-JAN-18');
INSERT INTO Expense (Trip_ID, Receipt_No, Amount, Type, Submitted) VALUES(4, 234807, 400.01, 'T', '01-JAN-18');
INSERT INTO Expense (Trip_ID, Receipt_No, Amount, Type, Submitted) VALUES(5, 109472, 500.01, 'H', '01-JAN-18');
INSERT INTO Expense (Trip_ID, Receipt_No, Amount, Type, Submitted) VALUES(6, 239846, 600.01, 'M', '01-JAN-18');
INSERT INTO Expense (Trip_ID, Receipt_No, Amount, Type, Submitted) VALUES(7, 348971, 700.01, 'T', '01-JAN-18');
INSERT INTO Expense (Trip_ID, Receipt_No, Amount, Type, Submitted) VALUES(8, 520897, 800.01, 'H', '01-JAN-18');
INSERT INTO Expense (Trip_ID, Receipt_No, Amount, Type, Submitted) VALUES(9, 104927, 900.01, 'M', '01-JAN-18');
INSERT INTO Expense (Trip_ID, Receipt_No, Amount, Type, Submitted) VALUES(10, 421308, 1000.01, 'T', '01-JAN-18');
