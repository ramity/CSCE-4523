/*
Find the trips for which the departure date is a Friday.
For each such trip, print the corresponding employee name,
day of departure and day of return both spelled out completely,
and number of days between the departure and return.
*/

SELECT E.Name, T.Dep_date, T.Return_date, (T.Return_date - T.Dep_date)
FROM Trip T
JOIN Employee E
ON T.Emp_ID = E.ID
WHERE TO_CHAR(TO_DATE(T.Dep_date, 'dd/mm/yyyy'), 'DAY') = 'Friday'
GROUP BY T.Dep_date;

/*
Determine and print the total number of employees who returned
from a trip during the last weekend.
*/

/*
For all the receipts that were submitted in 2017, print the total
amount for each expense type.  The expense type must be spelled out
rather than printing "T" or "H" or "M".  That is, print the total
"Transportation" cost, total "Hotel" cost, and total "Meals" cost
incurred in 2017.
*/

/*
For every employee show the total number of trips he/she has taken.
The output must show employee names and corresponding number of
trips. If an employee has not taken any trip, print the employee's
name and 0 (zero) next to his name.
*/

/*
Assume that receipts are due within 10 days of completion of a trip.
For example, if an employee returned from a trip on March 17, 2018,
he/she must submit the receipts by March 27, 2018.  Create a view
titled "Defaulters" that shows the employee name, the return date,
and the number of days it has been since the return date for each
employee that has violated the receipt submission policy.
*/
