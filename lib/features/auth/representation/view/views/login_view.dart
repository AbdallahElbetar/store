import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/theaming/colors.dart';

import 'package:store/core/theaming/styles.dart';
import 'package:store/core/utils/functions/custom_snack_bar.dart';
import 'package:store/features/auth/representation/view/widgets/login_button.dart';
import 'package:store/features/auth/representation/view_model/login_cubit/login_cubit.dart';
import 'package:store/features/auth/representation/view_model/login_cubit/login_states.dart';

import '../../../../../core/widgets/custom_circular_indicator.dart';
import '../widgets/custom_text_form_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController userNameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    super.dispose();
    userNameController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<LoginCubit>(context);
    return BlocConsumer<LoginCubit, LoginStates>(
      bloc: bloc,
      listener: (context, state) {
        if (state is SuccessLoginState) {
          showCustomSnackBar(
              message: "Success Logged In",
              context: context,
              type: SnackBarType.success);
        } else if (state is FailureLoginState) {
          showCustomSnackBar(
              message: state.error, context: context, type: SnackBarType.error);
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Scaffold(
            body: Form(
              key: formKey,
              child: ListView(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 15,
                  ),
                  Row(
                    children: [
                      Text(
                        "Login to your account",
                        style: Styles.textStyleBlack32,
                      ),
                    ],
                  ),
                  Text(
                    "It’s great to see you again.",
                    style: Styles.textStyleGrey16,
                  ),

                  CustomTextFormField(
                    hintText: 'Enter your email address',
                    labelText: 'User Name',
                    isPassword: false,
                    controller: userNameController,
                    suffixIcon: null,
                  ),
                  CustomTextFormField(
                    hintText: 'Enter your password',
                    labelText: 'Password',
                    isPassword: bloc.isVisible,
                    controller: passwordController,
                    suffixIcon: state is ChangePasswordVisibilityState
                        ? IconButton(
                            onPressed: () {
                              bloc.changePasswordVisibility();
                            },
                            icon: Icon(
                              bloc.isVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: AppColors.myGrey,
                            ),
                          )
                        : null,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 15,
                  ),

                  /// login Button
                  LoginButton(
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        await bloc.loginUser(
                          email: userNameController.text,
                          password: passwordController.text,
                        );
                      }
                    },
                    centerWidget: state is LoadingLoginState
                        ? CustomCircularIndicator()
                        : Text(""),
                    text: "Sign In",
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.35,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: Styles.textStyleGrey16,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Join",
                          style: Styles.textStyleBlack16.copyWith(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
