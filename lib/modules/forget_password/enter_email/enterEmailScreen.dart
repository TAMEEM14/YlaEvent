import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ylaevent/modules/forget_password/cubit/cubit.dart';
import 'package:ylaevent/modules/forget_password/cubit/states.dart';
import 'package:ylaevent/modules/forget_password/verify-new-password/verifyNewPassword.dart';
import 'package:ylaevent/shared/components/components.dart';
class EnterEmailScreen extends StatelessWidget {
  late double width = 0.0;
  late double height = 0.0;
  var formKey = GlobalKey<FormState>();
  var emailAddressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil
    ScreenUtil.init(context);
    // Assign device width and height to the initialized variables
    width = ScreenUtil().screenWidth;
    height = ScreenUtil().screenHeight;

    return BlocProvider(
      create: (context) => ForgetPasswordCubit(),
      child: BlocConsumer<ForgetPasswordCubit,ForgetPasswordStates>(
        listener: (context,State){
          if(State is EnterEmailSuccessState)
            {
              navigateAndFinish(context,VerifyNewPassword(emailAddressController.text));
            }
        },
        builder: (context,State)
        {
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
                      color:Colors.white,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 100),
                            child: Text(
                              'Password recovery',
                              style: TextStyle(
                                color:  Color(0xFF6818A5),
                                fontWeight: FontWeight.bold,
                                fontSize: 30.sp,),

                            ),
                          ),
                          SizedBox(
                            height: 7.h,
                          ),
                          Text('Enter your email to recover your password',
                              style: TextStyle(
                                color: Colors.grey,
                              )),
                          SizedBox(
                            height: 40.h,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal:30
                            ),
                            child: Form(
                              key: formKey,
                              child: defaultFormField(
                                controller: emailAddressController,
                                validate: (value)
                                {
                                  if(value!.isEmpty)
                                  {
                                    return 'Required';
                                  }
                                  else
                                    return null;
                                },
                                text: 'Email Address',
                                brefixIcon: Icons.email,
                                onSubmit: (value)
                                {
                                  if(formKey.currentState!.validate())
                                  {
                                    ForgetPasswordCubit.get(context).enterEmail(email: emailAddressController.text);
                                  }
                                },
                                textInputType: TextInputType.emailAddress,
                                isPassword: true,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          basicBottom(
                              text: 'Recover Password',
                              function: ()
                              {
                                if(formKey.currentState!.validate())
                                {
                                 ForgetPasswordCubit.get(context).enterEmail(email: emailAddressController.text);
                                }

                              }),

                        ],
                      ),
                    ),
                  ),)
              ],
            ),
          ) ;
        },
      ),
    );
  }
}
