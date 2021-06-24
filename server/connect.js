const { Sequelize } = require('sequelize');
require('dotenv').config();
console.log('CONSOLE LOG',process.env.DB_PASSWORD)
// Option 2: Passing parameters separately (other dialects)
const sequelize = new Sequelize('reviewTest', 'devin', process.env.DB_PASSWORD, {
  host: 'localhost',
  dialect: 'postgres'
});

sequelize.authenticate()
  .then(() => console.log('Connection to DB Successful'))
    .catch((error) => console.log('Unable to connect to DB', error));