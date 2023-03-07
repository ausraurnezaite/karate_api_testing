Feature: Delete user using DELETE

  Background:
    * url 'https://gorest.co.in'
    * def requestPayload =
    """
     {
            "name": "zuikis",
            "email": "zuikis@zuikis.miau",
            "gender": "male",
            "status": "active"
        }
    """

  Scenario: delete user with the given user id
#    1. create user using POST
    Given  path '/public/v1/users'
    And request requestPayload
    And header Authorization = 'Bearer ' + tokenID
    When  method POST
    Then status 201
    And match $.data.id == '#present'

#   fetch user id
    * def userId = $.data.id
    * print userId

#  2. delete the same user
    Given  path '/public/v1/users/' + userId
    And header Authorization = 'Bearer ' + tokenID

    When method DELETE
    Then status 204

#    3. try to get the same user with user id

    Given  url baseUrl + '/public/v1/users/' + userId
    When  method GET
    Then status 404