'use strict';

angular.module('myApp.profile', ['ngCookies', 'toaster', 'ngAnimate', 'ngMaterial'])


.controller('ProfileController', ProfileController);

function ProfileController(ProfileService, SearchService, $scope, $state, $cookies, toaster, $mdDialog) {

    $scope.txt = 'Hello';
    var profileCtrl = this;

    $scope.searchingUser = false;
    $scope.user = {};
    profileCtrl.content = '';
    $scope.showFriends = true;

    $scope.$on('on-new-user-event', showSearchingUserProfile);
    $scope.$on('$stateChangeSuccess', showProfile);

    profileCtrl.reloadState = function () {
        $state.go($state.current, {}, {reload: true});
    };

    function showSearchingUserProfile(event, args) {
        $scope.friendId = args.userId;
        var loggedUserId = $scope.user.profile.id;
        SearchService.getSearchingUser($scope.friendId).then(function(result) {
            $scope.user = result;
            $scope.user.id = loggedUserId;
            $scope.searchingUser = true;
            $scope.txt = 'User ';
            console.log($scope.user.friends.indexOf(loggedUserId))
            var ids = $scope.user.friends.map(function(user) {
                return user.id;
            });
            if (ids.indexOf(loggedUserId) === -1) {
                $scope.isFriend = false;
            } else {
                $scope.isFriend = true;
            }
        });
    }

    function showProfile () {
        ProfileService.getUser().then(function(user) {
            $scope.user = user
        })
    }

    profileCtrl.showDialog = function(ev) {

        $mdDialog.show({
            controller: DialogController,
            templateUrl: "dialogEditProfile.tmpl.html",
            parent: angular.element(document.body),
            targetEvent: ev,
            clickOutsideToClose:true,
            locals: {
                user: $scope.user
            },
            fullscreen: $scope.customFullscreen // Only for -xs, -sm breakpoints.
        })
    };

    profileCtrl.showEditPostDialog = function(ev) {
        console.log(ev);
        $mdDialog.show({
            controller: DialogEditPostController,
            templateUrl: "dialogEditPost.tmpl.html",
            parent: angular.element(document.body),
            targetEvent: ev,
            clickOutsideToClose:true,
            resolve: {
                postId: function () {
                    return ev.post_id
                },
                postMessage: function () {
                    return ev.message
                }
            },
            fullscreen: $scope.customFullscreen // Only for -xs, -sm breakpoints.
        })
    };

    profileCtrl.deletePost = function(post) {
        ProfileService.deletePost(post.post_id).then(function (response) {
            if(response.data.removePost == 1) {
                toaster.pop({
                    type: 'success',
                    title: 'Delete successful',
                    body: 'it was easy',
                    onHideCallback: function () {
                        $state.reload();
                    }
                });
            } else {
                toaster.pop('error', "Delete failed", 'something goes wrong');
            }
        })

    };


    profileCtrl.logout = function () {
            ProfileService.logout().then(function (response) {
                if(response.data.success){
                    $cookies.remove('isLogged')
                    toaster.pop({
                        type: 'success',
                        title: 'Logout successful',
                        body: 'redirection',
                        onHideCallback: function () {
                            $state.go('login')
                        }
                    });
                } else {
                    toaster.pop('error', "Logout failed", 'something goes wrong');
                }
            })
        }
        
        profileCtrl.addPost = function () {
            ProfileService.addPost(profileCtrl.content).then(function (response) {
                if(response.data.addPost){
                    toaster.pop({
                        type: 'success',
                        title: 'Add post successful',
                        body: 'it\'s for free',
                        onHideCallback: function () {
                            $state.reload();
                        }
                    });
                } else {
                    toaster.pop('error', "Logout failed", 'something goes wrong');
                }
            })
        }

        profileCtrl.likePost = function(post) {
            ProfileService.likePost(post.post_id).then(function (response) {
                if(response.data.likePost == 1) {
                    post.likes = post.likes + 1;
                    toaster.pop({
                        type: 'success',
                        title: 'Like successful',
                        body: 'it was easy'
                    });
                } else {
                    toaster.pop('error', "Like failed", 'something goes wrong');
                }
            })
        };
        profileCtrl.addFriend = function() {
            ProfileService.addFriend($scope.friendId).then(function (response) {
                if(response.statusText === "OK"){
                    toaster.pop({
                        type: 'success',
                        title: 'You succesfully added friend',
                        body: 'it was easy',
                        onHideCallback: function () {
                            $state.reload();
                        }
                    });
                }
                else {
                    toaster.pop('error', "AddFriend failed", 'something goes wrong');
                }
            })
        }
    profileCtrl.deleteFriend = function() {
        ProfileService.deleteFriend($scope.friendId).then(function (response) {
            if(response.statusText === "OK"){
                toaster.pop({
                    type: 'success',
                    title: 'You succesfully removed friend',
                    body: 'it was easy',
                    onHideCallback: function () {
                        $state.reload();
                    }
                });
            }
            else {
                toaster.pop('error', "DeleteFriend failed", 'something goes wrong');
            }
        })
    }
}