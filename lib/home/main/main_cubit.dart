import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ylaevent/home/home_screen.dart';
import 'package:ylaevent/home/interested_screen.dart';
import 'package:ylaevent/home/main/states.dart';
import 'package:ylaevent/pocket_screen.dart';
import 'package:ylaevent/profile/profile_screen.dart';
import 'package:ylaevent/remote/cache_helper.dart';
import 'package:ylaevent/shared/components/constans.dart';

class MainCubit extends Cubit<AppStates> {
  MainCubit() : super(InitialState());

  static MainCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> BottomScreen = [
    HomeScreen(),
    InterestedScreen(),
    PocketScreen(),
    ProfileScreen(),
  ];


  void ChangBottom(int index) {
    currentIndex = index;
    emit(ChangBottomNavState());
  }

  bool darkTheme = false ;
  ThemeMode themeMode = ThemeMode.light;

  void ChangeTheme(value)async {
    darkTheme = value;
    if(value)
      themeMode = ThemeMode.dark;
    else
      themeMode = ThemeMode.light;

    await CacheHelper.saveData(key: 'mode', value: darkTheme);
    emit(ChangThemeModeState());
  }

}