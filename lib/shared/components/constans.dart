
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// void logOut(context){
//    CacheHelper.removeData(key: 'token').then((value) {
//             if(value){
//               navigateAndFinish(context , Login());
//             }
//           });
// }
//
// void launchURL(path) async {
//   final Uri url = Uri.parse(path);
//   if (!await launchUrl(url)) {
//     throw Exception('Could not launch $url');
//   }
// }
//

var token;

ThemeMode mode = ThemeMode.light;

Locale? lang;

String? langu;

double titleSize = 13.0.sp ;

double largeSize = 18.0.sp ;

var image = 'http://192.168.209.139:8000';

bool onboarding = false;

