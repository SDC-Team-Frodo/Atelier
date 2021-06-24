/* eslint-disable no-console */
/* eslint-disable no-unused-vars */
const express = require('express');
const bodyParser = require('body-parser');
const connectDB = require('./connect');
require('dotenv').config();

const app = express();

app.use(express.json());

connectDB.sequelize.authenticate()
  .then(() => console.log('Connection to DB Successful'))
  .catch((error) => console.log('Unable to connect to DB', error));

app.get('/', (req, res) => {
  connectDB.sequelize.query('select * from review Limit 10')
    .then((data) => console.log(data[0]))
     .catch((error) => console.log('CAUGHT ERROR', error));
  // console.log('CONNECTION LOG', connectDB.sequelize.query);
});

const port = 3000;
app.listen(port, () => {
  console.log(`LISTENING AT http://localhost:${port}`);
});
