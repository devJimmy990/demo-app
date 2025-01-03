class Validator {
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return "required";
    } else if (value[0] != value[0].toUpperCase()) {
      return "Name must start with a capital letter";
    } else if (value.length < 3) {
      return "Name is too short";
    } else if (value.length > 15) {
      return "Name must be less than 15 characters";
    } else if (!RegExp(r"^[a-zA-Z]+$").hasMatch(value)) {
      return "name must be a-z, A-Z";
    }
    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return "required";
    } else if (!RegExp(r"^01[0125]\d{8}$").hasMatch(value)) {
      return "invalid phone number format e.g. 0128223643";
    }
    return null;
  }

  static String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return "required";
    } else if (value.length < 3) {
      return "Username is too short";
    } else if (value.length > 15) {
      return "Username must be less than 15 characters";
    } else if (!RegExp(r"^[a-zA-Z0-9@-_#]+$").hasMatch(value)) {
      return "enter strong username a-z, A-Z, 0-9, { @ - _ # }";
    }
    return null;
  }

  static String? validateEmail(String? value) {
    final regex = RegExp(r"^[a-zA-Z0-9_-]+@([a-zA-Z]+\.)+[a-zA-Z]{2,}$");
    if (value == null || value.isEmpty) {
      return "required";
    } else if (!regex.hasMatch(value)) {
      return "invalid email format e.g. jimmy@example.com";
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "required";
    } else if (value.length < 6) {
      return "Password must be more than 6 characters";
    }
    if (!RegExp(
            r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&\-])[A-Za-z\d@$!%*?&-]{6,}$")
        .hasMatch(value)) {
      return "Password must contain:\n\t\t\t\t\tNumbers { 0 - 9 }\n \t\t\t\tUppercase Letter { A - Z }\n \t\t\t\tLowercase Letter { a - z }\n \t\t\t\tSpecial Character { @ \$ ! % * ? & - }";
    }
    return null;
  }

  static String? validateConfirmPassword(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return "required";
    } else if (value != password) {
      return "Passwords do not match";
    }
    return null;
  }
}
