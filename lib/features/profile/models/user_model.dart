import '../../../core/database/api/end_points.dart';

class UserModel {
  final String profilePic;
  final String email;
  final String phone;
  final String name;
  final Map<String, dynamic> location;

  UserModel({
    required this.profilePic,
    required this.email,
    required this.phone,
    required this.name,
    required this.location,
  });

  factory UserModel.fromJson(Map<String, dynamic> jsonData) {
    return UserModel(
      profilePic: jsonData[ApiKeys.user][ApiKeys.profilePic],
      email: jsonData[ApiKeys.user][ApiKeys.email],
      phone: jsonData[ApiKeys.user][ApiKeys.phone],
      name: jsonData[ApiKeys.user][ApiKeys.name],
      location: jsonData[ApiKeys.user][ApiKeys.location],
    );
  }
}
