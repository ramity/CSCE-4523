/*
For each expense type, determine the total expense amount. The output should
show the expense type and the corresponding total amount. Print the result in
ascending order of amount.
*/

SELECT Type, SUM(Amount)
FROM Expense
GROUP BY Type
ORDER BY SUM(Amount) ASC;

/*
Show the total number of trips approved for employees of each department. If
none of the employees of a department have any approved trip, the department
information should not appear in the result. Your output should show the
department names and total number of trips.
*/

SELECT D.Name, COUNT(T.Emp_ID)
FROM Employee E
JOIN Trip T
ON T.Emp_ID = E.ID
JOIN Dept D
ON D.Code = E.Dept
GROUP BY D.Name
ORDER BY D.Name ASC;

/*
Query the Trip table to show the number of distinct days when both a departure
and a return occur.  Note: They need not be for the same trip.
*/

SELECT DISTINCT T1.Dep_date, COUNT(T2.Return_date)
FROM Trip T1
JOIN Trip T2
ON T1.Dep_date = T2.Return_date
GROUP BY T1.Dep_date;

/*
For each approved trip, show the corresponding employee name, departure date,
name of the city the employee visited, and the receipt submission date (if
receipt has been submitted).
*/

/* QUESTION: Are we required to conditionally show the row if THERE IS NOT a receipt submission date? */

/* NO: */

SELECT Em.Name, T.Dep_date, T.To_City, Ex.Submitted
FROM Trip T
LEFT JOIN Expense Ex
ON Ex.Trip_ID = T.ID
JOIN Employee Em
ON Em.ID = T.Emp_ID
ORDER BY Em.Name ASC;

/* YES: */

SELECT Em.Name, T.Dep_date, T.To_City, Ex.Submitted
FROM Trip T
LEFT JOIN Expense Ex
ON Ex.Trip_ID = T.ID
JOIN Employee Em
ON Em.ID = T.Emp_ID
WHERE Ex.Submitted IS NOT NULL
ORDER BY Em.Name ASC;

/*
Find out the trips for which the estimated cost is less than the actual expense
and print those two costs along with the corresponding trip id.
*/

Select T.ID, T.Est_Cost, E.Amount
FROM Trip T
LEFT JOIN Expense E
ON E.Trip_ID = T.ID
WHERE E.Amount > T.Est_Cost
ORDER BY T.ID ASC;
