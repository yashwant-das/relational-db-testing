exports.createTableSQL = "CREATE TABLE `users` ( `id` INT(2) NOT NULL AUTO_INCREMENT , `name` VARCHAR(100) NOT NULL , `email` VARCHAR(50) NOT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB;";

exports.insertSQL = (name, email) => `INSERT INTO users (id, name, email) VALUES (NULL, '${name}', '${email}');`;

exports.updateSQL = (name, email) => `UPDATE users SET name='${name}' WHERE email='${email}'`;

exports.deleteSQL = (email) => `DELETE FROM users WHERE email='${email}'`;