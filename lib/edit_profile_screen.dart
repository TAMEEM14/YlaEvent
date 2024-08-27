import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ylaevent/home/main/main_cubit.dart';
import 'package:ylaevent/home/main/main_screen.dart';
import 'package:ylaevent/profile/cubit/cubit.dart';
import 'package:ylaevent/profile/cubit/states.dart';
import 'package:ylaevent/shared/components/components.dart';

class EditProfileScreen extends StatelessWidget {

  final model;
  var formKey = GlobalKey<FormState>();


   EditProfileScreen({super.key, this.model});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: BlocConsumer<ProfileCubit , ProfileStates>(
        listener: (context, state) {
          if(state is SuccessUpdateProfileDataState) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.green, width: 1),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  content:  Center(
                    child: Text(
                      'Update Profile Success',
                      style:  TextStyle(
                        color: Colors.white,
                        fontSize: 15.sp,
                      ),),
                  ),
                  backgroundColor: Colors.green,
                ));
            MainCubit.get(context).currentIndex = 3;
            navigateAndFinish(context, MainScreen());
          }
        },
        builder: (context, state) {
          var nameController = TextEditingController(text: model.name);
          var cityController = TextEditingController(text: model.city);
          return  Scaffold(
            appBar: AppBar(),
            body:Form(
              key: formKey ,
              child: Padding(
                padding:  EdgeInsets.all(20.0.r),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        defaultformfild(
                          control: nameController,
                            labeltext:'Name' ,
                            validat: (String? value){
                              if(value!.isEmpty){
                                return 'enter your name' ;
                              }
                            },
                            Suffix: Icons.edit,
                            prefix: Icons.person
                        ),
                        SizedBox(height: 15.h,),
                        defaultformfild(
                            initialValue: model.email,
                            readOnly: true,
                            labeltext:'Email' ,
                            validat: (String? value){
                              if(value!.isEmpty){
                                return 'enter your email';
                              }
                            },
                            prefix: Icons.email_outlined
                        ),
                        SizedBox(height: 15.h,),
                        defaultformfild(
                            control: cityController,
                            labeltext:'City' ,
                            validat: (String? value){
                              if(value!.isEmpty){
                                return 'enter your city ' ;
                              }
                            },
                            Suffix: Icons.edit,
                            prefix: Icons.location_city_outlined
                        ),
                        SizedBox(height: 15.h,),
                        defaultformfild(
                            initialValue: model.phoneNumber,
                            readOnly: true,
                            labeltext:'Phone number' ,
                            validat: (String? value){
                              if(value!.isEmpty){
                                return 'enter your phone number ' ;
                              }
                            },
                            prefix: Icons.phone_outlined
                        ),
                        SizedBox(height: 15.h,),
                        ConditionalBuilder(
                          condition: state is! LoadingUpdateProfileDataState,
                          builder: (context) =>  defaultbutton(
                            context: context,
                            function: (){
                              if(formKey.currentState!.validate()){
                                ProfileCubit.get(context).updateProfileData(name: nameController.text, city: cityController.text);
                              }
                            },
                            text: 'Save Change',
                            backcground: Theme.of(context).primaryColor,
                          ),
                          fallback: (context) =>const Center(child: CircularProgressIndicator(),),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ) ,
          );
        },
      ),
    );
  }
}
