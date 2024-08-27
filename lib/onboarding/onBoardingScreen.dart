import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ylaevent/home/main/main_screen.dart';
import 'package:ylaevent/modules/login/loginScreen.dart';
import 'package:ylaevent/remote/cache_helper.dart';

class OnboardingExample extends StatefulWidget {
  @override
  _OnboardingExampleState createState() => _OnboardingExampleState();
}

class _OnboardingExampleState extends State<OnboardingExample> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: [
          OnboardingScreen(
            imagePath: 'assets/img_2.png',
            description: 'welcom to our event app where every moment becomes an unforgettable exprience ',
            buttonText: 'Next',
            onButtonPressed: () {
              _pageController.nextPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.ease,
              );
            },
          ),
          OnboardingScreen(
            imagePath: 'assets/img_3.png',
            description: 'Effortlessly discover events happening around you.',
            buttonText: 'Next',
            onButtonPressed: () {
              _pageController.nextPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.ease,
              );
            },
          ),
          OnboardingScreen(
            imagePath: 'assets/img_4.png',
            description: 'easily booking  your tickets in just a few simple steps',
            buttonText: 'Get Started',
            onButtonPressed: () {
              CacheHelper.saveData(key: 'onboarding', value: true);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MainScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class OnboardingScreen extends StatelessWidget {
  final String imagePath;
  final String description;
  final String buttonText;
  final VoidCallback onButtonPressed;

  const OnboardingScreen({
    Key? key,
    required this.imagePath,
    required this.description,
    required this.buttonText,
    required this.onButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil
    ScreenUtil.init(context, designSize: Size(360, 690));

    return Scaffold(
      body: Stack(
        children: [
          // Fullscreen image
          Positioned.fill(
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),

          // Description at the top
          Positioned(
            top: 250.h,
            left: 20.w,
            right: 20.w,
            child: Text(
              description,
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                shadows: [
                  Shadow(
                    offset: Offset(2.0, 2.0), // Position of the shadow
                    blurRadius: 3.0, // How blurry the shadow is
                    color: Colors.black.withOpacity(0.5), // Shadow color and opacity
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),

          // Button at the bottom
          Positioned(
            bottom: 50.h,
            left: 20.w,
            right: 20.w,
            child: ElevatedButton(
              onPressed: onButtonPressed,
              style: ElevatedButton.styleFrom(
                //primary: Colors.white, // Button background color
                padding: EdgeInsets.symmetric(vertical: 15.h),
              ),
              child: Text(
                buttonText,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
