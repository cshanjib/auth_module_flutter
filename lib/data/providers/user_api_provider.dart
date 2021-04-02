import 'package:auth_module_flutter/data/models/user_auth.dart';
import 'package:injectable/injectable.dart';

abstract class UserApiProvider {
  const UserApiProvider();

  Future<UserAuth> login(String username, String password);
}

@Named("mock")
@Singleton(as: UserApiProvider)
class MockUserApiProvider implements UserApiProvider {
  const MockUserApiProvider();

  Future<UserAuth> login(String username, String password) async {
    //add some delay to give the feel of api call
    await Future.delayed(Duration(seconds: 3));

    if (username != "flutter" || password != "password") {
      throw Exception("username and password does not match");
    }

    return Future.value(UserAuth(
        accessToken: "mock_access_token", refreshToken: "mock_refresh_roken"));
  }
}

@Singleton(as: UserApiProvider)
class RealUserApiProvider implements UserApiProvider {
  const RealUserApiProvider();

  Future<UserAuth> login(String username, String password) async {
    //add some delay to give the feel of api call,
    // todo this will be replaced by real api call later
    await Future.delayed(Duration(seconds: 3));
    return Future.value(UserAuth(
        accessToken: "real_access_token", refreshToken: "real_refresh_roken"));
  }
}
