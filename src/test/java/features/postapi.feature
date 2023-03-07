Feature: Create user with random email using POST

  Background:
    * url baseUrl

    * def randomEmail =
    """
    function () {
      return Date.now() + "@email.com";
    }
    """

    * def requestPayload =
    """
     {
            "name": "zuikis",
            "gender": "male",
            "status": "active"
        }
    """
    * requestPayload.email = randomEmail()
    * print requestPayload

  Scenario: create user with given data
    Given  path '/public/v1/users'
    And request requestPayload
    And header Authorization = 'Bearer ' + tokenID

    When  method POST
    Then status 201
    And match $.data.id == '#present'
    And match $.data.name == userName