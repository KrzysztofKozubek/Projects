/**
 * Created by ksyta on 2017-05-25.
 */
'use strict';

angular.module('myApp.search', ['ngAnimate',
    'toaster',
    'ngMaterial'])
    .controller('SearchController', SearchController);

function SearchController(SearchService, $state, $scope, $rootScope) {
    var searchCtrl = this;

    $scope.searchingUser = {};

    searchCtrl.querySearch = function (query) {
        return SearchService.searchUser(query);
    };

    searchCtrl.selectedItemChange = function (item) {
      if(item !== undefined) {
          $rootScope.$broadcast('on-new-user-event', { userId: item.id });
      }
    };

}
