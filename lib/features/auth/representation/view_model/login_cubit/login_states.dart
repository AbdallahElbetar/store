abstract class LoginStates {}

class LoginInitialState extends LoginStates {
  LoginInitialState();
}

class PasswordVisibilityChangedState extends LoginStates {
  bool isVisible;
  PasswordVisibilityChangedState({required this.isVisible});
}

class LoadingLoginState extends LoginStates {}

class SuccessLoginState extends LoginStates {}

class FailureLoginState extends LoginStates {
  final String error;
  FailureLoginState({required this.error});
}
