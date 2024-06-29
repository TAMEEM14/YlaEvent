import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ylaevent/home/main/main_cubit.dart';
import 'package:ylaevent/home/main/states.dart';

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
            title: Text('YalaEvent'),
          ),
          body: model.BottomScreen[model.currentIndex],
          bottomNavigationBar:NavigationBar(
            onDestinationSelected: (int index) {
              model.ChangBottom(index);
            },
            selectedIndex: model.currentIndex,
            destinations: const <Widget>[
              NavigationDestination(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.star),
                label: 'Interested',
              ),
              NavigationDestination(
                icon: Icon(Icons.shopping_cart_rounded),
                label: 'Pocket',
              ),
              NavigationDestination(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        );
      },
    );
  }
}
