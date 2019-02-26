DROP TABLE IF EXISTS installs;

CREATE TABLE installs (
    app_id VARCHAR(100),
    user_id VARCHAR(255),
    "sum" VARCHAR(50),
    install_time TIMESTAMP,
    platform VARCHAR(50),
    country_code VARCHAR(255),
    os_version VARCHAR(255)
);


DROP TABLE IF EXISTS visits;

CREATE TABLE visits (
    id SERIAL,
    user_id VARCHAR(255),
    visit_time TIMESTAMP,
    source VARCHAR(2000),
    ip VARCHAR(255)
);


DROP TABLE IF EXISTS payments;

CREATE TABLE payments (
    id SERIAL,
    user_id VARCHAR(255),
    payment_type TIMESTAMP,
    product_id VARCHAR(255),
    payment_sum DECIMAL(19, 4)
);

/* INSERT INTO installs(user_id, install_time) VALUES */
/* ('1', now()), */
/* ('2', now()), */
/* ('3', now()), */
/* ('4', now()), */
/* ('5', now()); */


/* INSERT INTO visits(user_id) VALUES */
/* ('1'), */
/* ('2'), */
/* ('3'), */
/* ('4'); */

/* INSERT INTO payments(user_id, payment_sum) VALUES */
/* ('1', 100), */
/* ('2', 100); */

