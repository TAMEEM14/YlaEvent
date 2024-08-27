import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:ylaevent/home/main/main_cubit.dart';
import 'package:ylaevent/home/main/states.dart';
import 'package:ylaevent/modules/event_details/eventDetailsScreen.dart';
import 'package:ylaevent/shared/components/components.dart';
import 'package:ylaevent/shared/components/constans.dart';


class HomeScreen extends StatelessWidget {
  int t = 0;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit , AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var model = MainCubit.get(context).getAllEventsModel?.data;
        return Padding(
          padding:  EdgeInsets.all(10.0.r),
          child: Column(
            children: [
              Expanded(
                child: ConditionalBuilder(
                  condition: state is! LoadingGetAllEvents && model != null,
                  builder: (context) => ListView.separated(
                      itemBuilder: (context, index) {
                        var event = model[index];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${model[index].name}",
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(
                              height: 250.h,
                              width: double.infinity,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) => eventItem(context ,index , event.events?[index]),
                                separatorBuilder: (context, index) => SizedBox(width: 10.w,),
                                itemCount: event.events!.length,
                              ),
                            ),
                          ],
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(height: 15.h,),
                      itemCount: model!.length ,
                  ),
                  fallback: (context) =>const Center(child: CircularProgressIndicator(),),
                ),
              )
            ],
          ),

        );
      },
    );
  }
}

Widget eventItem(context , index , model){
  return GestureDetector(
    onTap: (){
      navigateTo(context, EventDetails(Id: model.id));
    },
    child: SizedBox(
      width: 300.w,
      height: 250.h,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.network(
              '$image${model.photoLink}',
              height: 250.h,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Image.asset(
                'assets/party.jpg',
                height: 250.h,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 15.r , vertical: 8.r),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Spacer(),
                    Container(
                      width: 50.w,
                      height: 70.h,
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(children: [
                        SizedBox(height: 5.h,),
                        Text('${model.eventDate.substring(8,10)}',style: TextStyle(fontSize: 25.sp,fontWeight: FontWeight.bold),),
                        Text('Tue',style: TextStyle(fontSize: 17.sp,),),
                      ],),
                    ),
                  ],
                ),
                Expanded(flex: 3, child: Container(),),
                Text(
                  '${model.name}',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold
                  ),),
                SizedBox(height: 10.h,),
                Row(
                  children: [
                    const Icon(Icons.category_outlined,color: Colors.white,),
                    SizedBox(width: 7.w,),
                     Text('${model.eventCategoryName}',style: const TextStyle(color: Colors.white),),
                    const Spacer(),
                    const Icon(Icons.access_time_filled_sharp,color: Colors.white,),
                    SizedBox(width: 7.w,),
                     Text('${model.eventTime.substring(0,5)}',style:const TextStyle(color: Colors.white),),
                  ],
                ),
              ],
            ),
          ),

        ],
      ),
    ),
  );
}
