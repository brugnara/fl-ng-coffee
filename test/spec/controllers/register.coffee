'use strict'

describe 'Controller: RegisterCtrl', () ->

  # load the controller's module
  beforeEach module 'ngCoffeeApp'

  RegisterCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    RegisterCtrl = $controller 'RegisterCtrl', {
      $scope: scope
    }

  it 'should have 2 genders', () ->
    expect(scope.genders.length).toBe 2

  it 'should be M', ->
    expect(scope.genders[0].value).toBe 'M'

  it 'should be F', ->
    expect(scope.genders[1].value).toBe 'F'

  it 'should be Maschio', ->
    expect(scope.genders[0].type).toBe 'Maschio'

  it 'should be Femmina', ->
    expect(scope.genders[1].type).toBe 'Femmina'

  # default server
  it 'should have 2 servers', ->
    expect(scope.servers.length).toBe 2

  it 'should be freeluna', ->
    expect(scope.servers[0].value).toBe 'freeluna'

  it 'should be node', ->
    expect(scope.servers[1].value).toBe 'node'

  # phone prefixes
  it 'should have 3 prefixes', ->
    expect(scope.phonePrefixes.length).toBe 3

  it 'should be +39', ->
    expect(scope.phonePrefixes[0].value).toBe '+39'

  it 'should be +49', ->
    expect(scope.phonePrefixes[1].value).toBe '+49'

  it 'should be +41', ->
    expect(scope.phonePrefixes[2].value).toBe '+41'

  it 'should be text +39', ->
    expect(scope.phonePrefixes[0].text).toBe '+39'

  it 'should be text +49', ->
    expect(scope.phonePrefixes[1].text).toBe '+49'

  it 'should be text +41', ->
    expect(scope.phonePrefixes[2].text).toBe '+41'

  # default values
  it 'should be gender: M', ->
    expect(scope.u.gender).toBe 'M'

  it 'should be phonePrefix: +39', ->
    expect(scope.phonePrefix).toBe '+39'

  it 'should be server: freeluna', ->
    expect(scope.server).toBe 'freeluna'

  # test checkParameters
  it 'should be not registered', ->
    expect(scope.isRegistered).toBe false

  it 'should be not registered after passing fake data', ->
    scope.checkResponse(null)
    expect(scope.isRegistered).toBe false

  it 'should be not registered after passing data with status KO', ->
    scope.checkResponse( { status: 'ko', errors: {} } )
    expect(scope.isRegistered).toBe false

  it 'should be registered after passing correct data', ->
    scope.checkResponse( { status: 'ok' })
    expect(scope.isRegistered).toBe true
