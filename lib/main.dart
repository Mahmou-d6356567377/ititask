import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ititask/UI/login/login_screen.dart';
import 'package:ititask/bloc/auth/auth_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (_) => AuthBloc(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginScreen(),
    );
  }
}