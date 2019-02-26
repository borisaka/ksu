/*
 У нас есть 5 установок за период (и одна была до периода)
 и 7 визитов (4 уника).
 Также наш суммарный доход 200 денег.
 200 / 4 = 50, Наш средний ARPU на юзера
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
('6', now() - INTERVAL '41 days' );


INSERT INTO visits(user_id) VALUES
('1'),
('1'),
('1'),
('2'),
('2'),
('3'),
('4');

INSERT INTO payments(user_id, payment_sum) VALUES
('1', 100),
('2', 100);

-- РЕШЕНИЕ ЗАДАЧИ

SELECT (SELECT SUM(payment_sum) FROM payments)/COUNT(DISTINCT v.user_id) as result
    FROM installs i
    INNER JOIN visits v on v.user_id = i.user_id -- INNER JOIN drops install without visit
    WHERE i.install_time > NOW() - INTERVAL '30 days'
