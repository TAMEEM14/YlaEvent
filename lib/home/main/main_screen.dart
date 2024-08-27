import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ylaevent/home/main/main_cubit.dart';
import 'package:ylaevent/home/main/states.dart';
import 'package:ylaevent/modules/login/loginScreen.dart';
import 'package:ylaevent/shared/components/components.dart';
import 'package:ylaevent/shared/components/constans.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit , AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var model = MainCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text('YalaEvent'),
            actions: [
              if(token == null) TextButton(onPressed: (){navigateTo(context, LogInScreen());}, child: const Text('SignIn'))
            ],
          ),
          body: model.BottomScreen[model.currentIndex],
          bottomNavigationBar:NavigationBar(
            onDestinationSelected: (int index) {
              model.ChangBottom(index);
            },
            selectedIndex: model.currentIndex,
            destinations:  <Widget>[
              NavigationDestination(
                icon: ImageIcon(const AssetImage('assets/home.png'),size: 25.r,),
                label: 'Home',
              ),
              NavigationDestination(
                icon: ImageIcon(const AssetImage('assets/ticket (2).png'),size: 30.r,),
                label: 'Pocket',
              ),
              NavigationDestination(
                icon: ImageIcon(const AssetImage('assets/profile.png'),size: 24.r,),
                label: 'Profile',
              ),
            ],
          ),
        );
      },
    );
  }
}
