part of 'auth_cubit.dart';

@immutable
class AuthState extends Equatable {
  final UserAuth authUser;
  final String error;
  final bool loading;

  bool get hasError => error.isNotEmpty;

  const AuthState({this.authUser, this.loading, this.error});

  @override
  List<Object> get props => [authUser, error, loading];

  factory AuthState.initial() {
    return AuthState(loading: false, error: "");
  }

  AuthState update({String error, UserAuth authUser, bool loading}) {
    return AuthState(
      error: error ?? "",
      loading: loading ?? this.loading,
      authUser: authUser ?? this.authUser,
    );
  }
}
