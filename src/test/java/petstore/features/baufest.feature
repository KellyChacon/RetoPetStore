Feature: Operaciones petstore
  Scenario: Post Agregar Mascota
    * def requestBody =
"""
{
  "id": 0,
  "category": {
    "id": 0,
    "name": "string"
  },
  "name": "Bills",
  "photoUrls": [
    "string"
  ],
  "tags": [
    {
      "id": 0,
      "name": "string"
    }
  ],
  "status": "available"
}
"""
    Given header accept = 'application/json'
    And header  Content-Type = 'application/json'
    And url 'https://petstore.swagger.io/v2/pet'
    And request requestBody
    When method POST
    Then status 200
    And match response.status == "available"

  Scenario: GET Buscar Mascota
    Given url 'https://petstore.swagger.io/v2/pet/9223372036854024612'
    And header accept = 'application/json'
    When method GET
    Then status 200
    And match response.status == "available"

  Scenario: PUT Modificar Mascota
    Given url 'https://petstore.swagger.io/v2/pet'
    And header accept = 'application/json'
    And header  Content-Type = 'application/json'
    When request
    """
    {
  "id": 0,
  "category": {
    "id": 0,
    "name": "string"
  },
  "name": "Minino",
  "photoUrls": [
    "string"
  ],
  "tags": [
    {
      "id": 0,
      "name": "string"
    }
  ],
  "status": "available"
   }
    """
    And method PUT
    Then status 200
    And match response.name == "Minino"
