exports.createTableSQL = "CREATE TABLE `users` ( `id` INT(2) NOT NULL AUTO_INCREMENT , `name` VARCHAR(100) NOT NULL , `email` VARCHAR(50) NOT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB;";

exports.insertSQL = "INSERT INTO users (name, email) VALUES (?, ?)";

exports.updateSQL = "UPDATE users SET name = ? WHERE email = ?";

exports.deleteSQL = "DELETE FROM users WHERE email = ?";

exports.selectAllSQL = "SELECT * FROM users";