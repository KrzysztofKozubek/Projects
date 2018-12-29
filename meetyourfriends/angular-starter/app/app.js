'use strict';

// Declare app level module which depends on views, and components
angular.module('myApp', [
	'ngAnimate',
	'ui.router',
    'angularCSS',
    'myApp.login',
    'myApp.registration',
    'myApp.profile',
    'myApp.auth',
	'myApp.dialog',
	'myApp.search',
	'myApp.post_dialog'
])
.config(function ($stateProvider, $urlRouterProvider) {

	$stateProvider
		.state('login', {
			url: '/login',
			templateUrl: 'login/login.html',
			controller: 'LoginController as loginCtrl',
			css: 'login/login.css',
            requireAuth: false
		})

		.state('registration', {
			url: '/registration',
			templateUrl: 'registration/registration.html',
			controller: 'RegistrationController as registrationCtrl',
            css: 'registration/registration.css',
            requireAuth: false
		})

        .state('profile', {
            url: '/profile',
			views: {
            	'@': {
                    templateUrl: 'profile/profile.html',
                    controller: 'ProfileController as profileCtrl',
                    css: 'profile/profile.css'
				},
                'details@profile': {
                    templateUrl: 'profile/profile.details.html',
                    controller: 'ProfileController as profileCtrl',
                    css: 'profile/profile.css'
                },
				'posts@profile': {
            		templateUrl: 'profile/profile.posts.html',
					controller: 'ProfileController as profileCtrl',
					css: 'profile/profile.css'
				},
				'search@profile': {
            		templateUrl: 'search/profile.search.html',
					controller: 'SearchController as searchCtrl',
					css: 'search/search.css'
				}
			},
			requireAuth: true
        });


    $urlRouterProvider.otherwise('/login');
});
