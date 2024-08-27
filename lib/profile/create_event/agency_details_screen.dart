import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ylaevent/modules/event_details/cubit/cubit.dart';
import 'package:ylaevent/modules/event_details/cubit/states%20(2).dart';
import 'package:ylaevent/profile/create_event/agency-by_id_screen.dart';
import 'package:ylaevent/shared/components/components.dart';


class AgencyDetailsScreen extends StatelessWidget {
  late double width = 0.0;
  late double height = 0.0;

  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil
    ScreenUtil.init(context);
    // Assign device width and height to the initialized variables
    width = ScreenUtil().screenWidth;
    height = ScreenUtil().screenHeight;
    return BlocProvider(
        create: (context) => EventDetailsCubit()..getAgency(),
        child: BlocConsumer<EventDetailsCubit, EventDetailstates>(
            listener: (context, state) {},
            builder: (context, state) {
              var model = EventDetailsCubit.get(context).agencyDetailsModel?.data;
              return Scaffold(
                  appBar: AppBar(
                    title: Text('Agencies'),
                  ),
                  body: Column(
                    children: [
                      Expanded(
                        child: ConditionalBuilder(
                          condition: state is! AgencyLoadingState && model != null,
                          builder: (context) => Expanded(
                            child: ListView.separated(
                                itemBuilder: (context, index) =>
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: agencyItem(model[index], context),
                                    ),
                                separatorBuilder: (context, index) => SizedBox(
                                  height: 10.h,
                                ),
                                itemCount: model!.length),
                          ),
                          fallback: (context) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      ),
                    ],
                  ));
            }));

  }

  Widget agencyItem(data, context) {
    return GestureDetector(
      onTap: () {
          navigateTo(context, EgencyById(id: data.id,));
              },
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(30),
        ),
        width: double.infinity,
        height: 100.h,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                '${data.logo}',
                width: 40.w,
                height: 100.h,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Image.asset(
                    'assets/img_1.png',
                  width: 100.w,
                  height: 200.h,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${data.companyName}",
                    style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    '${data.location}',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 14.sp, ),
                  ),
                  //Text('${data.location}',maxLines: 2,overflow: TextOverflow.ellipsis,),
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget agencyById(data, context) {
  //   return GestureDetector(
  //     child: Container(
  //       color: Colors.white,
  //       height: 60.h,
  //
  //       child: Row(children: [
  //         Image.asset(
  //           'assets/images/jkfslhj.jpg', // Ensure the path is correct
  //           width: 50.w,
  //           height: 50.h,
  //           fit: BoxFit.cover,
  //         ),
  //         SizedBox(width: 15),
  //         Column(
  //           children: [
  //             Text('${data.companyName}'),
  //             SizedBox(
  //               height: 10.h,
  //             ),
  //             Text('location : ${data.location}'),
  //             SizedBox(
  //               height: 10.h,
  //             ),
  //             Text('email : ${data.contactEmail}'),
  //             SizedBox(
  //               height: 10.h,
  //             ),
  //             Text('number : ${data.contactNumber}'),
  //             SizedBox(
  //               height: 10.h,
  //             ),
  //             Text('building Location : ${data.buildingLocation}'),
  //             SizedBox(
  //               height: 10.h,
  //             ),
  //             Text('type of business : ${data.typeOfBusiness}'),
  //             SizedBox(
  //               height: 10.h,
  //             ),
  //             Text('${data.companyName}'),
  //             SizedBox(
  //               height: 10.h,
  //             ),
  //
  //           ],
  //         )
  //       ]), // Set a fixed height for each item
  //     ),
  //   );
  // }
}
