//1
postgres=# CREATE ROLE testers;
CREATE ROLE
postgres=# CREATE ROLE analysts;
CREATE ROLE
postgres=# CREATE USER serovf;
CREATE ROLE
postgres=# CREATE USER belovr;
CREATE ROLE
postgres=# GRANT analysts TO serovf;
GRANT ROLE
postgres=# GRANT testers TO belovr;
GRANT ROLE
postgres=# ALTER ROLE belovr WITH PASSWORD 'password';
ALTER ROLE
postgres=# ALTER ROLE serovf WITH PASSWORD 'password';
ALTER ROLE

postgres=# \c vk
Вы подключены к базе данных "vk" как пользователь "postgres".


vk=# GRANT ALL ON ALL TABLES IN SCHEMA public TO testers;
GRANT
vk=# GRANT ALL ON ALL SEQUENCES IN SCHEMA public TO testers;
GRANT
vk=# GRANT SELECT ON ALL TABLES IN SCHEMA public TO analysts;
GRANT
postgres@Ubuntu-MySQL-VirtualBox:~$ psql -U belovr -d vk -h 127.0.0.1 -W
Пароль: 
psql (12.11 (Ubuntu 12.11-1.pgdg18.04+1))
SSL-соединение (протокол: TLSv1.3, шифр: TLS_AES_256_GCM_SHA384, бит: 256, сжатие: выкл.)
Введите "help", чтобы получить справку.

vk=> update users set first_name = 'Igor' WHERE id = '5';
UPDATE 1

postgres@Ubuntu-MySQL-VirtualBox:~$ psql -U serovf -d vk -h 127.0.0.1 -W
Пароль: 
psql (12.11 (Ubuntu 12.11-1.pgdg18.04+1))
SSL-соединение (протокол: TLSv1.3, шифр: TLS_AES_256_GCM_SHA384, бит: 256, сжатие: выкл.)
Введите "help", чтобы получить справку.

vk=> update users set first_name = 'Egor' WHERE id = '5';
ОШИБКА:  нет доступа к таблице users

//2
postgres=# CREATE EXTENSION "postgres_fdw";
CREATE EXTENSION
postgres=# SELECT*FROM pg_extension WHERE extname = 'postgres_fdw';

//3
CREATE TABLE profiles (
	user_id INT NOT NULL PRIMARY KEY,
	main_photo_id INT NOT NULL,
	user_contacts contacts,
	created_at TIMESTAMP
);
ALTER TABLE profiles 
	ADD CONSTRAINT profiles_user_id_fk
	FOREIGN KEY (user_id)
	REFERENCES users(id);
	
ALTER TABLE profiles 
	ADD CONSTRAINT profiles_main_photo_id_fk
	FOREIGN KEY (main_photo_id)
	REFERENCES photo(id);
INSERT INTO profiles (user_id, main_photo_id, user_contacts, created_at) SELECT id, main_photo_id, user_contacts, created_at from users;

ALTER TABLE users	
	DROP COLUMN main_photo_id,
	DROP COLUMN created_at,
	DROP COLUMN user_contacts;


