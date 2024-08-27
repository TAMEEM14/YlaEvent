import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ylaevent/api/firbebase_api.dart';
import 'package:ylaevent/modules/on_boarding/onBoardingScreen.dart';
import 'package:ylaevent/onboarding/onBoardingScreen.dart';
import 'package:ylaevent/profile/credite_card/cards_screen.dart';
import 'package:ylaevent/profile/credite_card/credit_card_screen.dart';
import 'package:ylaevent/firebase_options.dart';
import 'package:ylaevent/home/home_screen.dart';
import 'package:ylaevent/home/main/main_cubit.dart';
import 'package:ylaevent/home/main/main_screen.dart';
import 'package:ylaevent/home/main/states.dart';
import 'package:ylaevent/modules/event_details/eventDetailsScreen.dart';
import 'package:ylaevent/modules/login/loginScreen.dart';
import 'package:ylaevent/remote/cache_helper.dart';
import 'package:ylaevent/remote/dio.dart';
import 'package:ylaevent/shared/bloc_observer.dart';
import 'package:ylaevent/shared/components/constans.dart';

void main() async {
  FlutterError.onError = (FlutterErrorDetails details){
    FlutterError.dumpErrorToConsole(details);
    logFlutterError(details);
  };
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseApi().initNotifications();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

    mode = CacheHelper.getData(key:'mode') == true ? ThemeMode.dark : ThemeMode.light;

  await EasyLocalization.ensureInitialized();

  token = await CacheHelper.getData(key: 'token');

  onboarding = await CacheHelper.getData(key: 'onboarding')?? false;

  langu ??= 'en';

  Widget screen;

 if(onboarding){
     screen = MainScreen();
 }else{
   screen = OnboardingExample();
 }
  print('tokennnnnnn: $token');
  print(langu);

    lang = const Locale('en');


  runZonedGuarded(() {
    runApp(
        Phoenix(
          child: MyApp(screen: screen),
        ));
  }, (error, stack) {
    logDartError(error ,stack);
  });
}

void logFlutterError(FlutterErrorDetails details){
  print('Flutter Error: ${details.exception}');
  print('Stack trace: ${details.stack}');
}

void logDartError(Object error , StackTrace stackTrace){
  print('Dart Error: $error');
  print('Stack trace: $stackTrace');
}


class MyApp extends StatelessWidget {
  final Widget screen;
  const MyApp({super.key, required this.screen});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 820),
      minTextAdapt: true,
      splitScreenMode: true,
      builder:(context, child) =>  BlocProvider(
        create: (context) => MainCubit()..getAllEvent(),
        child: BlocConsumer<MainCubit , AppStates>(
          listener: (context, state) {
            if(state is ChangThemeModeState)
              mode = MainCubit.get(context).themeMode;
          },
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner:false,
              title: 'Flutter Demo',
              theme: ThemeData(
                fontFamily: 'Ubuntu',
                shadowColor: Colors.grey,
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple,).copyWith(
                  background: Colors.grey[300]!,
                  surfaceTint: Colors.transparent,
                ),
                appBarTheme: AppBarTheme(
                  elevation: 4.0,
                  shadowColor: Theme.of(context).colorScheme.shadow,
                  color: Colors.grey[300]!,
                ),
                navigationBarTheme: NavigationBarThemeData(
                  backgroundColor: Colors.grey[350]!,
                ),
                useMaterial3: true,
              ),
              darkTheme: ThemeData(
                fontFamily: 'Ubuntu',
                primaryColor: Colors.deepPurple,
                  colorScheme: ColorScheme.fromSeed(
                    seedColor: Colors.deepPurple,
                    brightness: Brightness.dark,
                  ).copyWith(background: Colors.grey[850]!),
                  appBarTheme: AppBarTheme(
                    elevation: 4.0,
                    shadowColor: Theme.of(context).colorScheme.shadow,
                  ),
                  useMaterial3: true
              ),
              themeMode: mode,
              home: screen,
            );
          },
        ),
      ),
    );
  }
}


