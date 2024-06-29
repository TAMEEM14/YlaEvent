abstract class RegisterStates {}
class RegisterInitialState extends RegisterStates {}
class RegisterSuccessState extends RegisterStates {}
class RegisterLoadingState extends RegisterStates {}
class RegisterChangePasswordState extends RegisterStates {}
class RegisterChangeConfirmPasswordState extends RegisterStates {}
class RegisterErrorState extends RegisterStates {
  final String error;
  RegisterErrorState(this.error);
}
class RegisterBirthdayState extends RegisterStates{

}


