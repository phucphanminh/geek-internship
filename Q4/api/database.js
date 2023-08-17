const mysql = require('mysql2');

app.use(cors());
const db = mysql.createConnection({
  host: 'localhost', 
  user: 'root', 
  password: '', 
  database: 'geekinternship'
});

module.exports = db;