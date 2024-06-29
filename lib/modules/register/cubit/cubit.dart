import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ylaevent/modules/register/cubit/states.dart';
import 'package:ylaevent/remote/dio.dart';
import 'package:ylaevent/remote/end_points.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  void userRegister({
    required String email,
    required String password,
    required String name,
    required String phone,
    required String confirmPassword,
    required String birthday,
  }) {
    emit(RegisterLoadingState());
    DioHelper.postData(
      url: REGISTER,
      data: {
        'email': email,
        'password': password,
        'name': name,
        'phone_number': phone,
        'confirm_password': confirmPassword,
        'birth_day': birthday,
      },
    ).then((value) {
      print(value.data);
      //loginModels= LoginModel.fromJason(value.data);
      emit(RegisterSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(RegisterErrorState(error.toString()));
    });
  }

  bool isPassword = false;
  IconData suffix = Icons.visibility_off;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off;
    emit(RegisterChangePasswordState());
  }

  IconData suffixConfirm = Icons.visibility_off;
  bool confirmPasswor = false;

  void changeconfirmPasswordVisibility() {
    confirmPasswor = !confirmPasswor;
    suffixConfirm =
        confirmPasswor ? Icons.visibility_outlined : Icons.visibility_off;
    emit(RegisterChangeConfirmPasswordState());
  }


}
