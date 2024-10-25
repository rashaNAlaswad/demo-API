class EndPoints {
  static const String baseUrl = 'https://food-api-omega.vercel.app/api/v1/';
  static String signIn = 'user/signin';
  static String signUp = 'user/signup';
  static String getUserData(id) => 'user/get-user/$id';
  static String updateUser = 'user/update';
  static String deleteUser = 'user/delete';
}

class ApiKeys {
  static String status = 'status';
  static String errorMessage = 'ErrorMessage';
  static String message = 'message';
  static const String token = 'token';
  static String id = 'id';
  static String name = 'name';
  static String phone = 'phone';
  static String email = 'email';
  static String password = 'password';
  static String confirmPassword = 'confirmPassword';
  static String location = 'location';
  static String profilePic = 'profilePic';
  static String type = 'type';
  static String coordinates = 'coordinates';
  static String user = 'user';
}
