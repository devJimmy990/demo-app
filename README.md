# Flutter Fundamentals - Navigation Module

##  Create signUp page
based on the task which you were asked to make shopping app interface
make signup page to access the shopping screen
(Note you are asked to create each page as a new file in the lib folder in your project)"

- Title: create SignUp page
- Description: create your login page where you have to add a form that contains 4 input fields: 
  - Full name field that validates that the first letter is `capitalized`,
  - The email field that validates it `contains @`
  - password field that validates that it has at `least 6 characters`
  - confirm the password field that validates that it is the `same as the password` field
  - add sign-up button once all the data are `validated` it should show ""account created successfully""  in a dialog 
  - once the close button in the dialog is clicked it should `navigate` the user to the shopping screen.
  - but if not all the data is validated it should show a snack bar that has an error message if the first letter in the full name is not capitalized, or the email does not have @, if the password is less than 6 characters, or if the confirm field does not match with the password field.

==================================================
#### Draft
  - `based` on the shopping branch i`ll add the following. 
  - create `login page` as stateless widget with input {input-email, input-password, btn-login, btn-navigate}:
  - create `register page` as stateless widget with input {input-first-name, input-last-name, input-username,input-phone, input-email, input-password,input-confirm-password, btn-create-account, btn-navigate}:

    - create `validator` class for:
      - name: `required`, `more than 3`, `less than 15`, `first chat is capital`, `only letters`
      - phone: `required`, `length is 11`, `start with 01`, `option to choose 0125`, `rest number with length 8`
      - username: `required`, `more than 3`, `less than 15`, `accept letters and special char`
      - email: `required`, contain `@` and `.`
      - password `required`, `more than 6`, must have `capital letter`, `small letter`, `number` and `special char`
      - confirm-password `required`, `match password`
    - if data are valid navigate automatically to shopping page and can`t back 
    - else show error message that defined in `validator` class
