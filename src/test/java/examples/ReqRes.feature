Feature: ReqRes API Test

Scenario: Create, Retrieve, Update, and Delete a User

  # Create a new user
  * url 'https://reqres.in/api/users'
  * request 
    """
    {
      "name": "Karate Tester",
      "job": "Automation Engineer"
    }
    """
  * method post
  * status 201
  * print 'Create User Response:', response
  * def existingUserId = response.id
  * match response.name == "Karate Tester"
  * match response.job == "Automation Engineer"

  # Update the user's job title
  * url 'https://reqres.in/api/users'
  * path existingUserId
  * request 
    """
    {
      "name": "Karate Tester",
      "job": "Senior Automation Engineer"
    }
    """
  * method put
  * status 200
  * print 'Update User Response:', response
  * match response.name == "Karate Tester"
  * match response.job == "Senior Automation Engineer"

  # Simulate delete request (ReqRes returns 204)
  * url 'https://reqres.in/api/users'
  * path existingUserId
  * method delete
  * status 204
  * print 'User deleted successfully'