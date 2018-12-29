'use strict';

angular.module('myApp.registration', ['toaster', 'ngAnimate'])


.controller('RegistrationController', RegistrationController);

function RegistrationController(RegistryService, $state, toaster) {
	var registrationCtrl = this;

	registrationCtrl.first_name = '';
	registrationCtrl.last_name = '';
	registrationCtrl.birth_date;
	registrationCtrl.email = '';
	registrationCtrl.password = '';


	registrationCtrl.registry = function () {
        RegistryService.registry(registrationCtrl.first_name, 
        						registrationCtrl.last_name, 
        						registrationCtrl.birth_date.toISOString().slice(0, 10),
        						registrationCtrl.email,
        						registrationCtrl.password)
			.then(function (response) {
				if(response.data.success) {
                    toaster.pop({
                        type: 'success',
                        title: 'Registration successful',
                        body: 'redirection',
                        onHideCallback: function () {
                            $state.go('login')
                        }
                    });
				} else {
                    toaster.pop('error', "Registration failed", 'something goes wrong');
				}

        })
    }

}