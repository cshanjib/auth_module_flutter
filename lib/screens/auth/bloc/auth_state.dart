part of 'auth_cubit.dart';

@immutable
class AuthState extends Equatable {
  final UserAuth authUser;
  final String error;
  final bool loading;
  final bool success;

  bool get hasError => error.isNotEmpty;

  const AuthState({this.authUser, this.loading, this.error, this.success});

  @override
  List<Object> get props => [authUser, error, loading, success];

  factory AuthState.initial() {
    return AuthState(loading: false, error: "", success: false);
  }

  AuthState update({String error, UserAuth authUser, bool loading, bool success}) {
    return AuthState(
      error: error ?? "",
      loading: loading ?? this.loading,
      success: success ?? this.success,
      authUser: authUser ?? this.authUser,
    );
  }
}
