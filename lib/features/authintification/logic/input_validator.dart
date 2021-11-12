

bool checkIt({required String email, required String password}){
  const emailRegex =
  r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
  if (RegExp(emailRegex).hasMatch(email) && password.length >5 ) {
    return true;
  } else {
    return false;
  }

}