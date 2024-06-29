abstract class ForgetPasswordStates {}
class ResetPasswordInitialState extends ForgetPasswordStates {}

class ResetPasswordChangePasswordState extends ForgetPasswordStates {}

class EnterEmailLoadingState extends ForgetPasswordStates{}

class EnterEmailSuccessState extends ForgetPasswordStates{}

class EnterEmailErrorState extends ForgetPasswordStates{}

class VerifyNewPasswordLoadingState extends ForgetPasswordStates{}

class VerifyNewPasswordSuccessState extends ForgetPasswordStates{}

class VerifyNewPasswordErrorState extends ForgetPasswordStates{}

class SendAgainLoadingState extends ForgetPasswordStates{}

class SendAgainSuccessState extends ForgetPasswordStates{}

class SendAgainErrorState extends ForgetPasswordStates{}

class ResetPasswordLoadingState extends ForgetPasswordStates{}

class ResetPasswordSuccessState extends ForgetPasswordStates{}

class ResetPasswordErrorState extends ForgetPasswordStates{}




