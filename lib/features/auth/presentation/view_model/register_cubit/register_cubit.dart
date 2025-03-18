import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repos/register_repo.dart';
import 'register_states.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  final RegisterRepo _registerRepo;

  RegisterCubit(this._registerRepo) : super(RegisterInitialState());

  bool isPasswordVisible = true;

  void changePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(ChangePasswordVisibilityState(isPasswordVisible: isPasswordVisible));
  }

  Future<void> registerUser({
    required String fullName,
    required String email,
    required String phoneNumber,
    required String password,
  }) async {
    emit(LoadingRegisterState());
    try {
      final response = await _registerRepo.registerUser(
        fullName: fullName,
        email: email,
        phoneNumber: phoneNumber,
        password: password,
      );

      response.fold(
        (failure) => emit(FailureRegisterState(errMessage: failure.errMessage)),
        (success) {
          if (success["status"] == false) {
            emit(FailureRegisterState(errMessage: success["message"]));
          } else {
            emit(SuccessRegisterState(successMessage: success["message"]));
          }
        },
      );
    } catch (e) {
      emit(FailureRegisterState(errMessage: e.toString()));
    }
  }
}
