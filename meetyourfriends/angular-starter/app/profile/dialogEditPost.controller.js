/**
 * Created by patrycja on 2017-05-22.
 */
'use strict';

angular.module('myApp.post_dialog', ['ngAnimate', 'ngMaterial', 'toaster'])


    .controller('DialogEditPostController', DialogEditPostController);

function DialogEditPostController($mdDialog, $scope, ProfileService, toaster, $state, postId, postMessage) {

    var dialogEditPostCtrl = this;
    $scope.postId = postId;
    $scope.postMessage = postMessage;
    $scope.currentDateTime = '';

    dialogEditPostCtrl.getCurrentDate = function () {
        var currentDate = new Date();
        var todayUTC = new Date(Date.UTC(currentDate.getFullYear(), currentDate.getMonth(), currentDate.getDate(),
                                currentDate.getHours(), currentDate.getMinutes(), currentDate.getSeconds()));
        todayUTC = todayUTC.toISOString().slice(0, -5).replace(/T/i, ' ');
        $scope.currentDateTime = todayUTC;
    };

    $scope.submit = function(postId) {
        dialogEditPostCtrl.getCurrentDate();
        ProfileService.editPost(postId, $scope.postMessage, $scope.currentDateTime).then(function (response) {
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