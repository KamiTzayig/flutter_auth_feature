class AuthFailure{
  final String authFailureCode;
  final AuthProviderType authProviderType;

  const AuthFailure({
    required this.authFailureCode,
    required this.authProviderType,
  });


}
//replace the following enum with a map to string of the same values

enum AuthProviderType {
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
  static const String unknown = 'unknown';
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
  static const String operationNotAllowed = 'operationNotAllowed';

  static const String weakPassword = 'weakPassword';

  String fromStringCode(String code){
    switch (code) {
      case 'email-already-in-use':
        return mailAlreadyInUse;
      case 'invalid-email':
        return invalidMail;
      case 'operation-not-allowed':
        return operationNotAllowed;
      case 'weak-password':
        return weakPassword;
      default:
        return unknown;
    }

  }
}

