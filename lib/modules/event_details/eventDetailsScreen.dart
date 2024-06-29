import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:ylaevent/shared/components/components.dart';

class EventDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 280,
            width: double.infinity,
            child: Stack(
              children: [
                Image(
                    image: AssetImage(
                  'assets/images/ylaevent (3).png',
                )),
                Align(
                    alignment: AlignmentDirectional.topStart,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_back),
                      color: Colors.white,
                    )),
                Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.favorite),
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                    top: 200,
                    start: 20,
                    //start: 20,
                  ),
                  child: Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 5,
                      ),
                    ]),
                    child: Column(
                      children: [
                        Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Text(
                            'Tomorroland',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Jaro',
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.date_range,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '25-26 julY,2021',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                // fontFamily: 'Jaro'
                              ),
                            ),
                            SizedBox(
                              width: 45,
                            ),
                            Icon(
                              Icons.access_time_outlined,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '4PM-12PM',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                // fontFamily: 'Jaro'
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
              start: 20,
              top: 10,
            ),
            child: Column(
              children: [
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    'Description',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    'Elctric music festival afjldkfjlkjnvfkvnigjal;vkndvf;j,jhjkhbhjbhhjkhbbhbhlbbbbbb kjh j kjh kj',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Read more',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    'Intrested',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                  ),
                ),
                basicBottom(text: 'BuyTicket', function: (){}),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
