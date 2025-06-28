Feature: Login de usuario y obtención del token

Background:
  * url 'https://thinking-tester-contact-list.herokuapp.com'
  * def credentials =
  """
  {
    "email": "eliana@gmail.com",
    "password": "Test12345"
  }
  """

Scenario: Autenticarse y obtener token
  Given path 'users/login'
  And request credentials
  When method post
  Then status 200
  And match response contains { token: '#notnull' }


