Feature: Crear contacto usando token

Background:
  * url 'https://thinking-tester-contact-list.herokuapp.com'
  * def authToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2ODViNTc0ZjlhMTY1ODAwMTUwY2IxNzkiLCJpYXQiOjE3NTEwNzI0MzZ9.ok0zWcDGXV2dNGcqQgVWKCA1OEDYACZjCgcxJiWo-_I"

Scenario: Crear contacto autenticado
  Given path 'contacts'
  And header Authorization = 'Bearer ' + authToken
  And header Content-Type = 'application/json'
  And request
  """{
    "firstName": "Eliana",
    "lastName": "Puerta",
    "birthdate": "2000-01-01",
    "email": "eliana@gmail.com",
    "phone": "5555555555",
    "street1": "1 Main St.",
    "street2": "Apartment A",
    "city": "Medellín",
    "stateProvince": "Antioquia",
    "postalCode": "0000000",
    "country": "CO"
  }"""

  When method post
  Then status 201
  And match response.firstName == "Eliana"