import 'package:auth_module_flutter/data/models/user_auth.dart';
import 'package:auth_module_flutter/data/repositories/user_repository.dart';
import 'package:auth_module_flutter/utils/pref_utils.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final UserRepository _userRepository;

  AuthCubit({UserRepository userRepository})
      : this._userRepository = userRepository,
        super(AuthState.initial());

  void login(username, password) async {
    try {
      emit(state.update(loading: true));

      UserAuth _auth = await _userRepository.handleLogin(username, password);
      PrefUtils.storeUserAuthData(_auth);
      emit(state.update(loading: false, success: true));
    } catch (e) {
      emit(state.update(loading: false, error: e.toString()));
    }
  }
}
