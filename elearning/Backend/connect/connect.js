const mysql = require("mysql2/promise"); // <- ใช้ promise version
require("dotenv").config();

const pool = mysql.createPool({
  uri: process.env.DATABASE_URL,  // <-- ถ้า DATABASE_URL เป็น URI เช่น mysql://user:pass@host/db
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0,
});

module.exports = pool;