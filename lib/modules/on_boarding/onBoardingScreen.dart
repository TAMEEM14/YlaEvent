import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:ylaevent/modules/login/loginScreen.dart';
import 'package:ylaevent/remote/cache_helper.dart';
import 'package:ylaevent/shared/components/components.dart';

class BoardingModel{
  final String image;
  final String title;
  final String body;

  BoardingModel({
   required  this.title,
    required this.image,
    required this.body,
  });
}
class OnBoardingScreen extends StatelessWidget {
  List <BoardingModel> boarding = [
    BoardingModel(
      image: 'assets/images/ylaevent (1).png',
      title: '',
      body: 'welcom to our event app where every moment becomes an unforgettable exprience ',
    ),
    BoardingModel(
      image:'assets/images/ylaevent (2).png',
      title: 'on boarding 2 title',
      body: 'on boarding 2 body',
    ),
    BoardingModel(
      image: 'assets/images/ylaevent (3).png',
      title: 'on boarding 3 title',
      body: 'on boarding 3 body',
    ),
  ];
  var boardingController = PageController();
  bool isLast = false;
  @override
  Widget build(BuildContext context) {
    void submit()
    {
      CacheHelper.saveData(key:'onBoarding',value: true) .then((value) {
        if(value)
        {
          navigateAndFinish(context, LogInScreen());
        }
      });
    }
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            child: Text('Skip'),
            onPressed: () {
              submit();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (int index) {
                  if (index == boarding.length - 1) {
                    isLast = true;
                  }
                  else {
                    isLast = false;

                  }
                },
                controller: boardingController,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    buildBoardingItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: boardingController,
                  count: boarding.length,
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    dotHeight: 10,
                    expansionFactor: 4.0,
                    dotWidth: 10,
                    spacing: 5.0,
                    //activeDotColor: ,
                  ),


                ),
                Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (isLast) {
                      navigateAndFinish(context, LogInScreen());
                    }
                    else {
                      boardingController.nextPage(duration: Duration(
                        milliseconds: 750,
                      ),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    }
                  },
                  child: Icon(
                    Icons.arrow_forward_ios,
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
  Widget buildBoardingItem(BoardingModel model) =>
  Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
      Expanded(
        child: Padding(
          padding: EdgeInsetsDirectional.symmetric(
          horizontal: 10.0,
          ),
          child: Image(
          image: AssetImage('${model.image}'),
            ),
            ),
             ),
             Text(
            '${model.title}',
              style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF310055),
              fontSize: 30.0,
              ),
              ),
              SizedBox(
              height: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: Text(
                '${model.body}',
                style: TextStyle(
                fontWeight: FontWeight.bold,
                color:  Color(0xFF310055),
                fontSize: 17.0,
                ),
                ),
              ),
              SizedBox(
              height: 30.0,
              ),
              ],
              );


}
