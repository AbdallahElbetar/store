import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../view_model/register_cubit/register_cubit.dart';
import '../../view_model/register_cubit/register_states.dart';
import '../../../../../core/theaming/colors.dart';

import '../../../../../core/theaming/styles.dart';
import '../../../../../core/utils/functions/custom_snack_bar.dart';
import '../widgets/auth_button.dart';
import '../../../../../core/widgets/custom_circular_indicator.dart';
import '../widgets/custom_text_form_field.dart';

class RegsiterView extends StatefulWidget {
  const RegsiterView({super.key});

  @override
  State<RegsiterView> createState() => _LoginViewState();
}

class _LoginViewState extends State<RegsiterView> {
  TextEditingController fullNameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    super.dispose();
    fullNameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<RegisterCubit>(context);
    return Scaffold(
      body: BlocConsumer<RegisterCubit, RegisterStates>(
        bloc: bloc,
        listener: (context, state) {
          if (state is SuccessRegisterState) {
            showCustomSnackBar(
                message: state.successMessage,
                context: context,
                type: SnackBarType.success);
          } else if (state is FailureRegisterState) {
            showCustomSnackBar(
                message: state.errMessage,
                context: context,
                type: SnackBarType.error);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Scaffold(
              body: Form(
                key: formKey,
                child: ListView(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 15,
                    ),
                    Row(
                      children: [
                        Text(
                          "Create an account",
                          style: Styles.textStyleBlack32,
                        ),
                      ],
                    ),
                    Text(
                      "Let’s create your account.",
                      style: Styles.textStyleGrey16,
                    ),

                    CustomTextFormField(
                      hintText: 'Enter your full name',
                      labelText: 'Full Name',
                      isPassword: false,
                      controller: fullNameController,
                      suffixIcon: null,
                    ),
                    CustomTextFormField(
                      hintText: 'Enter your email address',
                      labelText: 'User Name',
                      isPassword: false,
                      controller: emailController,
                      suffixIcon: null,
                    ),
                    CustomTextFormField(
                      hintText: 'Enter your Phone number',
                      labelText: 'Phone Number',
                      isPassword: false,
                      controller: phoneNumberController,
                      suffixIcon: null,
                    ),

                    CustomTextFormField(
                        hintText: 'Enter your password',
                        labelText: 'Password',
                        isPassword: bloc.isPasswordVisible,
                        controller: passwordController,
                        suffixIcon: IconButton(
                          onPressed: () {
                            bloc.changePasswordVisibility();
                          },
                          icon: Icon(
                            bloc.isPasswordVisible
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: AppColors.myGrey,
                          ),
                        )),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 15,
                    ),

                    /// Register Button
                    AuthButton(
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          await bloc.registerUser(
                            fullName: fullNameController.text,
                            email: emailController.text,
                            phoneNumber: phoneNumberController.text,
                            password: passwordController.text,
                          );
                        }
                      },
                      centerWidget: state is LoadingRegisterState
                          ? CustomCircularIndicator()
                          : Text(""),
                      text: "Create Account",
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.15,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: Styles.textStyleGrey16,
                        ),
                        TextButton(
                          onPressed: () {
                            context.pop();
                          },
                          child: Text(
                            " Log In",
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
      ),
    );
  }
}
