class SignInViewModel {
  String email = '';
  String password = '';

  bool validate() {
    return email.isNotEmpty && email.contains('@') 
      && password.isNotEmpty && password.length >= 8;
  }
}