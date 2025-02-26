# Advanced Flutter Development - Design Patterns Module

## simple payment system
create a simple payment system using SOLID principles.

  - Title: create a simple payment system using SOLID principles.
  - Description: 
    - create payment class and its methods (cash payment, credit payment). 
    - Apply SOLID principles to it.


==================================================
#### Draft
  - `create` payment `sealed` class
  - implement `payment` to payment methods {cash, credit}
  - define `processor` class to manage payment
  - create `payment-screen` to display the amount of payment with changeable value
  - create `payment-processor` to handle payment method {`cash`, `credit`}
  - show `snack-bar` for action
