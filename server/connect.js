const { Sequelize } = require('sequelize');
require('dotenv').config();
// Option 2: Passing parameters separately (other dialects)

const sequelize = new Sequelize('reviews', 'postgres', 'bored1176carpet', {
  host: 'ec2-3-139-100-1.us-east-2.compute.amazonaws.com',
  dialect: 'postgres',
});

module.exports = {
  sequelize,
};
