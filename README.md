# Gratitude Journal Backend

* Practicing gratitude is one of the healthiest things you can do

* So, instead of writing a Todo App I wrote a simple CRUD app that forces you to be grateful

## Endpoints

* GET => /entries retrieves all entries
* POST => /entries creates a new entry

* GET => /entries/:id retrieves a specific entry
* PUT => /entries/:id updates an existing entry
* DELETE => /entries/:id deletes an existing entry

## Notable Functionality

* User id is just a string to allow for anoymous login 
* To allow this, we are going to generate a unique id in the frontend
* By requiring the user id to update and delete, the app forgos the need for authentication
