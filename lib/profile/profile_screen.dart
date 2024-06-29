import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ylaevent/edit_profile_screen.dart';
import 'package:ylaevent/change_password_screen.dart';
import 'package:ylaevent/home/main/main_cubit.dart';
import 'package:ylaevent/home/main/states.dart';
import 'package:ylaevent/remote/cache_helper.dart';
import 'package:ylaevent/shared/components/components.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit , AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var model = MainCubit.get(context);
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Center(
                child: CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage('assets/photo.jpg'),
                ),
              ),
              SizedBox(height: 20,),
              Text(
                'Tameem Shkir',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: () {
                  navigateTo(context, EditProfileScreen());
                },
                child: Container(
                  width: double.infinity,
                  height: 55,
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow:[
                      BoxShadow(
                        color: Theme.of(context).shadowColor,
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.mode_edit_outlined, color: Colors.deepPurple,),
                        SizedBox(width: 10,),
                        Text("Edit Profile"),
                        Spacer(),
                        Icon(Icons.arrow_forward_outlined , color: Colors.grey,)
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: (){
                  navigateTo(context, ChangePasswordScreen());
                },
                child: Container(
                  width: double.infinity,
                  height: 55,
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow:[
                      BoxShadow(
                        color: Theme.of(context).shadowColor,
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.lock_reset_outlined, color: Colors.deepPurple,),
                        SizedBox(width: 10,),
                        Text("Change Password"),
                        Spacer(),
                        Icon(Icons.arrow_forward_outlined , color: Colors.grey,)
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                width: double.infinity,
                height: 55,
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow:[
                    BoxShadow(
                      color: Theme.of(context).shadowColor,
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.add_outlined, color: Colors.deepPurple,),
                      SizedBox(width: 10,),
                      Text("Create Event"),
                      Spacer(),
                      Icon(Icons.arrow_forward_outlined , color: Colors.grey,)
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                width: double.infinity,
                height: 55,
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow:[
                    BoxShadow(
                      color: Theme.of(context).shadowColor,
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.color_lens_outlined, color: Colors.deepPurple,),
                      SizedBox(width: 10,),
                      Text("Theme"),
                      Spacer(),
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
                        value: CacheHelper.getData(key: 'mode'),
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
              SizedBox(height: 20,),
              GestureDetector(
                onTap: (){
                  AwesomeDialog(
                    context: context,
                    showCloseIcon: true,
                    animType: AnimType.scale,
                    btnOkColor: Colors.deepPurple,
                    dialogType: DialogType.noHeader,
                    padding: EdgeInsets.all(10),
                    title: 'Log Out',
                    desc: 'Do you want to log out?',
                    btnOkOnPress: () {},
                  )..show();
                },
                child: Container(
                  width: double.infinity,
                  height: 55,
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow:[
                      BoxShadow(
                        color: Theme.of(context).shadowColor,
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.mode_edit_outlined, color: Colors.deepPurple,),
                        SizedBox(width: 10,),
                        Text("Log out"),
                        Spacer(),
                        Icon(Icons.arrow_forward_outlined , color: Colors.grey,)
                      ],
                    ),
                  ),
                ),
              ),

            ],
          ),
        );
      },
    );
  }
}
