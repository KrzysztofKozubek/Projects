function requireHTTPS(req, res, next) {
  // The 'x-forwarded-proto' check is for Heroku
  if (!req.secure && req.get('x-forwarded-proto') !== 'https') {
    return res.redirect('https://' + req.get('host') + req.url);
  }
  next();
}

const express = require('express');
const cors = require('cors');
const app = express();

app.use(cors());
app.options('*', cors());
app.use(requireHTTPS);
app.use(express.static('./dist/kk-my-wallet'));

app.use(function(req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Methods", "GET,HEAD,OPTIONS,POST,PUT");
  res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept, Authorization");
  next();
});

app.get('/*', (req, res) =>
  res.sendFile('index.html', {root: 'dist/kk-my-wallet/'}),
);

app.listen(process.env.PORT || 4200);
