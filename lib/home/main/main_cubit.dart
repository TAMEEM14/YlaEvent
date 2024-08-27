import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ylaevent/home/get_all_events_model.dart';
import 'package:ylaevent/home/home_screen.dart';
import 'package:ylaevent/home/main/states.dart';
import 'package:ylaevent/pocket/get_all_ticket_model.dart';
import 'package:ylaevent/pocket/pocket_screen.dart';
import 'package:ylaevent/profile/profile_screen.dart';
import 'package:ylaevent/remote/cache_helper.dart';
import 'package:ylaevent/remote/dio.dart';

class MainCubit extends Cubit<AppStates> {
  MainCubit() : super(InitialState());

  static MainCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> BottomScreen = [
    HomeScreen(),
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

  GetAllEventsModel? getAllEventsModel;

  Future<void> getAllEvent ()async {
    emit(LoadingGetAllEvents());

   await DioHelper.getData(
        url: 'guest-mobile-platform/event/get-event-categorized'
    ).then((value) {
      getAllEventsModel = GetAllEventsModel.fromJson(value.data);
      emit(SuccessGetAllEvents());
    }).catchError((onError){
      print(onError.toString());
      emit(ErrorGetAllEvents());
    });
  }


  GetAllTicketModel? getAllTicketModel;

  Future<void> getAllTicket()async{
    emit(LoadingGetAllTicketState());
    DioHelper.getData(
        url: 'end-user/booking/get',
    ).then((value) {
      getAllTicketModel = GetAllTicketModel.fromJson(value.data);
      emit(SuccessGetAllTicketState());
    }).catchError((onError){
      print(onError);
      emit(ErrorGetAllTicketState());
    });
  }

}