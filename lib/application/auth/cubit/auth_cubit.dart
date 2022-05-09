import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/infrastructure/auth/auth_service.dart';

part 'auth_state.dart';
// part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final AuthServiceRepository _authServiceRepository = AuthServiceRepository();

  void createUser(String email, String password) async {
    emit(AuthLoading());
    try {
      final _data =
          await _authServiceRepository.createUserWithUsernameAndPassword(
        email: email,
        password: password,
      );
      _data.fold(
        (l) => emit(AuthError(l)),
        (r) => emit(AuthSuccess(r)),
      );
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  void signInUser(String email, String password) async {
    emit(AuthLoading());
    try {
      final _data = await _authServiceRepository.signInWithUsernameAndPassword(
        email: email,
        password: password,
      );
      _data.fold(
        (l) => emit(AuthError(l)),
        (r) => emit(AuthSuccess(r)),
      );
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  void signOutUser() async {
    emit(AuthLoading());
    try {
      await _authServiceRepository.signOutUser();
      // emit(AuthSuccess(_data));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
