abstract class AuthUser{
  const AuthUser();
  String get userId;
  String get phoneNumber;
  String get fullName;

  String get email;

  Map<String, dynamic> toJson();


}