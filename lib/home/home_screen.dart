import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';


class HomeScreen extends StatelessWidget {
  int t = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemBuilder: (context, index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "All Event",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 0,),
                    Swiper(
                      itemWidth: 500,
                      itemHeight: 270,
                      loop: true,
                      duration: 500,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return eventItem(context);
                      },
                      itemCount: 5,
                      layout: SwiperLayout.TINDER,
                    ),
                  ],
                ),
                itemCount: 5
            ),
          )
        ],
      ),

    );
  }
}

Widget eventItem(context){
  return Container(
    width: 330,
    height: 250,
    child: Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.asset(
            'assets/party.jpg',
            height: 250,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15 , vertical: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Spacer(),
                  Container(
                    width: 50,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(children: [
                      SizedBox(height: 5,),
                      Text('7',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                      Text('Tue',style: TextStyle(fontSize: 17,),),
                    ],),
                  ),
                ],
              ),
              SizedBox(height: 100,),
              Text(
                'Live Music ',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),),
              Row(
                children: [

                  Icon(Icons.category_outlined,color: Colors.white,),
                  SizedBox(width: 7,),
                  Text('Dance & Arts',style: TextStyle(color: Colors.white),),
                  Spacer(),
                  Icon(Icons.access_time_filled_sharp,color: Colors.white,),
                  SizedBox(width: 7,),
                  Text('07:00 PM',style: TextStyle(color: Colors.white),),
                ],
              ),
            ],
          ),
        ),

      ],
    ),
  );
}
