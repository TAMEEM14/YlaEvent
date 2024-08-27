import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ylaevent/home/home_screen.dart';
import 'package:ylaevent/home/main/main_screen.dart';
import 'package:ylaevent/modules/forget_password/enter_email/enterEmailScreen.dart';
import 'package:ylaevent/modules/login/cubit/cubit.dart';
import 'package:ylaevent/modules/login/cubit/states.dart';
import 'package:ylaevent/modules/register/registerScreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ylaevent/shared/components/components.dart';

class LogInScreen extends StatelessWidget {
  late double width = 0.0;
  late double height = 0.0;
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    // Initialize ScreenUtil
    ScreenUtil.init(context);
    // Assign device width and height to the initialized variables
    width = ScreenUtil().screenWidth;
    height = ScreenUtil().screenHeight;
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if(state is LoginSuccessState){
            navigateAndFinish(context, MainScreen());
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Form(
              key: formKey,
              child: Stack(
                children: [
                  basicContainer(
                    text: ' Welcome back Sign in ',
                  ),
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
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18.0,
                        ),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 150,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                defaultFormField(
                                  isPassword: true,
                                  text: 'Gmail',
                                  textInputType: TextInputType.emailAddress,
                                  //suffixIcon: Icons.check,
                                  brefixIcon: Icons.email_outlined,
                                  controller: emailController,
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return 'Enter your email addres';
                                    } else
                                      return null;
                                  },
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                defaultFormField(
                                  text: 'Password',
                                  //suffixIcon:  Icons.visibility_off,
                                  brefixIcon: Icons.lock_outline_rounded,
                                  controller: passwordController,
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return 'Enter your password';
                                    } else
                                      return null;
                                  },
                                  isPassword: LoginCubit.get(context).isPassword,
                                  suffixpresed: ()
                                    {
                                      LoginCubit.get(context).changePasswordVisibility();
                                    },
                                  suffixIcon: LoginCubit.get(context).suffix,
                                  onSubmit: (value)
                                    {
                                      if (formKey.currentState!.validate()) {
                                        LoginCubit.get(context).userLogin(
                                          email: emailController.text,
                                          password: passwordController.text,
                                        );
                                      }
                                    }
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: TextButton(
                                    onPressed: () {
                                      navigateTo(context, EnterEmailScreen());
                                    },
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty
                                          .resolveWith<Color>(
                                        (Set<MaterialState> states) {
                                          if (states
                                              .contains(MaterialState.pressed))
                                            return Colors.grey;
                                          return Colors.white;
                                        },
                                      ),
                                      padding:
                                          MaterialStateProperty.all<EdgeInsets>(
                                        EdgeInsets.all(5.0),
                                      ),
                                    ),
                                    child: Text(
                                      'Forgot Password?',
                                      style: TextStyle(
                                        color: Color(0xFF310055),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10.sp,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 17.h,
                                ),
                                ConditionalBuilder(
                                    condition: State is !LoginLoadingState ,
                                    builder: (context) =>  basicBottom(
                                        text: 'SIGN IN',
                                        function: () {
                                          if (formKey.currentState!.validate()) {
                                            LoginCubit.get(context).userLogin(
                                              email: emailController.text,
                                              password: passwordController.text,
                                            );
                                          }
                                          ;
                                        }),
                                     fallback: (context) => Center(child: CircularProgressIndicator()),
                                ),

                                SizedBox(
                                  height: 10.h,
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Dont have an account?',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 15.sp,
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          navigateTo(context, RegisterScreen());
                                        },
                                        child: Text(
                                          'Sign up',
                                          style: TextStyle(
                                            color: Color(0xFF310055),
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
