const mysql = require('mysql2');

const db = mysql.createConnection({
  host: 'localhost', 
  user: 'root', 
  password: 'Chou.huog5459', 
  database: 'geekinternship'
});

module.exports = db;