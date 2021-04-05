import 'package:auth_module_flutter/data/models/user.dart';
import 'package:auth_module_flutter/data/models/user_auth.dart';
import 'package:auth_module_flutter/data/providers/user_api_provider.dart';
import 'package:auth_module_flutter/utils/pref_utils.dart';
import 'package:injectable/injectable.dart';

@injectable
class UserRepository {
  final UserApiProvider _provider;

  const UserRepository({@Named("mock") UserApiProvider provider})
      : _provider = provider;

  Future<UserAuth> handleLogin(String username, String password) {
    return _provider.login(username, password);
  }

  Future<User> handleGetUser(
      {renew: false, authBloc, progressIndicator}) async {
    dynamic user;
    if (PrefUtils.isUserLoggedIn()) {
      if (PrefUtils.getStoredUser() != null && !renew) {
        user = PrefUtils.getStoredUser();
      } else {
        user = _provider.getUser();
        PrefUtils.updateUserSetting(user: user);
      }
    }

    return Future(() => user);
  }
}
