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

/* Try and get rid of subqueries before submission */

SELECT DISTINCT D.Name, (SELECT COUNT(*) FROM Trip T WHERE T.Emp_ID = E.ID) FROM Dept D
LEFT JOIN Employee E
ON E.Dept = D.Code
LEFT JOIN Trip T
ON T.Emp_ID = E.ID
WHERE (SELECT COUNT(*) FROM Trip T WHERE T.Emp_ID = E.ID) > 0
ORDER BY D.Name ASC;

/*
Query the Trip table to show the number of distinct days when both a departure
and a return occur.  Note: They need not be for the same trip.
*/

/* Try and get rid of subqueries before submission */

SELECT DISTINCT T1.Dep_date, (SELECT COUNT(T2.Return_date) FROM Trip T2 WHERE T2.Return_date = T1.Dep_date)
FROM Trip T1
WHERE (SELECT COUNT(T2.Return_date) FROM Trip T2 WHERE T2.Return_date = T1.Dep_date) > 0;

/*
For each approved trip, show the corresponding employee name, departure date,
name of the city the employee visited, and the receipt submission date (if
receipt has been submitted).
*/

/* Try and get rid of subqueries before submission */

SELECT
(SELECT E.Name FROM Employee E WHERE E.ID = T.Emp_ID),
T.Dep_date,
T.To_City,
(SELECT Ex.Submitted FROM Expense Ex WHERE Ex.Trip_ID = T.ID)
FROM Trip T
WHERE (SELECT Ex.Submitted FROM Expense Ex WHERE Ex.Trip_ID = T.ID) IS NOT NULL;

/*
Find out the trips for which the estimated cost is less than the actual expense
and print those two costs along with the corresponding trip id.
*/

/* Try and get rid of subqueries before submission */

SELECT
T.ID,
T.Est_Cost,
(SELECT E.Amount FROM Expense E WHERE E.Trip_ID = T.ID)
FROM Trip T
WHERE (SELECT E.Amount FROM Expense E WHERE E.Trip_ID = T.ID) > T.Est_Cost;
