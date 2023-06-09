class ApiPath {
  const ApiPath._();

  static const String sysUrl = "/api";
  static const String wcsUrl = "/wcs";

  //登录url
  static const String signInUrl = '$sysUrl/login';

  //登出url
  static const String signOutUrl = '$sysUrl/logout';
}
