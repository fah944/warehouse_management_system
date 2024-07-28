import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/utils/shared_preferences_helper.dart';
import 'login_state.dart';
import '../../services/login_service.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginService _loginService;

  LoginCubit(this._loginService) : super(LoginInitial());

  Future<void> login({required String email, required String password, required String fcmToken}) async {
    emit(LoginLoading());
    try {
      final user = await _loginService.login(
          email: email,
          password: password,
          fcmToken: fcmToken
      );
      await SharedPreferencesHelper.saveJwtToken(user.token);
      await SharedPreferencesHelper.saveUserRole(user.role);
      await SharedPreferencesHelper.saveFcmToken(fcmToken);  // Store FCM token

      print("LoginCubit: Emitting LoginSuccess state with user: $user");
      emit(LoginSuccess(user));
    } catch (e) {
      print("Login error: $e");
      emit(LoginFailure(e.toString()));
    }
  }
}
