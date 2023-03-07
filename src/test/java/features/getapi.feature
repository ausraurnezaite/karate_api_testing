Feature: GET API

  @positive
  Scenario: get user details
    Given  url baseUrl + '/public/v1/users'
    And path userID
    And header Authorization = 'Bearer ' + tokenID
    When  method GET
    Then status 200
    * print response
    * def jsonResponse = response
    * def name = jsonResponse.data.name
    * print name
    * match name == userName

  @negative
  Scenario: get user details - user not found

    Given  url baseUrl + '/public/v1/users'
    And path '1'
    When  method GET
    Then status 404