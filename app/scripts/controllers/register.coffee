'use strict'

angular.module('ngCoffeeApp')
  .controller 'RegisterCtrl', ($scope, $http) ->

    $scope.genders = [
      type: 'Maschio'
      value: 'M'
    ,
      type: 'Femmina'
      value: 'F'
    ]

    $scope.u =
      gender: 'M'
