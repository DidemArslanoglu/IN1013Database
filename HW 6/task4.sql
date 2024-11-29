-- 1
SELECT DISTINCT rb.cust_name
FROM restBill rb
WHERE rb.bill_total > 450.00
AND rb.waiter_no IN (
    SELECT rs.staff_no
    FROM restStaff rs
    WHERE rs.headwaiter = (
        SELECT staff_no
        FROM restStaff
        WHERE first_name = 'Charles'
    )
);

-- 2
SELECT rs.first_name, rs.surname
FROM restStaff rs
WHERE rs.staff_no = (
    SELECT headwaiter
    FROM restRoom_management rm
    WHERE rm.room_name = (
        SELECT rt.room_name
        FROM restRest_table rt
        JOIN restBill rb ON rt.table_no = rb.table_no
        WHERE rb.cust_name = 'Nerida Smith' AND rb.bill_date = 160111
    )
    AND rm.room_date = 160111
);

-- 3
SELECT rb.cust_name
FROM restBill rb
WHERE rb.bill_total = (SELECT MIN(bill_total) FROM restBill);

-- 4
SELECT rs.first_name, rs.surname
FROM restStaff rs
WHERE rs.staff_no NOT IN (SELECT DISTINCT waiter_no FROM restBill);

-- 5
SELECT rb.cust_name, rs.first_name AS headwaiter_first_name, rs.surname AS headwaiter_surname, rm.room_name
FROM restBill rb
JOIN restRest_table rt ON rb.table_no = rt.table_no
JOIN restRoom_management rm ON rt.room_name = rm.room_name AND rb.bill_date = rm.room_date
JOIN restStaff rs ON rm.headwaiter = rs.staff_no
WHERE rb.bill_total = (SELECT MAX(bill_total) FROM restBill);