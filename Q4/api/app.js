const express = require('express');
const db = require('./database.js');
const cors = require('cors');
const Routes = require('./routes/route');

const app = express();
const port = 3000; 

// app.use(cors());

// Sử dụng các routes
app.use('/', Routes);

//connect to DB
db.connect((error) => {
    if (error) return console.log(error);
    console.log("Connect to DB success");
    app.listen(port, () => {
        console.log(`Server is running on http://localhost:${port}`);
    });
});