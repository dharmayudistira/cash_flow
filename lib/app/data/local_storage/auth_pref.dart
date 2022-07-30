import 'package:cash_flow/app/data/constants/pref_constants.dart';
import 'package:cash_flow/app/data/models/user_model.dart';
import 'package:get_storage/get_storage.dart';

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

  UserModel getCurrentUser() {
    final mapUser = _authPref.read(keyCurrentUser);
    return UserModel.fromJson(mapUser);
  }

  void logout() {
    _authPref.remove(keyLoginState);
    _authPref.remove(keyCurrentUser);
  }
}
