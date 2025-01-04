// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  // skipped getter for the '_comment-login' key

  /// `login successful`
  String get login_success {
    return Intl.message(
      'login successful',
      name: 'login_success',
      desc: '',
      args: [],
    );
  }

  /// `invalid email or password`
  String get invalid_login {
    return Intl.message(
      'invalid email or password',
      name: 'invalid_login',
      desc: '',
      args: [],
    );
  }

  /// `will redirect to shopping page`
  String get redirect_shopping {
    return Intl.message(
      'will redirect to shopping page',
      name: 'redirect_shopping',
      desc: '',
      args: [],
    );
  }

  /// `create account or try again`
  String get create_account_try {
    return Intl.message(
      'create account or try again',
      name: 'create_account_try',
      desc: '',
      args: [],
    );
  }

  /// `oK`
  String get ok {
    return Intl.message(
      'oK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `create`
  String get create {
    return Intl.message(
      'create',
      name: 'create',
      desc: '',
      args: [],
    );
  }

  /// `login`
  String get login {
    return Intl.message(
      'login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get no_account {
    return Intl.message(
      'Don\'t have an account?',
      name: 'no_account',
      desc: '',
      args: [],
    );
  }

  /// `create account`
  String get create_account {
    return Intl.message(
      'create account',
      name: 'create_account',
      desc: '',
      args: [],
    );
  }

  /// `Email or Username`
  String get email_username {
    return Intl.message(
      'Email or Username',
      name: 'email_username',
      desc: '',
      args: [],
    );
  }

  /// `password`
  String get password {
    return Intl.message(
      'password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the '_comment-register' key

  /// `First Name`
  String get first_name {
    return Intl.message(
      'First Name',
      name: 'first_name',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get last_name {
    return Intl.message(
      'Last Name',
      name: 'last_name',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phone_number {
    return Intl.message(
      'Phone Number',
      name: 'phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get username {
    return Intl.message(
      'Username',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirm_password {
    return Intl.message(
      'Confirm Password',
      name: 'confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get have_account {
    return Intl.message(
      'Already have an account?',
      name: 'have_account',
      desc: '',
      args: [],
    );
  }

  /// `Account Created Successfully`
  String get account_created {
    return Intl.message(
      'Account Created Successfully',
      name: 'account_created',
      desc: '',
      args: [],
    );
  }

  /// `This email already exists`
  String get email_exist {
    return Intl.message(
      'This email already exists',
      name: 'email_exist',
      desc: '',
      args: [],
    );
  }

  /// `This username already exists`
  String get username_exist {
    return Intl.message(
      'This username already exists',
      name: 'username_exist',
      desc: '',
      args: [],
    );
  }

  /// `redirect to login page`
  String get redirect_login {
    return Intl.message(
      'redirect to login page',
      name: 'redirect_login',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the '_comment-validation' key

  /// `required`
  String get required {
    return Intl.message(
      'required',
      name: 'required',
      desc: '',
      args: [],
    );
  }

  /// `Name must start with a capital letter`
  String get capital_name {
    return Intl.message(
      'Name must start with a capital letter',
      name: 'capital_name',
      desc: '',
      args: [],
    );
  }

  /// `Name is too short`
  String get short_name {
    return Intl.message(
      'Name is too short',
      name: 'short_name',
      desc: '',
      args: [],
    );
  }

  /// `Name must be less than 15 characters`
  String get long_name {
    return Intl.message(
      'Name must be less than 15 characters',
      name: 'long_name',
      desc: '',
      args: [],
    );
  }

  /// `name must be a-z, A-Z`
  String get invalid_name {
    return Intl.message(
      'name must be a-z, A-Z',
      name: 'invalid_name',
      desc: '',
      args: [],
    );
  }

  /// `invalid phone number format e.g. 0128223643`
  String get invalid_phone {
    return Intl.message(
      'invalid phone number format e.g. 0128223643',
      name: 'invalid_phone',
      desc: '',
      args: [],
    );
  }

  /// `Username is too short`
  String get short_username {
    return Intl.message(
      'Username is too short',
      name: 'short_username',
      desc: '',
      args: [],
    );
  }

  /// `Username must be less than 15 characters`
  String get long_username {
    return Intl.message(
      'Username must be less than 15 characters',
      name: 'long_username',
      desc: '',
      args: [],
    );
  }

  /// `enter strong username a-z, A-Z, 0-9, { @ - _ # }`
  String get strong_username {
    return Intl.message(
      'enter strong username a-z, A-Z, 0-9, { @ - _ # }',
      name: 'strong_username',
      desc: '',
      args: [],
    );
  }

  /// `invalid email format e.g. jimmy@example.com`
  String get invalid_email {
    return Intl.message(
      'invalid email format e.g. jimmy@example.com',
      name: 'invalid_email',
      desc: '',
      args: [],
    );
  }

  /// `Password must be more than 6 characters`
  String get short_password {
    return Intl.message(
      'Password must be more than 6 characters',
      name: 'short_password',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain:\n\t\t\t\t\tNumbers { 0 - 9 }\n \t\t\t\tUppercase Letter { A - Z }\n \t\t\t\tLowercase Letter { a - z }\n \t\t\t\tSpecial Character { @ $ ! % * ? & - }`
  String get invalid_password {
    return Intl.message(
      'Password must contain:\n\t\t\t\t\tNumbers { 0 - 9 }\n \t\t\t\tUppercase Letter { A - Z }\n \t\t\t\tLowercase Letter { a - z }\n \t\t\t\tSpecial Character { @ \$ ! % * ? & - }',
      name: 'invalid_password',
      desc: '',
      args: [],
    );
  }

  /// `password not match`
  String get password_not_match {
    return Intl.message(
      'password not match',
      name: 'password_not_match',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the '_comment-shopping' key

  /// `Shopping Page`
  String get shopping_app_bar {
    return Intl.message(
      'Shopping Page',
      name: 'shopping_app_bar',
      desc: '',
      args: [],
    );
  }

  /// `products`
  String get products {
    return Intl.message(
      'products',
      name: 'products',
      desc: '',
      args: [],
    );
  }

  /// `hot_offers`
  String get hot_offer {
    return Intl.message(
      'hot_offers',
      name: 'hot_offer',
      desc: '',
      args: [],
    );
  }

  /// `Our Products`
  String get our_products {
    return Intl.message(
      'Our Products',
      name: 'our_products',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
