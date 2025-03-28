class SignUpViewModel {
  String email = '';
  String password = '';
  String confirmPassword = '';

  bool validate() {
    return email.isNotEmpty && email.contains('@') 
      && password.isNotEmpty && password.length >= 8
      && confirmPassword.isNotEmpty && confirmPassword == password;
  }
}