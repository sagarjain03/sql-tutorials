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

    