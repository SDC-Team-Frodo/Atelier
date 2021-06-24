const { Sequelize } = require('sequelize');
require('dotenv').config();
// Option 2: Passing parameters separately (other dialects)

const sequelize = new Sequelize('reviewTest', 'devin', process.env.DB_PASSWORD, {
  host: 'localhost',
  dialect: 'postgres',
});

module.exports = {
  sequelize,
};
