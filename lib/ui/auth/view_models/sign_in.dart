class SignInViewModel {
  String email = '';
  String password = '';

  bool isValid() {
    return email.isNotEmpty && email.contains('@') 
      && password.isNotEmpty && password.length >= 8;
  }
}