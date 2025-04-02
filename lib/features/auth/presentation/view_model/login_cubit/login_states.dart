abstract class LoginStates {}

class LoginInitialState extends LoginStates {
  LoginInitialState();
}

class ChangePasswordVisibilityState extends LoginStates {
  bool isVisible;
  ChangePasswordVisibilityState({required this.isVisible});
}

class LoadingLoginState extends LoginStates {}

class SuccessLoginState extends LoginStates {
  final String? token;
  SuccessLoginState({required this.token});
}

class FailureLoginState extends LoginStates {
  final String error;
  FailureLoginState({required this.error});
}
