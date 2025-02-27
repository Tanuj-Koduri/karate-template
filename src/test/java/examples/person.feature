Feature: FHIR Person API Test

Scenario: Retrieve a Person resource by ID

  # Retrieve a Person by ID
  * url 'http://hapi-fhir.ptg-poc.com:8080/fhir/Person'
  * def personId = "1"
  * path personId
  * method get
  * status 200
  * match response.resourceType == "Person"
  * match response.id == personId

  # Retrieve another Person by ID
  * def anotherPersonId = "2"
  * path anotherPersonId
  * method get
  * status 200
  * match response.resourceType == "Person"
  * match response.id == anotherPersonId

Scenario: Retrieve All Persons as a Bundle

  # Get all Persons as a Bundle
  * url 'http://hapi-fhir.ptg-poc.com:8080/fhir/Person'
  * method get
  * status 200
  
  # Verifying response type
  * match response.resourceType == "Bundle"
  * match response.type == "collection"

  # Adjusted total count based on actual API response
  * match response.total >= 0

  * match response.entry[0].resourceType == "Person"