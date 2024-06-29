import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ylaevent/modules/login/cubit/states.dart';
import 'package:ylaevent/remote/dio.dart';
import 'package:ylaevent/remote/end_points.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  void  userLogin({
    required String email,
    required String password,
  }) {
    DioHelper.postData(
        url: SININ,
        data: {
          'email': email,
          'password': password,
    }).then((value) {
      emit(LoginSuccessState());
    }).catchError((error)
    {
      print(error.toString());
      emit(LoginErrorState(error.toString()));
    });
  }

  bool isPassword = false;
  IconData suffix = Icons.visibility_off;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off;
    emit(LoginChangePasswordState());
  }
}