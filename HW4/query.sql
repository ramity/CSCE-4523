/*
Find the trips for which the departure date is a Friday.
For each such trip, print the corresponding employee name,
day of departure and day of return both spelled out completely,
and number of days between the departure and return.
*/

SELECT E.Name, TO_CHAR(T.Dep_date, 'DAY') as Day_Left, TO_CHAR(T.Return_date, 'DAY') as Day_Returned, (T.Return_date - T.Dep_date) as Days_Gone
FROM Trip T
JOIN Employee E
ON T.Emp_ID = E.ID
WHERE TO_CHAR(T.Dep_date, 'D') = 6
ORDER BY T.Dep_date;

/*
Determine and print the total number of employees who returned
from a trip during the last weekend.
*/

SELECT COUNT(E.ID) as Staff_Returned_Last_Weekend
FROM Trip T
JOIN Employee E
ON T.Emp_ID = E.ID
WHERE
T.Return_Date >= (SYSDATE - 7)
AND
(
  TO_CHAR(T.Return_Date, 'D') = 1
  OR
  TO_CHAR(T.Return_Date, 'D') = 7
);

/*
For all the receipts that were submitted in 2017, print the total
amount for each expense type.  The expense type must be spelled out
rather than printing "T" or "H" or "M".  That is, print the total
"Transportation" cost, total "Hotel" cost, and total "Meals" cost
incurred in 2017.
*/

SELECT
  CASE E.Type
    WHEN 'T' THEN 'Transportation'
    WHEN 'H' THEN 'Hotel'
    WHEN 'M' THEN 'Meals'
  END as Expense_Type,
  SUM(E.Amount) as Total
FROM Expense E
WHERE TO_CHAR(E.Submitted, 'YYYY') = 2017
GROUP BY E.Type;

/*
For every employee show the total number of trips he/she has taken.
The output must show employee names and corresponding number of
trips. If an employee has not taken any trip, print the employee's
name and 0 (zero) next to his name.
*/

SELECT E.Name, COUNT(T.ID) as Trip_Count
FROM Employee E
LEFT JOIN Trip T
ON E.ID = T.Emp_ID
GROUP BY E.Name;

/*
Assume that receipts are due within 10 days of completion of a trip.
For example, if an employee returned from a trip on March 17, 2018,
he/she must submit the receipts by March 27, 2018.  Create a view
titled "Defaulters" that shows the employee name, the return date,
and the number of days it has been since the return date for each
employee that has violated the receipt submission policy.
*/

CREATE VIEW Defaulters AS
SELECT Em.Name, T.Return_Date,
  (CASE
    WHEN Ex.Submitted IS NULL THEN TRUNC(SYSDATE - T.Return_Date)
    ELSE TRUNC(Ex.Submitted - T.Return_Date)
  END) as Days_Defaulted
FROM Trip T
JOIN Expense Ex
ON T.ID = Ex.Trip_ID
JOIN Employee Em
ON T.Emp_ID = Em.ID
WHERE Ex.Submitted > (T.Return_Date + 10)
OR
(
  Ex.Submitted IS NULL
  AND
  SYSDATE - T.Return_Date  > 10
);

SELECT * FROM Defaulters;
