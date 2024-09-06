
USE test_db;
CREATE TABLE item (
                      id INT PRIMARY KEY AUTO_INCREMENT,
                      name VARCHAR(10),
                      description VARCHAR(30),
                      price INT UNSIGNED,
                      created_at DATETIME
);

CREATE TABLE analysis (
                          id SERIAL PRIMARY KEY AUTO_INCREMENT,
                          analysis JSON,
                          created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO item () VALUES ();
INSERT INTO item (id) SELECT 0 FROM item;
INSERT INTO item (id) SELECT 0 FROM item;
INSERT INTO item (id) SELECT 0 FROM item;
INSERT INTO item (id) SELECT 0 FROM item;
INSERT INTO item (id) SELECT 0 FROM item;
INSERT INTO item (id) SELECT 0 FROM item;

UPDATE item SET
                name = CONCAT('商品', id),
                description = SUBSTRING(MD5(RAND()), 1, 30),
                price = CEIL(RAND() * 10000),
                created_at = ADDTIME(CONCAT_WS(' ','2014-01-01' + INTERVAL RAND() * 180 DAY, '00:00:00'), SEC_TO_TIME(FLOOR(0 + (RAND() * 86401))));


EXPLAIN ANALYZE FORMAT=JSON INTO @variables SELECT * FROM item Where name like '商品%';
INSERT INTO analysis (analysis) VALUES (@variables);

SELECT * FROM analysis;
