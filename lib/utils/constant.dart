import '../model/user.dart';

class UserConfig {
  static User dataUser = User();
}

class ApiConstants {
  static const String apiLogin = "https://staging-webadmin.medi-call.id/apiPartner/login";
}

class SharedPreferenceKeys {
  static const String isUserLoggedIn = "isUserLoggedIn";
  static const String user = "user";
}

class BuildVariant {
  static const String buildVariant = 'Staging';
}
