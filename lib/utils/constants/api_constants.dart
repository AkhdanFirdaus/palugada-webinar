class ApiConstants {
  static const baseUrl = "http://192.168.1.10:8000/api/";
  static const login = "login";
  static const loginWithId = "login-with-id";
  static const logout = "logout";
  static const register = "register";

  static const webinar = "webinar";
  static String favorite(int id) => "user/$id/favorite";
  static String myWebinar(int id) => "user/$id/my-webinar";
  static String countMyWebinar(int id) => "user/$id/count-webinar";
  static String joinedWebinar(int id) => "user/$id/diikuti";
  static const webinarCreate = "";
  static const webinarRegister = "";

  static const countWebinar = "count-webinar";
  static const countPendaftar = "count-pendaftar";
}
