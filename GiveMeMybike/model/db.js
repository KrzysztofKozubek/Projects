var mysql      = require('mysql');
var crypto     = require('crypto');
var Promise    = require('promise');
var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : '',
  database : 'givememybike'
});


connection.connect(function(err) {
  if (err) {
    console.error('error MySQL connecting: ' + err.stack);
    return;
  }
 
  console.log('MySQL connected as id ' + connection.threadId);
});

// LOGIN -------------
// -------------------

function hashPW(pwd){
  return crypto.createHash('sha256').update(pwd).digest('base64').toString();
}

connection.checkUser = function(name, password, callback){
  connection.query('SELECT * FROM user WHERE (UserPhone = ? OR UserPhone = ? OR UserEmail = ?) AND UserPassword = ?', [name,'+48'+name,name,hashPW(password)],function(err, rows, fields){
    if(err) throw err;
    callback(rows);
  });
}

connection.getBasicPersonal = function(userID, callback){
  connection.query('SELECT UserName, UserSurname, UserEmail, UserMoney, COUNT(payment.PaymentUserID) AS CountPay FROM user JOIN payment WHERE UserID = ?', [userID], function(err, rows, fields){
    if(err) throw err;
    callback(rows);
  });
}

// SIGNUP ------------
// -------------------

connection.checkEmail = function(email, callback){
  connection.query('SELECT UserEmail FROM user WHERE UserEmail = ?', [email], function(err, rows, fields){
    if(err) throw err;
    callback(rows);
  });
}

connection.checkPhone = function(phone, callback){
  connection.query('SELECT UserPhone FROM user WHERE UserPhone = ? OR UserPhone = ?', [phone,'+48'+phone], function(err, rows, fields){
    if(err) throw err;
    callback(rows);
  });
}

connection.addUser = function(data, callback){

  var post = {
    'UserID': null,
    'UserName':''+data.registerName+'',
    'UserSurname': ''+data.registerSurname+'',
    'UserPassword': ''+hashPW(data.registerPassword)+'',
    'UserPhone': ''+data.registerPhone+'',
    'UserEmail': ''+data.registerEmail+'',
    'UserAddress': ''+data.registerAddress+'',
    'UserZipCity': ''+data.registerZipCity+'',
    'UserPermission': 2,
    'UserAuth': 0,
    'UserAuthKey': data.registerAuthKey,
  }
  var query = connection.query('INSERT INTO `user` SET ?',post,function(err, result){
    if(err) throw err;
    callback(result.insertID);
  });
}

connection.checkAuth = function(authKey,email, callback){
  connection.query('SELECT UserID FROM user WHERE UserAuthKey = ? AND UserEmail = ?', [authKey, email], function(err, rows, fields){
    if(err) throw err;
    callback(rows);
  });
}
connection.updateAuth = function(userID, callback){
  connection.query('UPDATE user SET UserAuth = 1 WHERE UserID = ?', [userID], function(err, rows, fields){
    if(err) throw err;
    callback(rows);
  });
}
// PAYMENT------------
// -------------------

connection.setClientPayment = function(userID, userMoney, userPayment, paymentType){
  connection.query('INSERT INTO payment(PaymentID, PaymentUserID, PaymentType, PaymentAmount, PaymentDate) VALUES (NULL,?, ?, ?, NOW())', [userID,paymentType,userPayment], function(err){
    if(err) throw err;
      connection.query('UPDATE user SET UserMoney = ? WHERE UserID = ?', [parseInt(userMoney)+parseInt(userPayment), userID],function(err){
        if(err) throw err;
    });
  });
}
connection.getClientPayments = function(userID, callback){
  connection.query('SELECT *, DATE_FORMAT(PaymentDate,"%d-%m-%Y %H:%i") AS PaymentDate FROM payment WHERE PaymentUserID = ?', [userID], function(err, rows, fields){
    if(err) throw err;
    callback(rows);    
  });
}

connection.getPlaceList = function(callback){
  connection.query('SELECT * FROM place',function(err, rows){
    if(err) throw err;
    callback(rows);
  });
}
connection.setClientRent = function(data, session){
  var post = {
    'OrderID': null,
    'OrderUniqueName':''+data.OrderID+'',
    'OrderUserID': session.userID,
    'OrderPlaceID': data.rentPlace,
    'OrderBikeType': ''+data.bikeType+'',
    'OrderServiceType': ''+data.rentType+'',
    'OrderDateStart': ''+data.rentStartDate+'',
    'OrderDateEnd': ''+data.rentEndDate+'',
    'OrderPreferences': ''+data.rentAdditional+'',
    'OrderOtherUser': data.rentOtherUser,
    'OrderOtherUserID': ''+data.rentOtherUserID+''
  }
  var query = connection.query('INSERT INTO `order` SET ?',post,function(err){
    if(err) throw err;
  });
}

// TRAVELS------------
// -------------------

connection.getTravels = function(callback){
  connection.query('SELECT *, DATE_FORMAT(TripDateStart,"%d-%m-%Y %H:%i") AS TripDateStartFormat FROM trip ORDER BY TripDateStart DESC',function(err,rows, fields){
    if(err) throw err;
    callback(rows);
  });
}
connection.getTravel = function(tripID, callback){
  connection.query('SELECT *, DATE_FORMAT(TripDateStart,"%d-%m-%Y %H:%i") AS TripDateStart, DATE_FORMAT(TripDateEnd,"%d-%m-%Y %H:%i") AS TripDateEnd FROM trip INNER JOIN user  WHERE TripID = ?',[tripID],function(err,rows, fields){
    if(err) throw err;
    callback(rows);
  });
}
connection.getTravelMembers = function(tripID, callback){
  connection.query('SELECT UserName, UserSurname FROM trip_member JOIN user ON MemberID = UserID WHERE TripID = ?',[tripID] ,function(err,rows, fields){
    if(err) throw err;
    callback(rows);
  });
}
connection.getUserTravels = function(userID, callback){
  connection.query('SELECT *, DATE_FORMAT(TripDateStart,"%d-%m-%Y %H:%i") AS TripDateStartFormat, DATE_FORMAT(TripDateEnd,"%d-%m-%Y %H:%i") AS TripDateEnd FROM trip_member JOIN trip ON trip.TripID = trip_member.TripID WHERE MemberID = ? ORDER BY TripDateStart DESC',[userID],function(err,rows, fields){
    if(err) throw err;
    callback(rows);
  });
}
connection.joinTravel = function(tripID, userID, callback){
    var post = {
    'Trip_memberID': null,
    'MemberID': userID,
    'TripID': tripID,
  }
  var query = connection.query('INSERT INTO `trip_member` SET ?',post,function(err){
    if(err) throw err;
  });
}

connection.unsubscribeTravel = function(tripID, userID, callback){
  var query = connection.query('DELETE FROM `trip_member` WHERE TripID = ? AND MemberID = ?',[tripID, userID],function(err){
    if(err) throw err;
  });
}

// ORDERS-------------
// -------------------

connection.getOrders = function(userID, callback){
  var query = connection.query('SELECT *, PlaceName, PlaceAddress, PlaceCity FROM `order` JOIN `place` ON OrderPlaceID = PlaceID WHERE OrderUserID = ? ORDER BY OrderID ASC', [userID],function(err,rows, fields){
    if(err) throw err;
    callback(rows);
  });  
}
connection.getOrder = function(OrderID, callback){
  connection.query('SELECT *, PlaceID, PlaceName, PlaceAddress, PlaceCity FROM `order` JOIN `place` ON OrderPlaceID = PlaceID WHERE OrderID = ?', [OrderID],function(err,rows, fields){
    if(err) throw err;
    callback(rows);
  });  
}

connection.getStars = function(placeID, callback){
  connection.query('SELECT AVG(StarsAmount) AS StarsAvg FROM place INNER JOIN stars WHERE PlaceID = ?', [placeID],function(err,rows, fields){
    if(err) throw err;
    callback(rows);
  });    
}

connection.setRating = function(data, userID, callback){
  var post = {
    'StarsID': null,
    'StarsPlaceID': data.placeID,
    'StarsUserID': userID,
    'StarsAmount': data.placeRate,
    'StarsDesc': ''+data.placeDesc+'',
    'StarsOrderID': ''+data.orderID+'',
  }
  connection.query('INSERT INTO stars SET ?', post, function(err,rows){
    if(err) throw err;
    connection.query('UPDATE `order` SET `OrderIsRated`=1 WHERE OrderID = ?', [parseInt(data.orderID)], function(err,rows){
      if(err) throw err;
      callback();
    });
  });
}

// PROFILE------------
// -------------------

connection.getProfile = function(userID, callback){
  connection.query('SELECT * FROM user WHERE UserID = ? ',[userID], function(err, rows, fields){
    if(err) throw err;
    callback(rows);
  });
}

connection.setNewPassword = function(data, userID, callback){
  data = hashPW(data);
  connection.query('UPDATE user SET UserPassword = ? WHERE UserID = ?', [data, userID],function(err){
    if(err) throw err;
    callback();
  });
}

connection.setNewProfileData = function(data, userID, callback){
  var post = {
    'UserName': data.profileName,
    'UserSurname': data.profileSurname,
    'UserPhone': data.profilePhone,
    'UserEmail': data.profileEmail,
    'UserAddress': data.profileAddress,
    'UserZipCity': data.profileZipCity
  }
  connection.query('UPDATE user SET ? WHERE UserID = ? ',[post,userID],function(err){
    if(err) throw err;
    callback();
  });
}

// NEWSLETTER------
// ----------------

connection.addToNewsletter = function(email, callback){
  var post = {
    'NewsletterID': null,
    'NewsletterEmail': email,
  }
  connection.query('INSERT INTO newsletter SET ?', post, function(err,rows){
    callback(err);
  });  
}

module.exports = connection;