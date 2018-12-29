/**
 * Created by ania on 28.03.17.
 */
'use strict';

angular
    .module('myApp.registration')
    .factory('RegistryService', RegistryService);

    function RegistryService($http) {

        const BASE_URL = "http://localhost/";

        var service = {
            registry: registry
        };


        function registry(first_name, last_name, birth_date, email, password) {

            return $http({
                method: 'POST',
                url: BASE_URL + 'user/',
                data: {"name": first_name, "surname": last_name, "birthDate": birth_date, "email": email, "password": password},
                config: { 'Content-Type': 'application/json'}
            })

        }

        return service;
    }