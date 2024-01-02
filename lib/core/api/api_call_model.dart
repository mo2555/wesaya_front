
import '../utils/enums.dart';

class ApiCallModel {
  final ApiCallType type;
  final String endPoint;
  final Map<String, dynamic>? body;
  final Map<String, dynamic>? query;
  final Map<String, String> headers;

  ApiCallModel({
    required this.type,
    required this.endPoint,
    this.body,
    this.query,
    this.headers = const {},
  });
}
