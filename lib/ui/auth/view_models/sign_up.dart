class SignUpViewModel {
  String username = '';
  String email = '';
  String password = '';
  String confirmPassword = '';

  bool _validUsername(String username) {
    RegExp usernameRegExp = RegExp(r'^[a-zA-Z0-9_]{3,20}$');
    return usernameRegExp.hasMatch(username);
  }

  bool isValid() {
    return username.isNotEmpty && _validUsername(username)
      && email.isNotEmpty && email.contains('@') 
      && password.isNotEmpty && password.length >= 8
      && confirmPassword.isNotEmpty && confirmPassword == password;
  }
}