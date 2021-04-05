// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAuth _$UserAuthFromJson(Map<String, dynamic> json) {
  return UserAuth(
    accessToken: json['accessToken'] as String,
    refreshToken: json['refreshToken'] as String,
    roles: (json['roles'] as List)?.map((e) => e as String)?.toList(),
    userId: json['userId'] as String,
  );
}

Map<String, dynamic> _$UserAuthToJson(UserAuth instance) => <String, dynamic>{
      'accessToken': instance.accessToken,
      'userId': instance.userId,
      'refreshToken': instance.refreshToken,
      'roles': instance.roles,
    };
