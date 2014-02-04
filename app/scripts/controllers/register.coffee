'use strict'

angular.module('ngCoffeeApp')
  .directive 'validPasswordC', ->
    require: 'ngModel',
    link: (scope, elm, attrs, ctrl) ->
      ctrl.$parsers.unshift (viewValue, $scope) ->
        noMatch = viewValue != scope.regForm.inputPwd.$viewValue
        if noMatch
          document.getElementById('inputPwd2').setCustomValidity 'No match!'
        else
          document.getElementById('inputPwd2').setCustomValidity ''


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

    $scope.submit = ->
      console.log 'Submitting'
