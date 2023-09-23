abstract class AuthUser{
   final String userId;
   final String phoneNumber;
   final String fullName;
  AuthUser({
    required this.userId,
    required this.phoneNumber,
    required this.fullName,
  });
  Map<String, dynamic> toJson();


}