# Data Handling - API

##  displays user details
Fetch employee data using Dio and implement error handling using try-catch then parse JSON responses and map them to model then cache the employee list locally.


- Title: Shows detailed information about the selected employee, including their name, position, and salaries
- Description: 
    - Fetch employee data using dio from the API endpoint: https://dummyjson.com/users.
    - Implement proper error handling using try-catch.
    - Navigate between two screens and pass data to the details page.
    - Display a loading indicator while fetching data.
    - Cache the employee list locally using shared_preferences and load it on app restart.

==================================================
#### Draft
  - `based on` api - list of users task `https://github.com/devJimmy990/demo-app/tree/api-display-list-of-employees`
  - add `shared_preferences` for local caching. 
  - define `user-model` to map data.
  - initialize `singleton-shared_preferences` class with {getSting, setString} methods.
  - `on-restart` check caching data:
    - case: have cached `parse` data to list and display directly.
    - case: no cached use `api` to load data and then cached them.