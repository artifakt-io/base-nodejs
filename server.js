'use strict';

const path = require('path')
const serveStatic = require('serve-static')
const express = require('express');

// Constants
const PORT = 80;
const HOST = '0.0.0.0';

// App
const app = express();

app.use('/',  express.static(path.join(__dirname, 'public')))

app.get('/hello', (req, res) => {
  res.send('Hello Artifakt');
});

app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);
