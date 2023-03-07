Feature: GET API Headers

  Scenario: get user with headers 1
    Given header Accept-Encoding = 'gzip, deflate, br'
    And header Connection = 'keep-alive'
    And header Authorization = 'Bearer ' + tokenID

    When  url baseUrl + '/public/v1/users'
    And path userID
    When  method GET
    Then status 200
    * print response

  Scenario: get user with headers 2
    * def request_headers = {Accept-Encoding: 'gzip, deflate, br', Connection: 'keep-alive', Authorization: 'Bearer b20f5e4d19f1b37bea86c80f780cbd522048cbfae144dbae19f0b40b302395e4' }

    Given headers request_headers
    When  url baseUrl + '/public/v1/users'
    And path userID
    When  method GET
    Then status 200
    * print response

  Scenario: get user with headers 2
    * configure headers = {Accept-Encoding: 'gzip, deflate, br', Connection: 'keep-alive', Authorization: 'Bearer b20f5e4d19f1b37bea86c80f780cbd522048cbfae144dbae19f0b40b302395e4' }

    When  url baseUrl + '/public/v1/users'
    And path userID
    When  method GET
    Then status 200
    * print response