import 'package:get_storage/get_storage.dart';

import '../constants/pref_constants.dart';
import '../models/user_model.dart';

class AuthPref {
  final _authPref = GetStorage();

  void setLoginState(bool state) {
    _authPref.write(keyLoginState, state);
  }

  bool getLoginState() {
    return _authPref.read(keyLoginState);
  }

  void setCurrentUser(UserModel currentUser) {
    _authPref.write(keyCurrentUser, currentUser.toJson());
  }

  UserModel? getCurrentUser() {
    Map<String, dynamic>? mapUser = _authPref.read(keyCurrentUser);

    if (mapUser != null) {
      return UserModel.fromJson(mapUser);
    } else {
      return null;
    }
  }

  void setDarkMode(bool state) {
    _authPref.write(keyDarkMode, state);
  }

  bool getDarkModeState() {
    return _authPref.read(keyDarkMode) ?? false;
  }

  void logout() {
    _authPref.remove(keyLoginState);
    _authPref.remove(keyCurrentUser);
  }
}
