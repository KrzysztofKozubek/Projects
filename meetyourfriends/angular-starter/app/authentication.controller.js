/**
 * Created by ksyta on 2017-04-26.
 */
angular.module('myApp.auth', ['ngCookies'])

    .controller('AuthenticationController', AuthenticationController);

function AuthenticationController($rootScope, $cookies, $state) {
        $rootScope.$on('$stateChangeStart', function(event, toState, toParams, fromState, fromParams) {
            console.log('requireAuth = ' + toState.requireAuth);
            console.log('cookies = ' + $cookies.get('isLogged'));
            if(toState.requireAuth && (!$cookies.get('isLogged') || typeof $cookies.get('isLogged') === "undefined")) {
                $state.go('login')
            }
        })
}