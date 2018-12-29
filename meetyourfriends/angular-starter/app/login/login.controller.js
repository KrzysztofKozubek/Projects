'use strict';

angular.module('myApp.login', ['ngCookies', 'toaster', 'ngAnimate'])

.controller('LoginController', LoginController);

function LoginController(LoginService, $state, $cookies, toaster) {

    var loginCtrl = this;
    loginCtrl.email = '';
    loginCtrl.password = '';

    if($cookies.get('isLogged')) {
        $state.go('profile');
    }

    loginCtrl.login = function () {
        LoginService.login(loginCtrl.email, loginCtrl.password).then(function (response) {
            if (!response.data.success) {
                toaster.pop('error', "Login failed", 'incorrect email or password');
            } else {
                $cookies.put('isLogged', 'true')
                toaster.pop({
                    type: 'success',
                    title: 'Login successful',
                    body: 'redirection',
                    onHideCallback: function () {
                        $state.go('profile')
                    }
                });
            }
        })
    }
}