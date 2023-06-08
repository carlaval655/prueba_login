import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/blocs/login_cubit.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/login': (context) => LoginScreen(),
        
      },
      supportedLocales: const [
        Locale('en', ''),
        Locale('es', ''),
      ],
      home: LoginScreen(),
    );
  }
}