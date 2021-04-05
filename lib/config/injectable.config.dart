// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../blocs/token/token_cubit.dart' as _i6;
import '../data/providers/user_api_provider.dart' as _i4;
import '../data/repositories/user_repository.dart' as _i3;
import '../screens/auth/bloc/auth_cubit.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String environment, _i2.EnvironmentFilter environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.UserRepository>(() => _i3.UserRepository(
      provider: get<_i4.UserApiProvider>(instanceName: 'mock')));
  gh.factoryParam<_i5.AuthCubit, _i6.TokenCubit, dynamic>((tokenCubit, _) =>
      _i5.AuthCubit(
          userRepository: get<_i3.UserRepository>(), tokenCubit: tokenCubit));
  gh.factory<_i6.TokenCubit>(
      () => _i6.TokenCubit(userRepository: get<_i3.UserRepository>()));
  gh.singleton<_i4.UserApiProvider>(_i4.MockUserApiProvider(),
      instanceName: 'mock');
  gh.singleton<_i4.UserApiProvider>(_i4.RealUserApiProvider());
  return get;
}
