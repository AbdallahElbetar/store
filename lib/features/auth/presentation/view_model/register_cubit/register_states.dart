abstract class RegisterStates {}

class RegisterInitialState extends RegisterStates {}

class SuccessRegisterState extends RegisterStates {
  final String successMessage;
  SuccessRegisterState({required this.successMessage});
}

class LoadingRegisterState extends RegisterStates {}

class FailureRegisterState extends RegisterStates {
  final String errMessage;
  FailureRegisterState({required this.errMessage});
}

class ChangePasswordVisibilityState extends RegisterStates {
  bool isPasswordVisible = false;
  ChangePasswordVisibilityState({required this.isPasswordVisible});
}
