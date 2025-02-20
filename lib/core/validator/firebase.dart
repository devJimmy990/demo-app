class FirebaseValidator {
  static String login(String msg) {
    if (msg.contains("firebase_auth/invalid-email") ||
        msg.contains("firebase_auth/invalid-credential")) {
      return "invalid email or password";
    }
    return msg;
  }

  static String register(String msg) {
    if (msg.contains("firebase_auth/email-already-in-use")) {
      return "Email already in use";
    }
    return msg;
  }
}
