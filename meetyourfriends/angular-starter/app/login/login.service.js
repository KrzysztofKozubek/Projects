/**
 * Created by ania on 28.03.17.
 */
'use strict';

angular
    .module('myApp.login')
    .factory('LoginService', LoginService);

    function LoginService($http) {

        const BASE_URL = "http://localhost/";

        var service = {
            login: login
        };


        function login(email, password) {
           return $http({
                method: 'POST',
                url: BASE_URL + 'user/',
                data: {"email" : email, "password": password},
                config: { 'Content-Type': 'application/json'},
                withCredentials: true
            })

        }

        return service;
    }