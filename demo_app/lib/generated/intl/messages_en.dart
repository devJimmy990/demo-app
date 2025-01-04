// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "account_created": MessageLookupByLibrary.simpleMessage(
            "Account Created Successfully"),
        "capital_name": MessageLookupByLibrary.simpleMessage(
            "Name must start with a capital letter"),
        "confirm_password":
            MessageLookupByLibrary.simpleMessage("Confirm Password"),
        "create": MessageLookupByLibrary.simpleMessage("create"),
        "create_account":
            MessageLookupByLibrary.simpleMessage("create account"),
        "create_account_try":
            MessageLookupByLibrary.simpleMessage("create account or try again"),
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "email_exist":
            MessageLookupByLibrary.simpleMessage("This email already exists"),
        "email_username":
            MessageLookupByLibrary.simpleMessage("Email or Username"),
        "first_name": MessageLookupByLibrary.simpleMessage("First Name"),
        "have_account":
            MessageLookupByLibrary.simpleMessage("Already have an account?"),
        "hot_offer": MessageLookupByLibrary.simpleMessage("hot_offers"),
        "invalid_email": MessageLookupByLibrary.simpleMessage(
            "invalid email format e.g. jimmy@example.com"),
        "invalid_login":
            MessageLookupByLibrary.simpleMessage("invalid email or password"),
        "invalid_name":
            MessageLookupByLibrary.simpleMessage("name must be a-z, A-Z"),
        "invalid_password": MessageLookupByLibrary.simpleMessage(
            "Password must contain:\n\t\t\t\t\tNumbers { 0 - 9 }\n \t\t\t\tUppercase Letter { A - Z }\n \t\t\t\tLowercase Letter { a - z }\n \t\t\t\tSpecial Character { @ \$ ! % * ? & - }"),
        "invalid_phone": MessageLookupByLibrary.simpleMessage(
            "invalid phone number format e.g. 0128223643"),
        "last_name": MessageLookupByLibrary.simpleMessage("Last Name"),
        "login": MessageLookupByLibrary.simpleMessage("login"),
        "login_success":
            MessageLookupByLibrary.simpleMessage("login successful"),
        "long_name": MessageLookupByLibrary.simpleMessage(
            "Name must be less than 15 characters"),
        "long_username": MessageLookupByLibrary.simpleMessage(
            "Username must be less than 15 characters"),
        "no_account":
            MessageLookupByLibrary.simpleMessage("Don\'t have an account?"),
        "ok": MessageLookupByLibrary.simpleMessage("oK"),
        "our_products": MessageLookupByLibrary.simpleMessage("Our Products"),
        "password": MessageLookupByLibrary.simpleMessage("password"),
        "password_not_match":
            MessageLookupByLibrary.simpleMessage("password not match"),
        "phone_number": MessageLookupByLibrary.simpleMessage("Phone Number"),
        "products": MessageLookupByLibrary.simpleMessage("products"),
        "redirect_login":
            MessageLookupByLibrary.simpleMessage("redirect to login page"),
        "redirect_shopping": MessageLookupByLibrary.simpleMessage(
            "will redirect to shopping page"),
        "required": MessageLookupByLibrary.simpleMessage("required"),
        "shopping_app_bar":
            MessageLookupByLibrary.simpleMessage("Shopping Page"),
        "short_name": MessageLookupByLibrary.simpleMessage("Name is too short"),
        "short_password": MessageLookupByLibrary.simpleMessage(
            "Password must be more than 6 characters"),
        "short_username":
            MessageLookupByLibrary.simpleMessage("Username is too short"),
        "strong_username": MessageLookupByLibrary.simpleMessage(
            "enter strong username a-z, A-Z, 0-9, { @ - _ # }"),
        "username": MessageLookupByLibrary.simpleMessage("Username"),
        "username_exist":
            MessageLookupByLibrary.simpleMessage("This username already exists")
      };
}
