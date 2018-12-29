/**
 * Created by ania on 28.03.17.
 */
'use strict';

angular
    .module('myApp.profile')
    .factory('ProfileService', ProfileService);

    function ProfileService($http) {

        var user = {
            profile: {},
            friends: [],
            posts : []
        };

        const BASE_URL = "http://localhost/";

        var service = {
            getUser: getUser,
            logout: logout,
            editProfile: editProfile,
            addPost: addPost,
            deletePost: deletePost,
            editPost: editPost,
            likePost: likePost,
            addFriend: addFriend,
            deleteFriend: deleteFriend
        }

        function getUser() {
          return $http({
                method: 'GET',
                url: BASE_URL + 'user/profile/',
                config: { 'Content-Type': 'application/json'},
                withCredentials: true
            }).then(function (response) {
              if(!response.data.error)  {
                  user.profile = parseGetUserProfileResponse(response);
                  user.friends = parseGetUserFriendResponse(response);
                  user.posts = parseGetPostsResponse(response);
                  return user;
              } else {
                  console.log("nie mamy danych");
              }
          })
        }
        function parseGetUserProfileResponse(response) {
            var profile = jQuery.map(response.data.profile, function (item) {
                return {
                    id: item.IDUser,
                    first_name: item.firstname,
                    last_name: item.surename,
                    birth_date: item.birthdate,
                    password: item.password
                };
            });

            return profile.reduce(function(result, item) {
                result[item] = item;
                return result
            });
        }

        function parseGetUserFriendResponse(response) {
            return jQuery.map(response.data.friends, function (item) {
                return {
                    id: item.IDUser,
                    first_name: item.firstname,
                    last_name: item.surename,
                    birth_date: item.birthdate
                };
            });
        }

        function parseGetPostsResponse(response) {
            return jQuery.map(response.data.posts, function (item) {
                return {
                    author_id: item.ID,
                    message: item.description,
                    author_name: item.firstname + " " + item. surename,
                    post_date: item.datePost,
                    post_id: item.idPost,
                    likes: Number(item.likes)
                 };
            });
        }
        
        function logout() {
            return $http({
                method: 'POST',
                url: BASE_URL + 'user/',
                data: {"logout": "1"},
                config: { 'Content-Type': 'application/json'},
                withCredentials: true
            })
        }

        function editProfile(first_name, last_name, birth_date, password) {
            return $http({
                method: 'POST',
                url: BASE_URL + 'user/profile/',
                data: {"name": first_name, "surname": last_name, "birthDate": birth_date, "password": password},
                config: { 'Content-Type': 'application/json'},
                withCredentials: true
            })
        }

        function addPost(content) {
            return $http({
                method: 'POST',
                url: BASE_URL + 'user/profile/',
                data: {"post": "add", "description": content, "policy": "1"},
                config: { 'Content-Type': 'application/json'},
                withCredentials: true
            })
        }

        function deletePost(postId) {
            return $http({
                method: 'POST',
                url: BASE_URL + 'user/profile/',
                data: {"post": "remove", "idPost": postId},
                config: { 'Content-Type': 'application/json'},
                withCredentials: true
            })
        }

        function editPost(postId, content, currentDate) {
            return $http({
                method: 'POST',
                url: BASE_URL + 'user/profile/',
                data: {
                    "post": "edit",
                    "idPost": postId,
                    "description": content,
                    "policy": "1",
                    "datePost": currentDate
                },
                config: {'Content-Type': 'application/json'},
                withCredentials: true
            })
        }

        function likePost(postId) {
            return $http({
                method: 'POST',
                url: BASE_URL + 'user/profile/',
                data: {"post": "like", "idPost": postId},
                config: { 'Content-Type': 'application/json'},
                withCredentials: true
            })
        }

        function addFriend(friendId) {
            return $http({
                method: 'POST',
                url: BASE_URL + 'user/friend/',
                data: {"addFriend": "1", "id": friendId},
                config: { 'Content-Type': 'application/json'},
                withCredentials: true
            })
        }

        function deleteFriend(friendId) {
            return $http({
                method: 'POST',
                url: BASE_URL + 'user/friend/',
                data: {"removeFriend": "1", "id": friendId},
                config: { 'Content-Type': 'application/json'},
                withCredentials: true
            })
        }


        return service;
    }