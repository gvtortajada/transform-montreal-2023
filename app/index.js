const express = require('express');
const path = require('path');
const app = express();

app.get('/', function(req, res) {
  res.sendFile(path.join(__dirname, '/index.html'));
});

app.get('/styles.css', function(req, res) {
  res.sendFile(path.join(__dirname, '/styles.css'));
});

const port = process.env.PORT || 8080;

app.listen(port, () => {
  console.log(`http://localhost:${port}`);
});