abstract class ApiConsumer {
  Future<dynamic> get(
    String path,
      {Object? bodayData, 
      Map<String,
       String>? queryParameters});

  Future<dynamic> post(
    String path, {
    Object? bodayData,
    Map<String, String>? queryParameters,
    bool isFromData = false,
  });

  Future<dynamic> patch(
    String path, {
    Object? bodayData,
    Map<String, String>? queryParameters,
    bool isFromData = false,
  });

  Future<dynamic> delete(
    String path, {
    Object? bodayData,
    Map<String, String>? queryParameters,
    bool isFromData = false,
  });
}
