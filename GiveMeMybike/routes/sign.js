var express = require('express');
var router = express.Router();
var crypto = require('crypto');
var db = require('../model/db');
var nodemailer = require('nodemailer');
var sgTransport = require('nodemailer-sendgrid-transport');

router.get('/', function(req, res, next) {
  res.render('sign', { title: req.app.locals.title+'Logowanie/Rejestracja', login_error: '' });
});

router.get('/sign_error', function(req, res, next) {
  res.render('sign', { title: req.app.locals.title+'Logowanie/Rejestracja', login_error: 'Niepoprawny użytkownik lub hasło' });
});

router.post('/signin', function(req, res){
  var sess = req.session;
  db.checkUser(req.body.signInName, req.body.signInPassword, function(result){
    if(result.length == 1){
        sess.userID   = result[0].UserID;
        sess.userName = result[0].UserName+' '+result[0].UserSurname;
        res.redirect('/client/rent');
    }else{
      res.redirect('/sign/sign_error#sign');
    }
  });
});

router.post('/check_email/:email', function(req, res){
  db.checkEmail(req.params.email, function(data){
    if(data.length > 0)
      res.send('1');
    else{
      res.send('0');
    }
  });
});

router.post('/check_phone/:phone', function(req, res){
  db.checkPhone(req.params.phone, function(data){
    if(data.length > 0)
      res.send('1');
    else
      res.send('0');
  });
});

function hashPW(pwd){
  return crypto.createHash('sha256').update(pwd).digest('base64').toString();
}

function sendAuthMail(data){
  var options = {
    service: 'SendGrid',
    auth: {
      api_user: '****',
      api_key: '****'
    }
  }
  var transporter = nodemailer.createTransport(sgTransport(options));
  transporter.sendMail({
      from: 'admin@givememybike-tofik.rhcloud.com',
      to: data.registerEmail,
      subject: 'Aktywacja konta na stronie givememybike-tofik.rhcloud.com',
      html: 'Witaj '+data.registerName+' !<br>Link Aktywacyjny: <a href="http://givememybike-tofik.rhcloud.com/sign/activation/'+data.registerAuthKey+'&'+data.registerEmail+'">'+data.registerAuthKey+'&'+data.registerEmail+'</a><br><br>Pozdrawiamy<br>Zespół GMMB'
  }, function(error, info){
    if(error){
        return console.log(error);
    }
    console.log('Message sent: ' + info.response);
  });
}

router.post('/signup', function(req, res){
  if(req.body.registerEmail) {
    var d = new Date();
    req.body.registerAuthKey = hashPW(d.toJSON());    
    db.addUser(req.body, function(result){
        console.log(result);
        sendAuthMail(req.body);
        res.redirect('/sign/sign_success#sign');
    });
  }
});

router.get('/sign_success',function(req, res){
  res.render('success', {title: req.app.locals.title+'Rejestracja', header: 'Rejestracja', content: 'Rejestracja przebiegła pomyślnie! Na maila został wysłany link aktywacyjny.', backLink: '/' });
});
router.get('/activation_success',function(req, res){

  res.render('success', {title: req.app.locals.title+'Aktywacja', header: 'Aktywacja', content: 'Aktywacja przebiegła pomyślnie! Konto jest już aktywne.', backLink: '/' });
});

router.get('/activation/:AuthKey',function(req,res){
  var params = req.params.AuthKey.split('&');
  db.checkAuth(params[0],params[1], function(data){
    db.updateAuth(data[0].UserID,function(data2){
      res.redirect('/sign/activation_success')
    });
  });
});
module.exports = router;
