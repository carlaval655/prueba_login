import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/states/login_state.dart';
import '/blocs/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  //controladores de texto de nombre de usuario y contraseña
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<LoginCubit>(context);
    _usernameController.text = '';
    _passwordController.text = '';

    return Scaffold(
      appBar: AppBar(
        title: const Text("Inicio de sesion"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(45.0),
        child: Form(
          key: _formKey,
          child: BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) => BlocProvider.of<LoginCubit>(context)
                    .state
                    .isLoading
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
                        controller: _usernameController,
                        decoration: const InputDecoration(
                          labelText: 'Nombre de usuario',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Porfavor ingrese su nombre de usuario';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Contraseña',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Porfavor ingrese su contraseña';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 32.0),
                      ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            //
                            await BlocProvider.of<LoginCubit>(context)
                                .login(_usernameController.text,
                                    _passwordController.text);
                            if (state.isLoading) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Cargando...'),
                                ),
                              );
                            } 
                            else if (state.isLogged) {
                                                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content:
                                      Text('Credenciales correctas'),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content:
                                      Text('Usuario o contraseña incorrectos'),
                                ),
                              );
                            }
                          }
                        },
                        child: const Text('Ingresar'),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}