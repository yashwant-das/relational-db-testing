const { createPool } = require("mysql2/promise");
const { faker } = require("@faker-js/faker");
const { createTableSQL, insertSQL, updateSQL, deleteSQL, selectAllSQL } = require('../src/queries/user-queries');
const { dbConfig } = require('../src/config/database');

describe("Database Tests", () => {
  let connection;

  beforeEach(async () => {
    connection = await createPool(dbConfig);
    console.log("Connected to database");

    await connection.query("DROP TABLE IF EXISTS `users`");
    await connection.query(createTableSQL);
  });

  it("Test CREATE and READ", async () => {
    const total_test_users = 3;
    let insertQueries = [];

    for (let i = 0; i < total_test_users; i++) {
      insertQueries.push(connection.query(insertSQL, [faker.person.fullName(), faker.internet.email()]));
    }

    await Promise.all(insertQueries);

    const [rows, fields] = await connection.query(selectAllSQL);

    expect(rows.length).toBe(total_test_users);
  });

  // Test update & delete
  it("Test UPDATE and DELETE", async () => {
    let name = "Test user";
    let email = "test@user.com";
    let nameUpdate = "My Test User";

    await connection.query(insertSQL, [name, email]);

    //Run and test update
    await connection.query(updateSQL, [nameUpdate, email]);

    const [rows, fields] = await connection.query(selectAllSQL);
    expect(rows[0].name).toBe(nameUpdate);

    //Run and test delete
    await connection.query(deleteSQL, [email]);

    const [allrows] = await connection.query(selectAllSQL);
    expect(allrows.length).toBe(0);
  });

  afterEach(async () => {
    await connection.query("DROP TABLE IF EXISTS `users`");
    await connection.end();
  });
});