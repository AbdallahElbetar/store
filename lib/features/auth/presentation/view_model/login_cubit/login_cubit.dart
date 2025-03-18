import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/login_repo.dart';
import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit(
    this._loginRepo,
  ) : super(LoginInitialState());
  bool isVisible = true;

  void changePasswordVisibility() {
    isVisible = !isVisible;
    emit(ChangePasswordVisibilityState(isVisible: isVisible));
  }

  final LoginRepo _loginRepo;

  Future<void> loginUser(
      {required String email, required String password}) async {
    emit(LoadingLoginState());

    var result = await _loginRepo.loginUser(email: email, password: password);

    result.fold(
      (failure) {
        emit(FailureLoginState(error: failure.errMessage));
      },
      (successLogin) {
        if (successLogin["status"] == false) {
          emit(
            FailureLoginState(
              error: successLogin["message"],
            ),
          );
        } else {
          emit(SuccessLoginState());
        }
      },
    );
  }
}
