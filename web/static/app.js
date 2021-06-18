"use strict";

var lab = angular.module('lab', []);

lab.controller('LabCtrl', function ($scope, $http, $timeout) {
  $scope.noun1 = "";
  $scope.noun2 = "";
  $scope.adjective1 = "";
  $scope.adjective2 = "";
  $scope.verb = "";

  getWord($http, $timeout, '/words/noun?n=1', function(resp1) {
    $scope.noun1 = word(resp1);
  });

  getWord($http, $timeout, '/words/adjective?a=1', function(resp) {
    var adj = word(resp);
    adj.word = adj.word.charAt(0).toUpperCase() + adj.word.substr(1)
    $scope.adjective1 = adj;
  });

  getWord($http, $timeout, '/words/verb', function(resp) {
    $scope.verb = word(resp);
  });

  getWord($http, $timeout, '/words/noun?n=2', function(resp2) {
    $scope.noun2 = word(resp2);
  });

  getWord($http, $timeout, '/words/adjective?n=2', function(resp) {
    $scope.adjective2 = word(resp);
  });
});

function getWord($http, $timeout, url, callback) {
  $http.get(url).then(callback, function(resp) {
    $timeout(function() {
      console.log("Retry: " + url);
      getWord($http, $timeout, url, callback);
    }, 500);
  });
}

function word(resp) {
  return {
    word: resp.data.word,
    hostname: resp.headers()["source"]
  };
}
