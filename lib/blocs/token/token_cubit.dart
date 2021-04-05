import 'package:auth_module_flutter/data/models/user_auth.dart';
import 'package:auth_module_flutter/data/repositories/user_repository.dart';
import 'package:auth_module_flutter/utils/pref_utils.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'token_state.dart';

@injectable
class TokenCubit extends Cubit<TokenState> {
  final UserRepository _userRepository;

  TokenCubit({UserRepository userRepository})
      : _userRepository = userRepository,
        super(TokenState.initial()) {
    if (PrefUtils.isUserLoggedIn()) {
      emit(state.update(isLoggedIn: true));
      loadUserData();
    } else {
      emit(state.update(loading: false));
    }
  }

  void reset() {
    emit(TokenState.initial(loading: false));
  }

  void update(
      {bool loading,
      bool error,
      bool isLoggedIn,
      userAuth,
      user,
      bool forceTrigger}) async {
    emit(state.update(
        loading: loading,
        error: error,
        isLoggedIn: isLoggedIn,
        userAuth: userAuth,
        user: user));
  }

  void loadUserData() async {
    try {
      if (PrefUtils.isUserLoggedIn()) {
        emit(state.update(loading: true));
        final user = await _userRepository.handleGetUser();
        emit(state.update(loading: false, isLoggedIn: true, user: user));
      }
    } catch (e) {
      emit(state.update(loading: false, error: true));
    }
  }
}
