/**
 * Created by ksyta on 2017-05-25.
 */

'use strict';

angular
    .module('myApp.search')
    .factory('SearchService', SearchService);

function SearchService($http) {

    const BASE_URL = "http://localhost/";

    var searchingUser = {
        profile: {},
        friends: [],
        posts : []
    };


    return {
        searchUser: searchUser,
        getSearchingUser: getSearchingUser
    };


    function searchUser(inputValue) {
        return $http({
            method: 'POST',
            url: BASE_URL + 'user/profile/',
            data: {"search": inputValue},
            withCredentials: true
        }).then(function (response) {
            if(response.data) {
                return parseGetUser(response);
            } else {
                console.log("nie ma response");
                return [];
            }
        })
    }

    function parseGetUser(response) {
        return jQuery.map(response.data.search, function(item) {
            return {
                id: item.IDUser,
                first_name: item.firstname,
                last_name: item.surename
            };
        });
    }

    function getSearchingUser(idSearchingUser) {
        return $http({
            method: 'GET',
            url: BASE_URL + 'user/profile/?id=' + idSearchingUser,
            config: { 'Content-Type': 'application/json'},
            withCredentials: true
        }).then(function (response) {
            if(!response.data.error)  {
                searchingUser.profile = parseGetUserProfileResponse(response);
                searchingUser.friends = parseGetUserFriendResponse(response);
                searchingUser.posts = parseGetPostsResponse(response);
                return searchingUser;
            } else {
                console.log("nie mamy danych");
            }
        })
    }
    function parseGetUserProfileResponse(response) {
        var profile = jQuery.map(response.data.profile, function (item) {
            return {
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
            console.log("ITEM = "+JSON.stringify(item));
            return {
                author_id: item.IDUser,
                message: item.description,
                author_name: searchingUser.profile.first_name + " " + searchingUser.profile.last_name,
                post_date: item.datePost,
                post_id: item.ID,
                likes: Number(item.likes)
            };
        });
    }
}