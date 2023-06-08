class LoginDto {
  final String? username;
  final String? secret;
  LoginDto({this.username, this.secret});

  Map<String, dynamic> toMap() {
    return {'username': username, 'password': secret};
  }
}