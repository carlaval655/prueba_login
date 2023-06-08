import '../dtos/user_dto.dart';
class LoginState {
  final UserDto user;
  final bool isLoading;
  final bool isLogged;

  const LoginState({
    this.user = const UserDto(),
    this.isLoading = false,
    this.isLogged = false,
  });

  LoginState copyWith({
    UserDto? user,
    bool? isLoading,
    bool? isLogged,
  }) {
    return LoginState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
      isLogged: isLogged ?? this.isLogged,
    );
  }
}