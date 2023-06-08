// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserDto{
  final String? username;
  final String? authToken;
  final String? refreshToken;

  const UserDto({
    this.username,
    this.authToken,
    this.refreshToken,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'authToken': authToken,
      'refreshToken': refreshToken,
    };
  }

  factory UserDto.fromMap(Map<String, dynamic> map) {
    return UserDto(
      username: map['username'] != null ? map['username'] as String : null,
      authToken: map['authToken'] != null ? map['authToken'] as String : null,
      refreshToken: map['refreshToken'] != null ? map['refreshToken'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserDto.fromJson(String source) => UserDto.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserDto(username: $username, authToken: $authToken, refreshToken: $refreshToken)';
}
