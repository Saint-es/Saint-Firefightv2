CREATE TABLE IF NOT EXISTS fire_department_data (
    id INT PRIMARY KEY,
    budget INT DEFAULT 100000
);

INSERT IGNORE INTO fire_department_data (id, budget) VALUES (1, 100000);

CREATE TABLE IF NOT EXISTS fire_station_upgrades (
    upgrade_name VARCHAR(100) PRIMARY KEY,
    level INT DEFAULT 0
);

CREATE TABLE IF NOT EXISTS fire_reports (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fire_id VARCHAR(50),
    investigator VARCHAR(100),
    cause VARCHAR(100),
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS fire_arson_cases (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fire_id VARCHAR(50),
    suspect_identifier VARCHAR(100),
    evidence_score INT DEFAULT 0,
    confession BOOLEAN DEFAULT FALSE,
    status VARCHAR(50) DEFAULT 'Pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS fire_incidents (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fire_type VARCHAR(50),
    location VARCHAR(255),
    intensity INT,
    resolved BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
