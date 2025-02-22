# Advanced Flutter Development - Device Features Module

## add Biometric Authentication using Fingerprint
Do you remember your shopping app?
you need biometric authentication to access your profile page 

### Requirement 1
  - Title: add profile icon at the top right of the page
  - Description: this profile page should contain your image, full name, email.
### Requirement 2
  - Title: add biometric authentication 
  - Description: you need to add authentication using a fingerprint in order to be able to access your profile so once profile icon pressed it asks the user for his fingerprint to access his profile.
==================================================
#### Draft
  - add `local_auth` package to pubspec.yml.
  - create `biometric` class to manage the device sensor.
  - add `method` loginWithBiometric in controller.
  - use biometric class in `login` to check if logged before or first:
    - first login: hide option and login with email and password.
    - logged before: after logout user can log with biometric using stored credential.
  