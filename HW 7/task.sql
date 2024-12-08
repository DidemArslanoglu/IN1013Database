-- 1
CREATE VIEW samsBills AS
SELECT rs.first_name, rs.surname, rb.bill_date, rb.cust_name, rb.bill_total
FROM restBill rb
JOIN restStaff rs ON rb.waiter_no = rs.staff_no
WHERE rs.first_name = 'Sam' AND rs.surname = 'Pitt';

-- 2
SELECT * 
FROM samsBills
WHERE bill_total > 400;

-- 3
CREATE VIEW roomTotals AS
SELECT rm.room_name, SUM(rb.bill_total) AS total_sum
FROM restRoom_management rm
JOIN restBill rb ON rm.room_date = rb.bill_date
JOIN restRest_table rt ON rb.table_no = rt.table_no
GROUP BY rm.room_name;

-- 4
CREATE VIEW teamTotals AS
SELECT CONCAT(rs_head.first_name, ' ', rs_head.surname) AS headwaiter_name, 
       SUM(rb.bill_total) AS total_sum
FROM restRoom_management rm
JOIN restStaff rs_head ON rm.headwaiter = rs_head.staff_no
JOIN restBill rb ON rb.waiter_no = rm.headwaiter
GROUP BY rs_head.first_name, rs_head.surname;