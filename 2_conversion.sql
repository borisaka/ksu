/*
У нас есть 6 первых платежей от разных юзеров
(на самом деле 8 но 2 - от юзеров из прошлого)
Из этих 6 юзеров - 3 совершили больше 1 платежа.
Конверсия должна быть 50%
*/

-- ПОДГОТОВКА ДАННЫХ
DELETE FROM installs;
DELETE FROM visits;
DELETE FROM payments;

INSERT INTO installs(user_id, install_time) VALUES
('1', now()),
('2', now()),
('3', now()),
('4', now()),
('5', now()),
('6', now()),
('7', now() - INTERVAL '41 days' ),
('8', now() - INTERVAL '41 days' );

INSERT INTO payments(user_id, payment_sum) VALUES

('1', 100),
('1', 100),
('2', 100),
('2', 100),
('3', 100),
('4', 100),
('5', 100),
('6', 100),
('1', 100);

-- РЕШЕНИЕ

SELECT CAST (COUNT(returned.user_id) as FLOAT) / COUNT(DISTINCT p.user_id) * 100
    FROM installs i
    INNER JOIN payments p on i.user_id = p.user_id
    LEFT OUTER JOIN (
        SELECT user_id from payments GROUP BY user_id HAVING COUNT(user_id) > 2
    ) AS returned ON returned.user_id = i.user_id

