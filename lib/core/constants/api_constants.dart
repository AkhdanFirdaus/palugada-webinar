class ApiConstants {
  static const baseUrl = "http://192.168.1.5:8000/api/";
  static const login = "login";
  static const loginWithId = "login-with-id";
  static const logout = "logout";
  static const register = "register";

  static const webinar = "webinar";
  static const registerWebinar = "webinar/daftar";
  static String webinarDetail(int id) => "webinar/$id";

  static String myWebinar(int id) => "user/$id/my-webinar";
  static String countMyWebinar(int id) => "user/$id/count-webinar";
  static String joinedWebinar(int id) => "user/$id/diikuti";
  static String favoriteWebinar(int id) => "user/$id/favorite";
  static const favorite = "user/favorite";

  static const penyelenggara = "penyelenggara";
  static String penyelenggaraDetail(int id) => "penyelenggara/$id";
  static String penyelenggaraWebinar(int id) => "webinar/penyelenggara/$id";

  static const createWebinar = "webinar";

  static const countWebinar = "count-webinar";
  static const countPendaftar = "count-pendaftar";
}
