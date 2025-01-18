bool isFoundUser(String email, String password) {
  return (email == "jimmy@gmail.com" || email == "jimmy990") &&
      password == "Jimmy@2024";
}

Map<String, bool> isUserAddedBefore(String email, String username) {
  if (email != "jimmy@gmail.com" && username != "jimmy990") {
    return {"status": false};
  }
  return {
    "status": true,
    "email": email == "jimmy@gmail.com",
    "username": username == "jimmy990"
  };
}
