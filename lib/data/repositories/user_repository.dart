import 'package:auth_module_flutter/data/models/user_auth.dart';
import 'package:auth_module_flutter/data/providers/user_api_provider.dart';
import 'package:injectable/injectable.dart';

@injectable
class UserRepository {
  final UserApiProvider _provider;

  const UserRepository({@Named("mock") UserApiProvider provider})
      : _provider = provider;

  Future<UserAuth> handleLogin(String username, String password) {
    return _provider.login(username, password);
  }
}
