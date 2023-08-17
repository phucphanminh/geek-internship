const express = require('express');
const mysql = require('mysql2');
const cors = require('cors');
const Routes = require('./routes/route');

const app = express();
const port = 3000; 

app.use(cors());

const db = mysql.createConnection({
  host: 'localhost', 
  user: 'root', 
  password: '', 
  database: 'geekinternship'
});

// Sử dụng các routes
app.use('/', Routes);

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});