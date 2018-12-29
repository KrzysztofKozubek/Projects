/**
 * Created by ksyta on 2017-05-22.
 */
'use strict';

angular.module('myApp.dialog', ['ngAnimate', 'ngMaterial', 'toaster'])


    .controller('DialogController', DialogController);

function DialogController($mdDialog, $scope, ProfileService, user, toaster, $state) {

    var dialogCtrl = this;
    $scope.user = user.profile;


    $scope.submit = function() {
        ProfileService.editProfile($scope.user.first_name, $scope.user.last_name,
            $scope.user.birth_date, $scope.user.password).then(function (response) {
                if(!response.data.error){
                    toaster.pop({
                        type: 'success',
                        title: 'Edit successful',
                        body: 'congrats!',
                        onHideCallback: function () {
                            $mdDialog.hide();
                            $state.reload();
                        }
                    });
                } else {
                    toaster.pop('error', "Edit failed", 'something goes wrong');
                }
            })
    };

    $scope.cancel = function() {
        $mdDialog.cancel();
    };
}