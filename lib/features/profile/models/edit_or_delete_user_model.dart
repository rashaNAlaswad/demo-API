import '../../../core/database/api/end_points.dart';

class EditOrDeleteUserModel {
  final String message;
  EditOrDeleteUserModel({required this.message});

  factory EditOrDeleteUserModel.fromJson(Map<String, dynamic> json) {
    return EditOrDeleteUserModel(message: json[ApiKeys.message]);
  }
}
