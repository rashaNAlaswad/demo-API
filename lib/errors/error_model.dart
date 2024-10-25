import '../core/database/api/end_points.dart';

class ErrorModel {
  final int status;
  final String errorMessage;

  ErrorModel({required this.status, required this.errorMessage});

  ErrorModel.fromJson(Map<String, dynamic> json)
      : status = json[ApiKeys.status],
        errorMessage = json[ApiKeys.errorMessage];
}
