import mysql.connector
from faker import Faker
import unittest
import os
from dotenv import load_dotenv

load_dotenv()  # take environment variables from .env.

DB_CONFIG = {
    'user': os.getenv('DB_USER'),
    'password': os.getenv('DB_PASSWORD'),
    'host': os.getenv('DB_HOST'),
    'port': os.getenv('DB_PORT'),
    'database': os.getenv('DB_NAME')
}

CREATE_TABLE_QUERY = "CREATE TABLE `users` ( `id` INT(2) NOT NULL AUTO_INCREMENT , `name` VARCHAR(100) NOT NULL , `email` VARCHAR(50) NOT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB;"
INSERT_QUERY = "INSERT INTO users (name, email) VALUES (%s, %s)"
SELECT_QUERY = "SELECT * FROM users"
UPDATE_QUERY = "UPDATE users SET name = %s WHERE email = %s"
DELETE_QUERY = "DELETE FROM users WHERE email = %s"
DROP_TABLE_QUERY = "DROP TABLE IF EXISTS `users`"

class DatabaseTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.cnx = mysql.connector.connect(**DB_CONFIG)
        cls.cursor = cls.cnx.cursor()
        cls.cursor.execute(DROP_TABLE_QUERY)
        cls.cursor.execute(CREATE_TABLE_QUERY)

    def setUp(self):
        # Clean table before each test
        self.cursor.execute("DELETE FROM users")
        self.cnx.commit()

    def test_create_and_read(self):
        fake = Faker()
        total_test_users = 10

        for _ in range(total_test_users):
            data = (fake.name(), fake.email())
            self.cursor.execute(INSERT_QUERY, data)

        self.cnx.commit()

        self.cursor.execute(SELECT_QUERY)
        rows = self.cursor.fetchall()
        self.assertEqual(len(rows), total_test_users)

    def test_update_and_delete(self):
        fake = Faker()
        name = "Test User"
        email = "test@user.com"
        updated_name = "Updated Test User"

        # Insert test user
        self.cursor.execute(INSERT_QUERY, (name, email))
        self.cnx.commit()

        # Test update
        self.cursor.execute(UPDATE_QUERY, (updated_name, email))
        self.cnx.commit()

        self.cursor.execute("SELECT name FROM users WHERE email = %s", (email,))
        result = self.cursor.fetchone()
        self.assertEqual(result[0], updated_name)

        # Test delete
        self.cursor.execute(DELETE_QUERY, (email,))
        self.cnx.commit()

        self.cursor.execute(SELECT_QUERY)
        rows = self.cursor.fetchall()
        self.assertEqual(len(rows), 0)

    @classmethod
    def tearDownClass(cls):
        cls.cursor.execute(DROP_TABLE_QUERY)
        cls.cnx.close()

if __name__ == '__main__':
    unittest.main()