CREATE SCHEMA IF NOT EXISTS lab_4;

USE lab_4;

DROP TABLE IF EXISTS company_hierarchy;

CREATE TABLE company_hierarchy (
	unit_id INT NOT NULL PRIMARY KEY,
    unit_name VARCHAR(60) NOT NULL,
    parent_id VARCHAR(60) NULL
);

INSERT INTO company_hierarchy
(unit_id, unit_name, parent_id)
VALUES
(1, 'General Electric', NULL),
(2, 'GE Capital', 1),
(3, 'GE Energy Management', 1),
(4, 'GE Oil & Gas', 1),
(5, 'GE Capital Aviation Services', 2),
(6, 'GE Energy Financial Services', 2),
(7, 'GE Power Electronics', 3),
(8, 'GE Power Components', 3);

SELECT *
FROM company_hierarchy;

SELECT
Parent.unit_name AS `Parent`,
Subsidiary.unit_name AS `Subsidiary`
FROM company_hierarchy AS Parent
JOIN company_hierarchy AS Subsidiary
ON Parent.unit_id = Subsidiary.parent_id
ORDER BY `Parent`, `Subsidiary`;