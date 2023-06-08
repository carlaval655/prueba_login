// login_cubit.dart

import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pruebas/dtos/login_dto.dart';
import 'package:pruebas/services/auth_api.dart';
import 'package:pruebas/dtos/user_dto.dart';
import '../states/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  Future<void> login(String username, String secret) async {
    emit(state.copyWith(isLoading: true));
    final httpResponse = await AuthApi.login(LoginDto(username: username, secret: secret));
    UserDto user;
    if (httpResponse.statusCode == 200) {
      final jsonData = json.decode(httpResponse.body);
      if (jsonData['code'] == '0000') {
        final response = jsonData['response'];
        user = UserDto(
          authToken: response['authToken'],
          refreshToken: response['refreshToken'],
        );
        print('authToken: ${user.authToken}');
        emit(state.copyWith(user: user, isLogged: true, isLoading: false));
      } else {
        emit(state.copyWith(isLogged: false, isLoading: false));
      }
    } else {
      user = const UserDto();
      emit(state.copyWith(user: user, isLogged: false, isLoading: false));
    }
  }
}
