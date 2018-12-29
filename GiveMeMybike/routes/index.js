var express = require('express');
var router = express.Router();
var db = require('../model/db');
var nodemailer = require('nodemailer');
var url = require('url');

router.all('/*', function(req,res,next){
  req.app.locals.title = 'GiveMeMyBike | ';
  req.app.locals.pageName = req.url;
  if(req.session.userName){
    req.app.locals.clientLink = {link1: [req.session.userName, '/client/rent'], link2: ['| wyloguj', '/logout']};
  } else{
    req.app.locals.clientLink = {link1: ['Zaloguj się/rejestracja','/sign#sign']};
  }
  req.app.locals.clientName = req.session.userName;
  next();
});

router.post('/add_to_newsletter', function(req, res){
  db.addToNewsletter(req.body.subscriptionEmail, function(data){
    if(data){
      res.render('error_page', {title: req.app.locals.title+'Newsletter', header: 'Newsletter', content: 'Błąd zapisu lub email już istnieje',backLink: '/' });
    } else{
      res.render('success', {title: req.app.locals.title+'Newsletter', header: 'Newsletter', content: 'Dziękujemy za zapisanie się do newslettera',backLink: '/' });
    }
  });
});

router.get('/', function(req, res, next) {
  res.render('index', { title: req.app.locals.title });
});

router.get('/prices', function(req, res, next) {
  res.render('prices', { title: req.app.locals.title+'Ceny'});
});

router.get('/rentals', function(req, res, next) {
  db.getPlaceList(function(data){
    for(var val in data){
      data[val].PlaceCoordinates = data[val].PlaceCoordinates.split(';');
    }
    res.render('rentals', { title: req.app.locals.title+'Wypożyczalnie', places: data});
  });
});

router.get('/contact', function(req, res, next) {
  res.render('contact', { title: req.app.locals.title+'Kontakt' });
});


router.post('/contact', function(req, res){
    var options = {
    service: 'SendGrid',
    auth: {
      api_user: 'mmtofilski470',
      api_key: 'tofik1234'
    }
  }
  var transporter = nodemailer.createTransport(sgTransport(options));
  transporter.sendMail({
      from: req.body.contactName+' <'+req.body.contactEmail+'>',
      to: 'pomoc@gmmb.pl',
      subject: 'Zapytanie ze strony internetowej gmmb.pl',
      html: req.body.contactText
  }, function(error, info){
    if(error){
        return console.log(error);
    }
    console.log('Message sent: ' + info.response);
    res.redirect('/contact_success');
  });
});

router.get('/contact_success',function(req, res){
  res.render('success', {title: req.app.locals.title+'Kontakt', header: 'Formularz kontaktowy', content: 'Wysłano email! Postaramy się jak najszybciej na niego odpowiedzieć.', backLink: '/contact' });
});

router.get('/logout', function(req, res){
  req.session = null;
  res.redirect('/');
});

module.exports = router;
