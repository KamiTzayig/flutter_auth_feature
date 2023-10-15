class AuthFailure{
  final String authFailureCode;
  final AuthType authType;

  const AuthFailure({
    required this.authFailureCode,
    required this.authType,
  });

}
//replace the following enum with a map to string of the same values

enum AuthType {
  none,
  email,
  phone,
  google,
  facebook,
  apple,
  anonymous,
  custom
}
class AuthFailureCode {
  static const String none = 'none';
  static const String serverError = 'serverError';
  static const String tooManyRequests = 'tooManyRequests';
  static const String invalidMail = 'invalidMail';
  static const String mailAlreadyInUse = 'mailAlreadyInUse';
  static const String mailIsNotInUse = 'mailIsNotInUse';
  static const String invalidPassword = 'invalidPassword';
  static const String wrongPassword = 'wrongPassword';
  static const String invalidPhoneNumber = 'invalidPhoneNumber';
  static const String smsTimeout = 'smsTimeout';
  static const String sessionExpired = 'sessionExpired';
}

