SET serveroutput on;

ACCEPT Emp_ID NUMBER PROMPT "Enter value for employee ID:  ";
ACCEPT To_City CHAR PROMPT "Enter value for the destination city:  ";
ACCEPT Dep_Date DATE PROMPT "Enter value for the departure date:  ";
ACCEPT Return_Date DATE PROMPT "Enter value for the return date:  ";
ACCEPT Est_Cost NUMBER PROMPT "Enter value for the estimated cost:  ";

DECLARE

    employeeCount number := 0;
    maxID number;

BEGIN

    SELECT COUNT(id) INTO employeeCount FROM employee WHERE ID = &Emp_ID;

    IF employeeCount = 0 THEN

        dbms_output.put_line('The inputted employee does not exist');

    ELSIF TO_DATE('&Dep_Date') > TO_DATE('&Return_Date') THEN

        dbms_output.put_line('The departure date happens after the return date');

    ELSIF &Est_Cost < 1 OR &Est_Cost > 4000 THEN

        dbms_output.put_line('The estimated cost is less than 1 or greater than 4000');

    ELSE

        SELECT MAX(ID) INTO maxID FROM TRIP;

        INSERT INTO Trip VALUES (maxID + 1, &Emp_ID, '&To_City', '&Dep_Date', '&Return_Date', &Est_Cost);

        dbms_output.put_line('Query inserted successfully');

    END IF;

END;

/
