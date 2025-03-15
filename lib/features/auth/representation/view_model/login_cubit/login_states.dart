abstract class LoginStates {}

class LoginInitialState extends LoginStates {
  LoginInitialState();
}

class ChangePasswordVisibilityState extends LoginStates {
  bool isVisible;
  ChangePasswordVisibilityState({required this.isVisible});
}

class LoadingLoginState extends LoginStates {}

class SuccessLoginState extends LoginStates {}

class FailureLoginState extends LoginStates {
  final String error;
  FailureLoginState({required this.error});
}
