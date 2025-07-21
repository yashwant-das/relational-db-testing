require('dotenv').config();

exports.dbConfig = {
  host: process.env.DB_HOST || "localhost",
  user: process.env.DB_USER || "",
  password: process.env.DB_PASSWORD || "",
  port: process.env.DB_PORT || 3306,
  database: process.env.DB_NAME || "UsersDB",
};