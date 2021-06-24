/* eslint-disable no-unused-vars */
const { Sequelize } = require('sequelize');
const sequelize = require('../connect');

const Review = sequelize.define('Review', {
  product_id: {
    type: Sequelize.INTEGER,
  },
  rating: {
    type: Sequelize.BIGINT,
  },
  date: {
    type: Sequelize.BIGINT,
  },
  summary: {
    type: Sequelize.TEXT,
  },
  body: {
    type: Sequelize.TEXT,
  },
  recommend: {
    type: Sequelize.BOOLEAN,
  },
  reported: {
    type: Sequelize.BOOLEAN,
  },
  reviewer_name: {
    type: Sequelize.TEXT,
  },
  reviewer_email: {
    type: Sequelize.TEXT,
  },
  response: {
    type: Sequelize.TEXT,
  },
  helpfulness: {
    type: Sequelize.INTEGER,
  },
});
