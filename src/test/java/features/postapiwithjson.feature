Feature: Create user with data from json and random email using POST

  Background:
    * url baseUrl
    * def requestPayload = read('../../resources/user.json')
    * requestPayload.email = randomEmail()
    * print requestPayload

  Scenario: create user with given data
    Given  path '/public/v1/users'
    And request requestPayload
    And header Authorization = 'Bearer ' + tokenID

    When  method POST
    Then status 201
    And match $.data.id == '#present'
    And match $.data.name == requestPayload.name