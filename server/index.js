/* eslint-disable camelcase */
/* eslint-disable no-console */
/* eslint-disable no-unused-vars */
const express = require('express');
const bodyParser = require('body-parser');
const connectDB = require('./connect');
require('dotenv').config();

const app = express();

app.use(express.json());
app.use(bodyParser.json());

connectDB.sequelize.authenticate()
  .then(() => console.log('Connection to DB Successful'))
  .catch((error) => console.log('Unable to connect to DB', error));

// ====================GET REQUEST=============================

app.get('/reviews', (req, res) => {
  const { product_id } = req.query;
  connectDB.sequelize.query(`select * from review where product_id = ${product_id}`)
    .then((data) => res.send(data[0]))
    .catch((error) => console.log('CAUGHT ERROR', error));
});

// ====================POST REQUEST============================

app.post('/reviews', (req, res) => {
  const {
    product_id, rating, date, summary, body, recommend, reported,
    reviewer_name, reviewer_email, response, helpfulness, photos, characteristics,
  } = req.body;

  connectDB.sequelize.query(`INSERT INTO review (product_id, rating, date, summary, body, recommend, reported,
    reviewer_name, reviewer_email, response, helpfulness) VALUES (${product_id}, ${rating}, ${date}, '${summary}', '${body}', ${recommend}, ${reported}, '${reviewer_name}', '${reviewer_email}', '${response}', ${helpfulness}); SELECT currval('review_id_seq')`)
    .then((data) => {
      const photoMap = photos.map((url) => connectDB.sequelize.query(`INSERT INTO photos (review_id, url) VALUES (${data[0][0].currval}, '${url}')`));
      Promise.all(photoMap)
        .then((results) => {
          const charMap = Object.entries(characteristics).map((char) => connectDB.sequelize.query(`INSERT INTO characteristic_reviews (characteristic_id, review_id, value) VALUES (${char[0]}, ${data[0][0].currval}, ${char[1]})`));
          Promise.all(charMap)
            .then((results1) => console.log('POSTED'))
            .catch((error) => console.log('CHARMAP ERROR', error));
        })
        .catch((error) => console.log('PHOTOMAP ERROR', error));
      res.status(200).send(req.body);
    })
    .catch((error) => console.log(error));
  // connectDB.sequelize.query(`INSERT INTO photos`);
});

// ===================PUT REQUEST==============================
app.put('/reviews/:review_id/helpful', (req, res) => {

});

const port = 3000;
app.listen(port, () => {
  console.log(`LISTENING AT http://localhost:${port}`);
});

// connectDB.sequelize.create({
//   product_id: req.body.id,
//   rating: req.body.rating,
//   summary: req.body.summary,
//   body: req.body.body,
//   recommend: req.body.recommend,
//   name: req.body.name,
//   email: req.body.email,
//   photos: req.body.photos,
//   characteristics: req.body.characteristics,
// })
