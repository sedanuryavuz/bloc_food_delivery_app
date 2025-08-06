import 'package:bloc_food_delivery_app/data/repo/users_dao_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final _repo = UserDaoRepository();

  Future<void> register(String name, String email, String password) async {
    emit(AuthLoading());
    try {
      await _repo.register(name, email, password);
      emit(AuthSuccess("Kayıt başarılı"));
    } catch (e) {
      emit(AuthError("Kayıt başarısız: $e"));
    }
  }
}
