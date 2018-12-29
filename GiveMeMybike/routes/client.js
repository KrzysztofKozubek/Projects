var express = require('express');
var router = express.Router();
var cookieParser = require('cookie-parser');
var crypto = require('crypto');
var db = require('../model/db');

router.all('/*', function(req,res,next){
	req.app.locals.pageName = '/client/rent';
	req.app.locals.clientPageName = '/client'+req.url;
	if(!req.session.userName){
		req.session.error = 'odmowa dostępu';
		res.redirect('/sign#sign');
	}else{
		req.session.error = null;
		db.getBasicPersonal(req.session.userID, function(data){
			req.app.locals.personalData = data[0];
			next();
		});
	}
});

//----------------------------------------------------------------------------------------

router.get('/rent', function(req, res){
	db.getPlaceList(function(data){
		res.render('client/rent', {title: req.app.locals.title+'Express', places: data});
	});
});

function createOrderID($args, $username){
	var username = $username.split(' ');
	return ((username[0].substr(0,1)+username[1].substr(0,3))+'_'+$args.rentPlace+'/'+Math.floor((Math.random() * 1000) + 1000)).toUpperCase();
}

router.post('/rent', function(req, res){
	if(req.app.locals.personalData.UserMoney < 2){
		res.render('client/error', {title: req.app.locals.title+'Wypożyczanie roweru', header: 'Wypożyczenie roweru', content: 'Nie masz wystarczająco dużo środków na koncie!',backLink: '/client/rent' });
		return;
	}
	if(req.body.bikeType){
		req.app.locals.OrderID = req.body.OrderID = createOrderID(req.body, req.session.userName);
		if(req.body.rentOtherUser == 1) req.body.rentOtherUserID = req.body.rentOtherName+' '+req.body.rentOtherSurname+'<br>'+req.body.rentOtherEmail+'<br'+req.body.rentOtherPhone+'<br>'+req.body.rentOtherAddress+', '+req.body.rentOtherZipCity;
		db.setClientRent(req.body, req.session);
		db.setClientPayment(req.session.userID, req.app.locals.personalData.UserMoney, -2, 2);
		res.redirect('rent_success');
	} else{
		res.redirect('rent');
	}

});

router.get('/rent_success', function(req, res, next){
	res.render('client/success', {title: req.app.locals.title+'Wypożyczenie roweru', header: 'Wypożyczenie roweru', content: 'Zlecenie gotowe! Numer zamówienia: '+req.app.locals.OrderID, backLink: '/client/orders' });
});

//----------------------------------------------------------------------------------------

router.get('/travels', function(req, res){
	db.getTravels(function(data){
		res.app.locals.result = data;
		db.getUserTravels(req.session.userID, function(data2){
			for(val in data){
				res.app.locals.result[val].isMember = 0;
				var date = new Date(data[val].TripDateEnd);
				var now = new Date();
				for(val2 in data2){
					if(date < now){
						res.app.locals.result[val].isMember = 2;
					}
					else if(data[val].TripID == data2[val2].TripID){
						res.app.locals.result[val].isMember = 1;
					}
				}
			}
			console.log(res.app.locals.result);

			res.render('client/travels', {title: req.app.locals.title+'Wycieczki', userTravels: data2});	
		});
	});
});

router.post('/travels/join', function(req, res){
	db.joinTravel(req.body.travelID, req.session.userID, function(){
		res.end(1);
	});
});

router.post('/travels/unsubscribe', function(req, res){
	db.unsubscribeTravel(req.body.travelID, req.session.userID, function(){
		res.end(1);
	});
});

router.get('/travels/members/:list', function(req, res){
	db.getTravelMembers(req.params.list, function(data){
		res.render('client/travelmembers_modal', {modal: data});
	});
});

router.get('/travels/details/:tripID', function(req, res){
	db.getTravel(req.params.tripID, function(data){
		res.render('client/traveldetails_modal', {modal: data[0]});
	});
});

//----------------------------------------------------------------------------------------

router.get('/payments', function(req, res){
	db.getClientPayments(req.session.userID, function(data){
		res.render('client/payments', {title: 'Express', results: data});
	});
});
router.post('/payments', function(req,res){
	if(req.body.clientPayment){
		db.setClientPayment(req.session.userID, req.app.locals.personalData.UserMoney, req.body.clientPayment, 1);
		res.redirect('payments_success');
	} else{
		res.redirect('payments');
	}
});
router.get('/payments_success', function(req, res, next){
	res.render('client/success', {title: req.app.locals.title+'Płatności', header: 'Płatności', content: 'Pomyślnie dokonano płatności!', backLink: '/client/payments' });
});

//----------------------------------------------------------------------------------------

router.get('/orders', function(req, res, next){
	db.getOrders(req.session.userID, function(data){
		res.render('client/orders', {title: req.app.locals.title+'Zamówienia', result: data});
	});
});

router.get('/orders/:orderID', function(req, res){
	db.getOrder(req.params.orderID, function(data){
		data[0].OrderPreferences = data[0].OrderPreferences.split(',');
		res.render('client/orderdetail_modal', {modal: data[0]});
	});
});

router.get('/orders/rate_place/:orderID', function(req, res){
	db.getOrder(req.params.orderID, function(data){
		db.getStars(data[0].OrderPlaceID, function(result){
			res.render('client/rateplace_modal', {modalStars: result[0], modal: data[0]});
		});
	});
});

router.post('/orders', function(req,res){
	db.setRating(req.body, req.session.userID, function(){
		res.render('client/success', {title: 'Express', header: 'Ocenianie', content: 'Dziękujemy za wystawioną ocenę!', backLink: '/client/orders' });
	});
});
	
//----------------------------------------------------------------------------------------

router.get('/profile', function(req, res){
	db.getProfile(req.session.userID, function(data){
		res.render('client/profile', {result: data[0]});
	});
});

router.post('/profile', function(req,res){
	if(req.body.profilePassword){
		db.setNewPassword(req.body.profilePassword, req.session.userID, function(){
			res.render('client/success', {title: 'Express', header: 'Edycja profilu', content: 'Pomyślnie zmienino hasło!', backLink: '/client/profile' });
		});
	} else{
		db.setNewProfileData(req.body, req.session.userID, function(){
			req.session.userName = req.body.profileName+' '+req.body.profileSurname;
			res.render('client/success', {title: 'Express', header: 'Edycja profilu', content: 'Pomyślnie zmienino dane!', backLink: '/client/profile' });
		});
	}
});

router.post('/check_email/:email', function(req, res){
  db.checkEmail(req.params.email, function(data){
    if(data.length > 0)
    	if(data[0].UserEmail != req.body.UserEmail)
      		res.send('1');
    else
      res.send('0');
  });
});

router.post('/check_phone/:phone', function(req, res){
  db.checkPhone(req.params.phone, function(data){
    if(data.length > 0)
      	if(data[0].UserPhone != req.body.UserPhone)
      		res.send('1');
    else
      res.send('0');
  });
});

module.exports = router;