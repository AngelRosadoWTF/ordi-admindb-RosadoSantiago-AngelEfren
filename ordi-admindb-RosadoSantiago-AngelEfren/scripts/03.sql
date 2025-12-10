USE ordi-admindb-RosadoSantiago-AngelEfren;

CREATE USER IF NOT EXISTS 'admin'@'%' IDENTIFIED BY 'AdminStrong!';
GRANT ALL PRIVILEGES ON ordi-admindb-RosadoSantiago-AngelEfren.* TO 'admin'@'%';

CREATE USER IF NOT EXISTS 'auditor'@'%' IDENTIFIED BY 'AuditorStrong!';
GRANT SELECT, INSERT, UPDATE ON ordi-admindb-RosadoSantiago-AngelEfren.* TO 'auditor'@'%';

CREATE USER IF NOT EXISTS 'programmer'@'%' IDENTIFIED BY 'ProgrammerStrong!';
GRANT SELECT ON ordi-admindb-RosadoSantiago-AngelEfren.* TO 'programmer'@'%';

FLUSH PRIVILEGES;