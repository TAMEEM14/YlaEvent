abstract class OtpStates {}
class OtpInitialState extends OtpStates {}
class OtpSuccessState extends OtpStates {}
class OtpLoadingState extends OtpStates {}
class OtpErrorState extends OtpStates {
  final String error;
  OtpErrorState(this.error);
}
class OtpSendAgainSuccessState extends OtpStates {}
class OtpSendAgainLoadingState extends OtpStates {}
class OtpSendAgainErrorState extends OtpStates {
  final String error;
  OtpSendAgainErrorState(this.error);
}