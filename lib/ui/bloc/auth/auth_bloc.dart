import 'package:bloc_food_delivery_app/ui/bloc/auth/auth_event.dart';
import 'package:bloc_food_delivery_app/ui/bloc/auth/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repo/users_dao_repository.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserDaoRepository _repo = UserDaoRepository();

  AuthBloc() : super(AuthInitial()) {
    on<RegisterEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        await _repo.register(event.name, event.email, event.password);
        emit(AuthSuccess("Kayıt başarılı"));
      } catch (e) {
        emit(AuthError("Kayıt başarısız: $e"));
      }
    });

    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        await _repo.login(event.email, event.password);
        emit(AuthSuccess("Giriş başarılı"));
      } catch (e) {
        emit(AuthError("Giriş başarısız: $e"));
      }
    });
  }
}
