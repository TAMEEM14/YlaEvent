import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ylaevent/modules/event_details/cubit/cubit.dart';
import 'package:ylaevent/modules/event_details/cubit/states%20(2).dart';
import 'package:ylaevent/shared/components/constans.dart';

class EventSponsor extends StatelessWidget {
  late double width = 0.0;
  late double height = 0.0;
  final id;

   EventSponsor({super.key, this.id});

  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil
    ScreenUtil.init(context);
    // Assign device width and height to the initialized variables
    width = ScreenUtil().screenWidth;
    height = ScreenUtil().screenHeight;
    return BlocProvider(
      create: (context) => EventDetailsCubit()..getEventSponsor(id:id ),
      child: BlocConsumer<EventDetailsCubit, EventDetailstates>(
        listener: (context, state) {},
        builder: (context, state) {
          var model = EventDetailsCubit.get(context).eventSponsorModel?.data;
          return Scaffold(
            appBar: AppBar(
              title: Text('Sponsors'),
              ///mn tameeeeem
            ),
            body: Column(
              children: [
                ConditionalBuilder(
                    condition: state is! EventSponsorLoadingState && model != null,
                    builder: (context) => Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, index) =>
                              eventSponserItem(model[index], context),
                          separatorBuilder: (context, index) => SizedBox(height: 10.h,),
                          itemCount: model!.length),
                    ),
                  fallback: (context) =>const Center(child: CircularProgressIndicator(),),
                          ),
              ],
            ));
        },
      ),
    );
  }

  Widget eventSponserItem(data, context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        width: double.infinity,
        height: 100.h,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                '$image${data.photoLink}',
                width: 100.w,
                height: 200.h,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${data.name}",
                  style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text('${data.phoneNumber}'),
                SizedBox(
                  height: 10.h,
                ),
                Text('${data.email}'),
                SizedBox(
                  height: 10.h,
                ),

              ],
            ),
           
          ],
        ),
      ),
    );
  }
}
