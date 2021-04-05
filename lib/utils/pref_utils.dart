import 'dart:convert';
import 'package:auth_module_flutter/blocs/token/token_cubit.dart';
import 'package:auth_module_flutter/data/models/user_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PrefUtils {
  static final Future<SharedPreferences> prefs =
      SharedPreferences.getInstance();

  static const String USER_IDENTIFIER = "auth_module_flutter_";

  static final Map<AUTH_STORE, dynamic> authStore = <AUTH_STORE, dynamic>{
    AUTH_STORE.isLoggedIn: false
  };

  static bool isUserLoggedIn() {
    return authStore[AUTH_STORE.isLoggedIn];
  }

  static UserAuth getUserAuthData() {
    return authStore[AUTH_STORE.auth];
  }

  static Future<void> loadUserAuthData() async {
    final userString = (await prefs).get(USER_IDENTIFIER);
    if (userString != null) {
      final userJson = json.decode(userString);
      updateUserSetting(
          userAuthData: UserAuth.fromJson(userJson), isLoggedIn: true);
    } else {
      return null;
    }
  }

  static Future<bool> storeUserAuthData(UserAuth userAuthData) async {
    updateUserSetting(userAuthData: userAuthData, isLoggedIn: true);
    final userAuth = userAuthData.toJson();
    return (await prefs).setString(USER_IDENTIFIER, jsonEncode(userAuth));
  }

  static Future<bool> clearUserToken() async {
    updateUserSetting(clear: true);
    return (await prefs).remove(USER_IDENTIFIER);
  }

  static void updateUserSetting(
      {UserAuth userAuthData,
      bool isLoggedIn,
      dynamic user,
      bool clear: false}) async {
    if (userAuthData != null || clear) {
      authStore[AUTH_STORE.auth] = userAuthData;
    }

    if (user != null || clear) {
      authStore[AUTH_STORE.user] = user;
    }

    if (isLoggedIn != null || clear) {
      authStore[AUTH_STORE.isLoggedIn] = isLoggedIn ?? false;
    }
  }

  static void loggedIn(UserAuth userAuthData, TokenCubit cubit) async {
    await storeUserAuthData(userAuthData);
    cubit.update(isLoggedIn: true, userAuth: userAuthData);
    cubit.loadUserData();
  }

  static void loggedOut(BuildContext context) async {
    await clearUserToken();
    context.read<TokenCubit>().reset();
  }
}

enum AUTH_STORE { auth, isLoggedIn, user }
