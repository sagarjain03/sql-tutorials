CREATE DATABASE IF NOT EXISTS AegisAgency;

USE AegisAgency;

CREATE TABLE IF NOT EXISTS agents (
    agent_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    gender CHAR(1),
    clearance_level VARCHAR(20) DEFAULT "Level-1",
    CONSTRAINT age_check CHECK (age >= 21)
);

select * from agents;

CREATE TABLE IF NOT EXISTS missions (
    mission_id INT PRIMARY KEY,
    code_name VARCHAR(50) UNIQUE,
    budget DECIMAL(12, 2),
    lead_agent_id INT,
    FOREIGN KEY (lead_agent_id) REFERENCES agents (agent_id) ON DELETE SET NULL
);

select * from missions;

CREATE TABLE IF NOT EXISTS gadgets (
    gadget_id INT PRIMARY KEY,
    gadget_name VARCHAR(50),
    assigned_agent_id INT,
    FOREIGN KEY (assigned_agent_id) REFERENCES agents (agent_id) ON UPDATE CASCADE ON DELETE CASCADE
);

SELECT * FROM gadgets;
-- ALTER TABLE COMMANDS

ALTER TABLE agents ADD email VARCHAR(50) UNIQUE

ALTER TABLE agents MODIFY gender VARCHAR(1);

ALTER TABLE missions
CHANGE COLUMN budget operation_cost DECIMAL(12, 2);

ALTER TABLE agents DROP COLUMN gender;

INSERT INTO
    agents (
        agent_id,
        name,
        age,
        clearance_level
    )
VALUES (01, 'Rahul', 45, 'level-2'),
    (02, 'Ram', 65, 'level-5'),
    (03, 'Riya', 45, 'level-2');

INSERT INTO
    missions (
        mission_id,
        code_name,
        operation_cost,
        lead_agent_id
    )
VALUES (011, 'lion', 4500.00, 02),
    (012, 'fox', 5500.00, 01),
    (013, 'tiger', 4500.00, 03);

INSERT INTO
    gadgets (
        gadget_id,
        gadget_name,
        assigned_agent_id
    )
VALUES (001, 'moxa', 01),
    (002, 'foxa', 03),
    (003, 'troxa', 02);

    -- challenge - 3
UPDATE agents SET clearance_level = 'Level-5' WHERE agent_id =03;

DELETE from agents WHERE agent_id=03;


REPLACE INTO gadgets (gadget_id,gadget_name,assigned_agent_id) VALUES (003,'Bomb',01);


select * from agents;

-- challenge 4

SELECT name,age from agents WHERE age BETWEEN 25 and 45;

SELECT * FROM missions WHERE code_name IN ('elephant','lion','bear');

SELECT * FROM agents WHERE NAME LIKE "%UL"


delete from agents;
delete from missions;

delete from gadgets;

INSERT INTO agents
(agent_id, name, age, clearance_level, email)
VALUES
(101, 'Aarav Sharma', 29, 'Level-2', 'aarav@aegis.com'),
(102, 'Priya Mehta', 34, 'Level-4', 'priya@aegis.com'),
(103, 'Kabir Singh', 41, 'Level-5', 'kabir@aegis.com'),
(104, 'Ananya Rao', 27, 'Level-3', 'ananya@aegis.com'),
(105, 'Rohan Kapoor', 38, 'Level-4', 'rohan@aegis.com');



INSERT INTO missions
(mission_id, code_name, operation_cost, lead_agent_id)
VALUES
(201, 'Operation Falcon', 150000.00, 103),
(202, 'Silent Storm', 95000.00, 102),
(203, 'Black Panther', 220000.00, 101),
(204, 'Desert Shadow', 180000.00, 105),
(205, 'Iron Shield', 125000.00, 104);

INSERT INTO gadgets
(gadget_id, gadget_name, assigned_agent_id)
VALUES
(301, 'Night Vision Goggles', 101),
(302, 'EMP Grenade', 103),
(303, 'Hologram Projector', 102),
(304, 'Tracking Drone', 105),
(305, 'Laser Watch', 104),
(306, 'Encrypted Communicator', 101);



SELECT COUNT(*) AS total_agents FROM agents;

SELECT AVG(operation_cost) AS Average_operation_cost FROM missions;

SELECT MAX(operation_cost) AS highest_operation_cost FROM missions;


SELECT
    (SELECT COUNT(*) FROM agents) AS total_agents,
    (SELECT AVG(operation_cost) FROM missions) AS average_operation_cost,
    (SELECT MAX(operation_cost) FROM missions) AS highest_operation_cost;


SELECT * FROM agents GROUP BY clearance_level HAVING COUNT(agent_id)>=1;