import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ylaevent/shared/components/constans.dart';

class FoodServicesDetailsScreen extends StatelessWidget {
  const FoodServicesDetailsScreen({super.key, this.data ,});
  final data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.all(10.0.r),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                    itemBuilder: (context, index) => foodMenuItem(data.menus[index]),
                    separatorBuilder: (context, index) => SizedBox(height: 10.h),
                    itemCount: data.menus.length,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget foodMenuItem(menu){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
          '${menu.name}',
        style: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.bold
        ),
      ),
      SizedBox(height: 7.h,),
      SizedBox(
        height: 150,
        width: double.infinity,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => foodServicesDetails(menu.foodMenuItems[index], context),
          separatorBuilder: (context, index) => SizedBox(width: 10.h),
          itemCount: menu.foodMenuItems.length,
        ),
      ),
    ],
  );
}

Widget foodServicesDetails(data, context) {

  return GestureDetector(
    child: Container(
      color: Colors.white,
      height: 60.h,
      width: 230.w,
      child: Row(
        children: [
          Image.network(
            '$image${data.photoLink}', // Ensure the path is correct
            width: 80.w,
            height: 50.h,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) =>Image.asset(
                'assets/img_1.png', // Ensure the path is correct
                width: 80.w,
                height: 50.h,
                fit: BoxFit.cover,
          ),
          ),
          SizedBox(width: 15.w),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text('${data.name}'),
                SizedBox(height: 10.h,),
                Text('${data.description}'),
                SizedBox(height: 10.h,),
                Text('Price : ${data.price}'),
                SizedBox(height: 10.h,),
                Text('Quantity : ${data.quantity}'),
              ],
            ),
          ),

        ],
      ), // Set a fixed height for each item
    ),
  );
}
