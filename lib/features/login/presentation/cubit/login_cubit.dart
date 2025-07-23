import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/use_case/use_case.dart';
import '../../domain/use_case/login_use_case.dart';
import '../state/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginUseCase loginUseCase;

  LoginCubit({required this.loginUseCase}) : super(LoginStateIntl());

  login(String email, String password) {
    emit(LoginStateLoading());

    loginUseCase
        .call(NoParams()) // You can pass email and password as params if needed
        .then(
          (value) {
            // Here, handle the access token and store it locally
            // You could save it to SharedPreferences or a secure storage solution
            emit(LoginStateLoaded(token: ''));
          },
          onError: (error) {
            emit(LoginStateError(error.toString()));
          },
        );
  }
}
