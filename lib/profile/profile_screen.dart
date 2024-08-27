import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ylaevent/profile/create_event/agency_details_screen.dart';
import 'package:ylaevent/profile/create_event/show_transaction.dart';
import 'package:ylaevent/profile/credite_card/credit_card_screen.dart';
import 'package:ylaevent/edit_profile_screen.dart';
import 'package:ylaevent/home/main/main_cubit.dart';
import 'package:ylaevent/modules/login/loginScreen.dart';
import 'package:ylaevent/profile/cubit/cubit.dart';
import 'package:ylaevent/profile/cubit/states.dart';
import 'package:ylaevent/remote/cache_helper.dart';
import 'package:ylaevent/shared/components/components.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String? Language;
    return BlocProvider(
      create: (context) => ProfileCubit()..getProfileData(),
      child: BlocConsumer<ProfileCubit , ProfileStates>(
        listener: (context, state)async {
          if(state is SuccessSignOutState){
            await CacheHelper.removeData(key: 'token');
            navigateAndFinish(context, LogInScreen());
          }
        },
        builder: (context, state) {
          var model = MainCubit.get(context);
          var data = ProfileCubit.get(context).profileDataModel?.data;
          return ConditionalBuilder(
            condition: state is! LoadingGetProfileDataState && data != null,
            builder: (context) => Padding(
              padding:  EdgeInsets.all(15.0.r),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                      child: CircleAvatar(
                        radius: 70.r,
                        backgroundImage: const AssetImage('assets/man-avatar.png'),
                      ),
                    ),
                    SizedBox(height: 20.h,),
                    Text(
                      '${data?.name}',
                      style: TextStyle(
                          fontSize: 25.sp,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 20.h,),
                    GestureDetector(
                      onTap: () {
                        navigateTo(context, EditProfileScreen(model: data,));
                      },
                      child: Container(
                        width: double.infinity,
                        height: 55.h,
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(10.r),
                          boxShadow: [
                            BoxShadow(
                              color: Theme.of(context).shadowColor,
                              spreadRadius: 0.5,
                              blurRadius: 0.5,
                              offset:const Offset(0, 1), // changes position of shadow
                            ),
                          ],
                        ),
                        child:  Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 10.r),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(Icons.mode_edit_outlined, color: Colors.deepPurple,),
                              SizedBox(width: 10.w,),
                              const Text("Edit Profile"),
                              const Spacer(),
                              const Icon(Icons.arrow_forward_outlined , color: Colors.grey,)
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h,),
                    GestureDetector(
                      onTap: (){
                        navigateTo(context, MySample());
                      },
                      child: Container(
                        width: double.infinity,
                        height: 55.h,
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Theme.of(context).shadowColor,
                              spreadRadius: 0.5,
                              blurRadius: 0.5,
                              offset:const Offset(0, 1), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 10.r),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(Icons.credit_card, color: Colors.deepPurple,),
                              SizedBox(width: 10.w,),
                              const Text("Credit Card"),
                              const Spacer(),
                              const Icon(Icons.arrow_forward_outlined , color: Colors.grey,)
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h,),
                    GestureDetector(
                      onTap: (){
                        navigateTo(context, ShowTransaction());
                      },
                      child: Container(
                        width: double.infinity,
                        height: 55.h,
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Theme.of(context).shadowColor,
                              spreadRadius: 0.5,
                              blurRadius: 0.5,
                              offset:const Offset(0, 1), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 10.r),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(Icons.monetization_on_outlined, color: Colors.deepPurple,),
                              SizedBox(width: 10.w,),
                              const Text("Show Transactions"),
                              const Spacer(),
                              const Icon(Icons.arrow_forward_outlined , color: Colors.grey,)
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h,),
                    GestureDetector(
                      onTap: (){
                        navigateTo(context, AgencyDetailsScreen());
                      },
                      child: Container(
                        width: double.infinity,
                        height: 55.h,
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Theme.of(context).shadowColor,
                              spreadRadius: 0.5,
                              blurRadius: 0.5,
                              offset:const Offset(0, 1), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 10.r),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(Icons.add_outlined, color: Colors.deepPurple,),
                              SizedBox(width: 10.w,),
                              const Text("Create Event"),
                              const Spacer(),
                              const Icon(Icons.arrow_forward_outlined , color: Colors.grey,)
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h,),
                    Container(
                      width: double.infinity,
                      height: 55.h,
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(10.r),
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context).shadowColor,
                            spreadRadius: 0.5,
                            blurRadius: 0.5,
                            offset: const Offset(0, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 10.r),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(Icons.color_lens_outlined, color: Colors.deepPurple,),
                            SizedBox(width: 10.w,),
                            const Text("Theme"),
                            const Spacer(),
                            Switch(
                              overlayColor: MaterialStateProperty.resolveWith<Color?>(
                                    (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.selected)) {
                                    return Colors.deepPurple.withOpacity(0.54);
                                  }
                                  return Colors.amber.shade400;
                                },
                              ),
                              inactiveThumbColor: Colors.amber,
                              inactiveTrackColor: Colors.amber[200],
                              value: CacheHelper.getData(key: 'mode') ?? model.darkTheme,
                              onChanged: (value){
                                model.ChangeTheme(value);
                              },
                              thumbIcon:  MaterialStateProperty.resolveWith<Icon?>(
                                    (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.selected)) {
                                    return const Icon(Icons.dark_mode_outlined);
                                  }
                                  return const Icon(Icons.light_mode_outlined,);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h,),
                    GestureDetector(
                      onTap: (){
                        AwesomeDialog(
                          context: context,
                          showCloseIcon: true,
                          animType: AnimType.scale,
                          btnOkColor: Colors.deepPurple,
                          dialogType: DialogType.noHeader,
                          padding: EdgeInsets.all(10.r),
                          title: 'Log Out',
                          desc: 'Do you want to log out?',
                          btnOkOnPress: () {
                            ProfileCubit.get(context).signOut();
                          },
                        ).show();
                      },
                      child: Container(
                        width: double.infinity,
                        height: 55.h,
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(10.r),
                          boxShadow: [
                            BoxShadow(
                              color: Theme.of(context).shadowColor,
                              spreadRadius: 0.5,
                              blurRadius: 0.5,
                              offset: const Offset(0, 1), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 10.r),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(Icons.logout_outlined, color: Colors.deepPurple,),
                              SizedBox(width: 10.w,),
                              const Text("Log out"),
                              const Spacer(),
                              const Icon(Icons.arrow_forward_outlined , color: Colors.grey,)
                            ],
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
            fallback: (context) => const Center(child: CircularProgressIndicator(),),
          );
        },
      ),
    );
  }
}
