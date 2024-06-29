import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ylaevent/modules/otp/cubit/states.dart';
import 'package:ylaevent/remote/dio.dart';
import 'package:ylaevent/remote/end_points.dart';


class OtpCubit extends Cubit<OtpStates> {
  OtpCubit() : super(OtpInitialState());

  static OtpCubit get(context) => BlocProvider.of(context);

  void otpverification({
    required String num,
    required String email,
  }) {
    emit(OtpLoadingState());
    DioHelper.putData(url: VERIFY_ACCOUNT, data: {
      'email': email,
      'otp': num,
    }).then((value) {
      emit(OtpSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(OtpErrorState(error.toString()));
    });
  }

  void sendAgain({
    required String email,
  }) {
    emit(OtpSendAgainLoadingState());
    DioHelper.postData(url: EMAIL_VERIFICATION_SEND, data: {'email': email})
        .then((value) {
      emit(OtpSendAgainSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(OtpSendAgainErrorState(error));
    });
  }
}
