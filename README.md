# Advanced Flutter Development - Device Features Module

##  create a simple page shows the device model and os version
The aim of this task is to know how to retrieve information about the device you are using


- Title: show your device model and os version
- Design a page and add in the center of it text that displays the device model name and its operating system version.

==================================================
#### Draft
  - add `awesome_dialog` `device_info_plus` packages to pubspec.yml
  - create `device_info_model` to manage the device info 
  - create `device_info` class as singleton class to load the device info
  - use class device_info in `app_drawer` to display the device info using `awesome_dialog`