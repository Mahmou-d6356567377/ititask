import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    final FirebaseAuth _auth = FirebaseAuth.instance;

    // to controll events as a function like to say on the case of "event" do that {}
    on<LoginRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        await _auth.signInWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );
        emit(AuthSuccess());
      } catch (e) {
        log('....There is a problem with signing in $e');
        emit(AuthFailure("Invalid credentials $e"));
      }
    });

    on<RegisterRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        _auth.createUserWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );
        emit(AuthSuccess());
      } catch (e) {
        log('....There is a problem with making account $e');
        emit(AuthFailure('There is a problem with making account $e'));
      }
    });
  }
}
