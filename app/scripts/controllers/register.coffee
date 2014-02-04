'use strict'

# Directive for password matching
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

    url = "http://hello.freeluna.it/create"
    cbUrl = "callback=JSON_CALLBACK";
    #url = "http://hello.freeluna.it/create";

    $scope.isRegistered = false

    $scope.genders = [
      type: 'Maschio'
      value: 'M'
    ,
      type: 'Femmina'
      value: 'F'
    ]

    $scope.phonePrefixes = [ # +39, +49, +41
      text: '+39'
      value: '+39'
    ,
      text: '+49'
      value: '+49'
    ,
      text: '+41'
      value: '+41'
    ]

    # default values
    $scope.u =
      gender: 'M'
      phonePrefix: '+39'

    # submitting function, will do the AJAX
    $scope.mySubmit = ->
      $scope.errors = []
      # Porting fields with 'strange' names
      $scope.u['mobile-phone-prefix'] = $scope.u.phonePrefix
      $scope.u['mobile-phone'] = $scope.u.phone
      # fix: angular converts 1 to true. I will investigate in future.
      $scope.u.terms = 1
      # console.log 'Submitting'
      # console.log JSON.stringify $scope.u
      # transform JSON to query string
      params = $.param $scope.u
      # console.log 'Param query string: ' + params
      $http.jsonp(url + '?' + params + '&' + cbUrl).success (data, status) ->
        # console.log "Got response:"
        # console.log JSON.stringify data
        # check response # {"status":"ko","errors":{"username":{"param":"username","msg":"Username già utilizzato","value":"ciaociao"}}}
        if data.status is 'ko'
          # fill errors
          $scope.errors.push { message: 'Errore sconosciuto' } if not data.errors
          $scope.errors.push ({ message: error.msg || 'Errore sconosciuto', param: error.param }) for paramName, error of data?.errors
        else
          $scope.isRegistered = true
