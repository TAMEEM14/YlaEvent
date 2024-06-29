import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ylaevent/modules/forget_password/cubit/cubit.dart';
import 'package:ylaevent/modules/forget_password/cubit/states.dart';
import 'package:ylaevent/modules/login/loginScreen.dart';
import 'package:ylaevent/shared/components/components.dart';

class ResetPassword extends StatelessWidget {
  late double width = 0.0;
  late double height = 0.0;
  var formKey = GlobalKey<FormState>();
  var PasswordController = TextEditingController();
  var emailAddress;

  ResetPassword(
    this.emailAddress,
  );

  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil
    ScreenUtil.init(context);
    // Assign device width and height to the initialized variables
    width = ScreenUtil().screenWidth;
    height = ScreenUtil().screenHeight;

    return BlocProvider(
      create: (context) => ForgetPasswordCubit(),
      child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordStates>(
        listener: (context, State) {
          if(State is ResetPasswordSuccessState)
            {
              navigateAndFinish(context, LogInScreen());
            }
        },
        builder: (context, state) {
          return Scaffold(
            body: Stack(
              children: [
                basicContainer(),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                    top: 150.0,
                  ),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                      color: Colors.white,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 100),
                            child: Text(
                              'Reset your password',
                              style: TextStyle(
                                color: Color(0xFF6818A5),
                                fontWeight: FontWeight.bold,
                                fontSize: 30.sp,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 7.h,
                          ),
                          Text('Please enter your new password',
                              style: TextStyle(
                                color: Colors.grey,
                              )),
                          SizedBox(
                            height: 40.h,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Form(
                              key: formKey,
                              child: defaultFormField(
                                controller: PasswordController,
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return 'Required';
                                  }
                                  if (value.length < 8) {
                                    return 'your password is too short';
                                  }
                                },
                                text: 'Password',
                                brefixIcon: Icons.lock,
                                suffixIcon:
                                    ForgetPasswordCubit.get(context).suffix,
                                suffixpresed: () {
                                  ForgetPasswordCubit.get(context)
                                      .changePasswordVisibility();
                                },
                                isPassword:
                                    ForgetPasswordCubit.get(context).isPassword,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          basicBottom(
                              text: 'Done',
                              function: () {
                                if (formKey.currentState!.validate()) {
                                  ForgetPasswordCubit.get(context).resetPassword(
                                    email: emailAddress.toString(),
                                    newPassword: PasswordController.text,
                                  );
                                }
                              }),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
