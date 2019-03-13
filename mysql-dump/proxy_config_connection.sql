CREATE USER 'monitor'@'%' IDENTIFIED BY 'monitor';
GRANT SELECT on sys.* to 'monitor'@'%';
FLUSH PRIVILEGES;

CREATE USER 'admin'@'%' IDENTIFIED BY 'admin';
GRANT ALL PRIVILEGES on user.* to 'admin'@'%';
FLUSH PRIVILEGES;