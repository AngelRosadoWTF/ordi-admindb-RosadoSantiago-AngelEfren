CREATE DATABASE IF NOT EXISTS ordi-admindb-RosadoSantiago-AngelEfren
  CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE ordi-admindb-RosadoSantiago-AngelEfren;
CREATE USER IF NOT EXISTS 'admin_role'@'%' IDENTIFIED BY 'AdminPass123!';
CREATE USER IF NOT EXISTS 'auditor_role'@'%' IDENTIFIED BY 'AuditorPass123!';
CREATE USER IF NOT EXISTS 'programmer_role'@'%' IDENTIFIED BY 'ProgrammerPass123!';
GRANT ALL PRIVILEGES ON ordi-admindb-RosadoSantiago-AngelEfren.* TO 'admin_role'@'%';
GRANT SELECT, INSERT, UPDATE ON ordi-admindb-RosadoSantiago-AngelEfren.* TO 'auditor_role'@'%';
GRANT SELECT ON ordi-admindb-RosadoSantiago-AngelEfren.* TO 'programmer_role'@'%';
FLUSH PRIVILEGES;