import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ylaevent/home/home_screen.dart';
import 'package:ylaevent/home/main/main_cubit.dart';
import 'package:ylaevent/home/main/main_screen.dart';
import 'package:ylaevent/home/main/states.dart';
import 'package:ylaevent/remote/cache_helper.dart';
import 'package:ylaevent/remote/dio.dart';
import 'package:ylaevent/shared/bloc_observer.dart';
import 'package:ylaevent/shared/components/constans.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  if(CacheHelper.getData(key: 'mode'))
    mode = ThemeMode.dark;
  else
    mode = ThemeMode.light;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCubit(),
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
              fontFamily: 'Jaro',
              shadowColor: Colors.grey,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple,).copyWith(
                background: Colors.grey[50]!,
                surfaceTint: Colors.transparent,
              ),
              appBarTheme: AppBarTheme(
                elevation: 4.0,
                shadowColor: Theme.of(context).colorScheme.shadow,
              ),
              useMaterial3: true,
            ),
            darkTheme: ThemeData(
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
            home: MainScreen(),
          );
        },
      ),
    );
  }
}


