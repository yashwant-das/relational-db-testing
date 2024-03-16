exports.dbConfig = {
  host: process.env.DB_HOST || "mysql-166246-0.cloudclusters.net",
  user: process.env.DB_USER || "",
  password: process.env.DB_PASSWORD || "",
  port: process.env.DB_PORT || 19753,
  database: process.env.DB_NAME || "UsersDB",
};