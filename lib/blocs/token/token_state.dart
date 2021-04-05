part of 'token_cubit.dart';

@immutable
class TokenState extends Equatable {
  final bool loading;
  final bool error;
  final bool isLoggedIn;
  final UserAuth userAuth;
  final dynamic user;

  bool get isUserSet => user != null;

  TokenState(
      {this.error, this.loading, this.isLoggedIn, this.userAuth, this.user});

  factory TokenState.initial({loading}) {
    return TokenState(
        loading: loading ?? true, error: false, isLoggedIn: false);
  }

  TokenState update(
      {bool loading, bool error, bool isLoggedIn, userAuth, user}) {
    return TokenState(
        loading: loading ?? this.loading,
        isLoggedIn: isLoggedIn ?? this.isLoggedIn,
        userAuth: userAuth ?? this.userAuth,
        user: user ?? this.user,
        error: error ?? false);
  }

  @override
  String toString() =>
      'TokenState { error: $error, loading: $loading, isLoggedIn: $isLoggedIn }';

  @override
  List<Object> get props => [loading, error, isLoggedIn, userAuth, user];
}
