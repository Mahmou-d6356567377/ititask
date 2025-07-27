import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginRequested>((event, emit) async {
      emit(AuthLoading());
      await Future.delayed(const Duration(seconds: 2));
      // Replace with real authentication logic
      if (event.email == "test@test.com" && event.password == "password") {
        emit(AuthSuccess());
      } else {
        emit(AuthFailure("Invalid credentials"));
      }
    });

    on<RegisterRequested>((event, emit) async {
      emit(AuthLoading());
      await Future.delayed(const Duration(seconds: 2));
      // Replace with real registration logic
      emit(AuthSuccess());
    });
  }
}