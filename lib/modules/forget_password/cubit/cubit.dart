import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ylaevent/modules/forget_password/cubit/states.dart';
import 'package:ylaevent/remote/dio.dart';
import 'package:ylaevent/remote/end_points.dart';


class ForgetPasswordCubit extends Cubit<ForgetPasswordStates> {
  ForgetPasswordCubit() : super(ResetPasswordInitialState());

  static ForgetPasswordCubit get(context) => BlocProvider.of(context);

  bool isPassword = false;
  IconData suffix = Icons.visibility_off;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off;
    emit(ResetPasswordChangePasswordState());
  }
  void enterEmail({
    required String email,
})
  {
   emit(EnterEmailLoadingState());
   DioHelper.postData(url: PASSWORD_VERIFICATION_SEND, data:
   {
     'email' : email,
   }).then((value) {
     emit(EnterEmailSuccessState());
   }).catchError((error){
     print(error.toString());
     emit(EnterEmailErrorState());
   });
  }

  void verifyNewPassword({
    required String num,
    required String email,
  }) {
    emit(VerifyNewPasswordLoadingState());
    DioHelper.putData(url: VERIFY_NEW_PASSWORD, data: {
      'email': email,
      'otp': num,
    }).then((value) {
      emit(VerifyNewPasswordSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(VerifyNewPasswordErrorState());
    });
  }

  void sendAgain({
    required String email,
  }) {
    emit(SendAgainLoadingState());
    DioHelper.postData(url: EMAIL_VERIFICATION_SEND, data: {'email': email})
        .then((value) {
      emit(SendAgainSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SendAgainErrorState());
    });
  }

  void resetPassword({
    required String email,
    required String newPassword,
})
  {
    emit(ResetPasswordLoadingState());
    DioHelper.putData(url: RESET_PASSWORD , data: {
      'email': email,
      'new_password' : newPassword,
    }).then((value) {
      emit(ResetPasswordSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(ResetPasswordErrorState());
    });
  }
}