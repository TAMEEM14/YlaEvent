import 'package:bottom_picker/bottom_picker.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:ylaevent/modules/login/loginScreen.dart';
import 'package:ylaevent/modules/otp/otpScreen.dart';
import 'package:ylaevent/modules/register/cubit/cubit.dart';
import 'package:ylaevent/modules/register/cubit/states.dart';
import 'package:ylaevent/shared/components/components.dart';




class RegisterScreen extends StatelessWidget {
  late double width = 0.0;
  late double height = 0.0;
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var emailAddressController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var birthdayController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    // Initialize ScreenUtil
    ScreenUtil.init(context);
    // Assign device width and height to the initialized variables
    width = ScreenUtil().screenWidth;
    height = ScreenUtil().screenHeight;
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if(state is RegisterSuccessState)
            {
              navigateAndFinish(context, OtpScreen(
                emailAddressController.text,
              ));
            }
        },
        builder: (context, state) {
          return Scaffold(
              body: Form(
            key: formKey,
            child: Stack(children: [
              basicContainer(text: 'Create your account'),
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
                              top: 50,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                defaultFormField(
                                  isPassword: true,
                                  controller: nameController,
                                  textInputType: TextInputType.emailAddress,
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return 'Required';
                                    }
                                  },
                                  text: 'Full Name',
                                  brefixIcon: Icons.person,
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                defaultFormField(
                                  isPassword: true,
                                  controller: phoneNumberController,
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return 'Required';
                                    } else
                                      return null;
                                  },
                                  text: 'Phone Number',
                                  brefixIcon: Icons.phone,
                                  textInputType: TextInputType.phone,
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                defaultFormField(
                                  isPassword: true,
                                  controller: emailAddressController,
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return 'Required';
                                    } else
                                      return null;
                                  },
                                  text: 'Email Address',
                                  brefixIcon: Icons.email,
                                  textInputType: TextInputType.emailAddress,
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                defaultFormField(
                                  controller: passwordController,
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return 'Required';
                                    }
                                    if(value.length < 8)
                                      {
                                        return 'password is too short';
                                    }
                                  },
                                  text: 'Password',
                                  brefixIcon: Icons.lock,
                                  suffixIcon: RegisterCubit.get(context).suffix,
                                  suffixpresed: () {
                                    RegisterCubit.get(context)
                                        .changePasswordVisibility();
                                  },
                                  isPassword:
                                      RegisterCubit.get(context).isPassword,
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                defaultFormField(
                                    controller: confirmPasswordController,
                                    validate: (value) {
                                      if (value!.isEmpty) {
                                        return 'Required';
                                      }
                                      print(passwordController);
                                      print(confirmPasswordController);
                                      if(passwordController.text != confirmPasswordController.text )
                                        return 'Not Match' ;
                                    },
                                    text: 'Confirm Password',
                                    brefixIcon: Icons.check,
                                    suffixIcon:RegisterCubit.get(context).suffixConfirm ,
                                    suffixpresed: () {
                                      RegisterCubit.get(context).changeconfirmPasswordVisibility();
                                    },
                                  isPassword: RegisterCubit.get(context).confirmPasswor,
                                    ),


                                SizedBox(
                                  height: 10.h,
                                ),
                                defaultFormField(
                                  isPassword: true,
                                  controller: birthdayController,
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return 'Required';
                                    }
                                  },
                                  readOnly: true,
                                  text: 'Age',
                                  brefixIcon: Icons.cake_outlined,
                                  textInputType: TextInputType.datetime,
                                  onTap: (){
                                    openDatePicker(context);
                                  },
                                ),
                                SizedBox(
                                  height: 25.h,
                                ),
                                ConditionalBuilder(
                                condition: state is !RegisterLoadingState,
                                builder: (context) => basicBottom(
                                  text: 'SING UP',
                                  function: () {
                                    if(formKey.currentState!.validate())
                                      {
                                        RegisterCubit.get(context).userRegister(
                                          name: nameController.text,
                                          email: emailAddressController.text,
                                          password: passwordController.text,
                                          phone: phoneNumberController.text,
                                          confirmPassword: confirmPasswordController.text,
                                          birthday: birthdayController.text,
                                        );
                                      }

                                    },
                                  ),
                                  fallback: (context) => Center(child: CircularProgressIndicator()) ,
                                )
                              ],
                            ),
                          ),
                        ),
                      )))
            ]),
          ));
        },
      ),
    );
  }
  void openDatePicker(BuildContext context) {
    BottomPicker.date(
      pickerTitle: Text(
        'Select a date',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color(0xFF310055),
        ),
      ),
      dateOrder: DatePickerDateOrder.ymd,
      titlePadding: EdgeInsetsDirectional.symmetric(
        vertical: 10,
      ),
      buttonStyle: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(colors: [
            Color(0xFF310055),
            Color(0xFF6818A5),
          ])),
      pickerTextStyle: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.bold,
        color: Color(0xFF310055),
      ),
      onChange: (date) {
        birthdayController.text = DateFormat('yyy-MM-dd').format(date);
      },
    ).show(context);
  }
}


