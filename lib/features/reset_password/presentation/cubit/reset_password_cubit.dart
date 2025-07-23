import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/data_source/reset_password_remote_data_source.dart';
import '../state/reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final ResetPasswordRemoteDataSource remoteDataSource;

  ResetPasswordCubit({required this.remoteDataSource}) : super(ResetPasswordInitial());

  Future<void> sendOTP(String email) async {
    emit(ResetPasswordLoading());
    try {
      final result = await remoteDataSource.sendOTP(email);
      emit(SendOTPSuccess(result));
    } catch (e) {
      emit(ResetPasswordFailure(e.toString()));
    }
  }

  Future<void> verifyOTP(String email, String otp) async {
    emit(ResetPasswordLoading());
    try {
      final result = await remoteDataSource.verifyOTP(email, otp);
      emit(VerifyOTPSuccess(result));
    } catch (e) {
      emit(ResetPasswordFailure(e.toString()));
    }
  }
}
