import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ylaevent/modules/login/loginScreen.dart';
import 'package:ylaevent/modules/otp/cubit/cubit.dart';
import 'package:ylaevent/modules/otp/cubit/states.dart';
import 'package:ylaevent/shared/components/components.dart';




class OtpScreen extends StatelessWidget {
  late double width = 0.0;
  late double height = 0.0;
 var firstController = TextEditingController();
 var secondController = TextEditingController();
 var thirdController = TextEditingController();
 var fourthController = TextEditingController();
 var  emailController ;
  OtpScreen(
      this.emailController,
      );
  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil
    ScreenUtil.init(context);
    // Assign device width and height to the initialized variables
    width = ScreenUtil().screenWidth;
    height = ScreenUtil().screenHeight;
    return BlocProvider(
      create: (context) => OtpCubit(),
      child: BlocConsumer<OtpCubit,OtpStates>(
        listener: (context,State){
          if(State is OtpSuccessState)
            {
              navigateAndFinish(context, LogInScreen());
            }
        },
        builder: (context,State){
          return  Scaffold(
            body: Stack(
              children: [
                basicContainer(),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                    top: 150.0.h,
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
                            padding: const EdgeInsets.only(
                              top: 100,
                            ),
                            child: Text('Check Your Email',
                                style: TextStyle(
                                  color: Color(0xFF6818A5),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30.sp,
                                )),
                          ),
                          SizedBox(
                            height: 7.h,
                          ),
                          Text('we have sent the code to your phone',
                              style: TextStyle(
                                color: Colors.grey,
                              )),
                          SizedBox(
                            height: 40.h,
                          ),
                          SingleChildScrollView(
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 35,
                                  ),
                                  child: Container(
                                    height: 68.h,
                                    width: 64.w,
                                    child: TextFormField(
                                      controller: firstController,
                                      onChanged: (value) {
                                        if (value.length == 1) {
                                          FocusScope.of(context).nextFocus();
                                        }
                                      },

                                      // decoration: const InputDecoration(hintText: '0'),
                                      textAlign: TextAlign.center,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(1),
                                        FilteringTextInputFormatter.digitsOnly,
                                      ],
                                      style:
                                      Theme.of(context).textTheme.headlineLarge,
                                      decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFF6818A5),
                                            width: 2.0.w,
                                          ),
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(25)),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFF6818A5),
                                          ),
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(25)),
                                        ),
                                        fillColor: Colors.white,
                                        filled: true,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 9.w,
                                ),
                                Container(
                                  height: 68.h,
                                  width: 64.w,
                                  child: TextFormField(
                                    controller: secondController,
                                    onChanged: (value) {
                                      if (value.length == 1) {
                                        FocusScope.of(context).nextFocus();
                                      }
                                      if(value.length==0)
                                      {
                                        FocusScope.of(context).previousFocus();
                                      }
                                    },
                                    // decoration: const InputDecoration(hintText: '0'),
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(1),
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                    style: Theme.of(context).textTheme.headlineLarge,
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF6818A5),
                                          width: 2.0.w,
                                        ),
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(25)),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF6818A5),
                                        ),
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(25)),
                                      ),
                                      fillColor: Colors.white,
                                      filled: true,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 9.w,
                                ),
                                Container(
                                  height: 68.h,
                                  width: 64.w,
                                  child: TextFormField(
                                    controller: thirdController,
                                    onChanged: (value) {
                                      if (value.length == 1) {
                                        FocusScope.of(context).nextFocus();
                                      }
                                      if(value.length==0)
                                      {
                                        FocusScope.of(context).previousFocus();
                                      }
                                    },
                                    // decoration: const InputDecoration(hintText: '0'),
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(1),
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                    style: Theme.of(context).textTheme.headlineLarge,
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF6818A5),
                                          width: 2.0.w,
                                        ),
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(25)),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF6818A5),
                                        ),
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(25)),
                                      ),
                                      fillColor: Colors.white,
                                      filled: true,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 9.w,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    right: 35,
                                  ),
                                  child: Container(
                                    height: 68.h,
                                    width: 64.w,
                                    child: TextFormField(
                                      controller: fourthController,
                                      onChanged: (value) {
                                        if (value.length == 1) {
                                          FocusScope.of(context).nextFocus();
                                        }
                                        if(value.length==0)
                                        {
                                          FocusScope.of(context).previousFocus();
                                        }
                                      },
                                      // decoration: const InputDecoration(hintText: '0'),
                                      textAlign: TextAlign.center,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(1),
                                        FilteringTextInputFormatter.digitsOnly,
                                      ],
                                      style:
                                      Theme.of(context).textTheme.headlineLarge,
                                      decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFF6818A5),
                                            width: 2.0.w,
                                          ),
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(25)),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFF6818A5),
                                          ),
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(25)),
                                        ),
                                        fillColor: Colors.white,
                                        filled: true,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 45.h,
                          ),
                          basicBottom(text: 'Verfiy', function: () {
                            final otp = '${firstController.text}${secondController.text}${thirdController.text}${fourthController.text}';
                            OtpCubit.get(context).otpverification(
                              email: emailController.toString(),
                              num: otp.toString(),
                            );
                          }),
                          SizedBox(
                            height: 15.h,
                          ),
                          Container(
                            height: 50.h,
                            width: 300.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white,
                              border: Border.all(
                                color: Color(0xFF310055),
                                width: 2.w,
                              ),
                            ),
                            child: Container(
                              decoration: BoxDecoration(boxShadow: []),
                              child: TextButton(
                                onPressed: () {
                                  OtpCubit.get(context).sendAgain(email: emailController.toString());
                                },
                                child: Center(
                                    child: Text(
                                      'Send again',
                                      style: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF310055),
                                      ),
                                    )),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ) ;
        },
      ),
    );
  }
}
