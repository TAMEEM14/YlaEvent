import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';
import 'package:ylaevent/modules/event_details/cubit/cubit.dart';
import 'package:ylaevent/modules/event_details/cubit/states%20(2).dart';
import 'package:ylaevent/modules/event_details/event_sponsor.dart';
import 'package:ylaevent/modules/event_details/food_service/food_services.dart';
import 'package:ylaevent/shared/components/constans.dart';

import '../../shared/components/components.dart';

class EventDetails extends StatelessWidget {
  late double width = 0.0;
  late double height = 0.0;
  final Id;

   EventDetails({super.key, this.Id});
  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil
    ScreenUtil.init(context);
    // Assign device width and height to the initialized variables
    width = ScreenUtil().screenWidth;
    height = ScreenUtil().screenHeight;
    return BlocProvider(
      create: (context) => EventDetailsCubit()..getEventDataById(id: Id)..getMusicalBand(id: Id)..getFoodServices(id: Id),
      child: BlocConsumer<EventDetailsCubit, EventDetailstates>(
        listener: (context, state) {
          if(state is SuccessPostBookingState){
            AwesomeDialog(
              context: context,
              showCloseIcon: true,
              animType: AnimType.scale,
              btnOkColor: Colors.deepPurple,
              dialogType: DialogType.noHeader,
              padding: EdgeInsets.all(10.r),
              title: 'Success Booking',
              desc: 'Complete the payment procedures from the page pocket',
              btnOkOnPress: () {},
            ).show();
          }
        },
        builder: (context, state) {
          var eventData = EventDetailsCubit.get(context).eventDataByIdModel?.data;
          var musicalBandData = EventDetailsCubit.get(context).musicalBandModel?.data;
          var food = EventDetailsCubit.get(context).foodServicesModel?.data;
          return Scaffold(
            backgroundColor: Colors.white,
            body: ConditionalBuilder(
              condition: state is! MusicalBandLoadingState && state is! LoadingGetEventDataByIdState && eventData != null && state is! FoodServicesLoading,
              builder: (context) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            height: 280.h,
                            width: double.infinity,
                            child: Image.network(
                              '$image${eventData?.photoLink}',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: 40.h,
                            left: 16.w,
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.arrow_back),
                              color: Colors.white,
                            ),
                          ),
                          Positioned(
                            top: 40.h,
                            right: 16.w,
                            child: Text(''),
                          ),
                          Positioned(
                            bottom: 0.h,
                            left: 20.w,
                            right: 20.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${eventData?.name}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 35.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8.h),
                                Row(
                                  children: [
                                   const Icon(
                                      Icons.date_range,
                                      color: Colors.white70,
                                    ),
                                    SizedBox(width: 8.w),
                                    Text(
                                      '${eventData?.eventDate}',
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    SizedBox(width: 30.w),
                                    const Icon(
                                      Icons.access_time_outlined,
                                      color: Colors.white70,
                                    ),
                                    SizedBox(width: 8.w),
                                    Text(
                                      '${eventData?.eventTime?.substring(0,5)}',
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 16.h),
                              ],
                            ),
                          ),
                        ],
                      ),
                       Padding(
                         padding: const EdgeInsets.symmetric(
                             horizontal: 20, vertical: 20),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text(
                               'Description',
                               style: TextStyle(
                                 fontSize: 20.sp,
                                 fontWeight: FontWeight.bold,
                               ),
                             ),
                             SizedBox(height: 10.h),
                             ReadMoreText(
                               '${eventData?.description}',
                               trimMode: TrimMode.Line,
                               trimLines: 2,
                               colorClickableText: Color(0xFF6818A5),
                               trimCollapsedText: 'Show more',
                               trimExpandedText: 'Show less',
                               moreStyle: TextStyle(
                                   fontSize: 14.sp, fontWeight: FontWeight.bold),
                             ),
                             SizedBox(height: 20.h),
                             Container(
                               height: 200.h,
                               decoration: BoxDecoration(
                                 color: Colors.grey[300],
                                 borderRadius: BorderRadius.circular(10),
                               ),
                               child:  Stack(
                                 children: [
                                   Image.asset(
                                       'assets/map.png',
                                     height: 600,
                                     width: double.infinity,
                                     fit: BoxFit.cover,
                                   ),
                                   Center(
                                     child: Column(
                                       mainAxisAlignment: MainAxisAlignment.center,
                                       children: [
                                         Icon(Icons.location_on,color: Colors.red,size: 40,),
                                         SizedBox(height: 5.h,),
                                         Text('${eventData?.location}',
                                         style: TextStyle(
                                           fontSize: 20.sp,
                                           fontWeight: FontWeight.bold
                                         ),),
                                       ],
                                     ),
                                   ),
                                 ],
                               ),
                             ),
                             SizedBox(height: 20.h),
                             if(food != null)
                             Row(
                               children: [
                                 TextButton(
                                     onPressed: () {
                                        navigateTo(context, FoodServices(id: Id,));
                                     },
                                     child: Text(
                                         'Food services',
                                         style: TextStyle(
                                             color: Colors.white
                                         ),
                                     ),
                                     style: ElevatedButton.styleFrom(
                                       padding: EdgeInsets.symmetric(
                                           horizontal: 30.w, vertical: 15.h),
                                       shape: RoundedRectangleBorder(
                                         borderRadius: BorderRadius.circular(30),
                                       ),
                                       backgroundColor: Color(0xFF6818A5),
                                     )),
                                 const Spacer(),
                                 Switch(
                                   overlayColor: MaterialStateProperty.resolveWith<Color?>(
                                         (Set<MaterialState> states) {
                                       if (states.contains(MaterialState.selected)) {
                                         return Colors.green.withOpacity(0.54);
                                       }
                                       return Colors.grey.shade400;
                                     },
                                   ),
                                   inactiveThumbColor: Colors.grey,
                                   inactiveTrackColor: Colors.grey[200],
                                   value: EventDetailsCubit.get(context).foodService,
                                   onChanged: (value){
                                     EventDetailsCubit.get(context).changeFoodService();
                                   },

                                 ),
                               ],
                             ),
                             SizedBox(height: 10.h),
                             TextButton(
                                 onPressed: () {
                                   navigateTo(context, EventSponsor(id: Id,));
                                 },
                                 child: Text(
                                   'Sponsor',
                                   style: TextStyle(
                                       color: Colors.white
                                   ),
                                 ),
                                 style: ElevatedButton.styleFrom(
                                   padding: EdgeInsets.symmetric(
                                       horizontal: 30.w, vertical: 15.h),
                                   shape: RoundedRectangleBorder(
                                     borderRadius: BorderRadius.circular(30),
                                   ),
                                   backgroundColor: Color(0xFF6818A5),
                                 )),
                             SizedBox(height: 10.h),
                             if(musicalBandData != null)
                             Text(
                               'Musical Band',
                               style: TextStyle(
                                 fontSize: 20.sp,
                                 fontWeight: FontWeight.bold,
                               ),
                             ),
                             SizedBox(height: 10.h),
                             if(musicalBandData != null)
                             SizedBox(
                               height: 120.h,
                               width: double.infinity,
                               child: Expanded(
                                 child: ListView.separated(
                                   scrollDirection: Axis.horizontal,
                                     itemBuilder: (context, index) => Container(
                                       decoration: BoxDecoration(
                                         color: Theme.of(context).cardColor,
                                         borderRadius: BorderRadius.circular(30),

                                       ),
                                       width: 250.h,
                                       height: 100.h,
                                       child: Row(
                                         children: [
                                           ClipRRect(
                                             borderRadius: BorderRadius.circular(20),
                                             child: Image.network(
                                               '$image${musicalBandData[index].photoLink}', // Ensure the path is correct
                                               width: 100.w,
                                               height: double.infinity,
                                               fit: BoxFit.cover,
                                             ),
                                           ),
                                           SizedBox(width: 20.w,),
                                           Column(
                                             crossAxisAlignment: CrossAxisAlignment.start,
                                             children: [
                                               SizedBox(height: 10.h,),
                                               Text(
                                                 "${musicalBandData[index].name }",
                                                 style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold),),
                                               SizedBox(height: 10.h,),
                                               Text("${musicalBandData[index].description }"),
                                             ],
                                           ),

                                         ],
                                       ),

                                     ),
                                     separatorBuilder: (context, index) => SizedBox(width: 10.w,),
                                     itemCount: musicalBandData!.length,
                                 ),
                               ),
                             ),
                             SizedBox(height: 10.h,),
                             Row(
                               children: [
                                 Text(
                                   'Available Ticket:',
                                   style: TextStyle(
                                       fontSize: 15.sp,
                                       fontWeight: FontWeight.bold
                                   ),
                                 ),
                                 const Spacer(),
                                 Text(
                                     '${eventData?.availableTicket}',
                                   style: TextStyle(
                                     color: Colors.green
                                   ),
                                 )
                               ],
                             ),
                             Row(
                               children: [
                                 Text(
                                   'Do you want vip ticket?',
                                   style: TextStyle(
                                       fontSize: 15.sp,
                                       fontWeight: FontWeight.bold
                                   ),
                                 ),
                                 const Spacer(),
                                 Checkbox(
                                     value: EventDetailsCubit.get(context).isVip,
                                     onChanged: (b){
                                       EventDetailsCubit.get(context).changeIsVip(b);
                                     }
                                 ),
                               ],
                             ),
                             SizedBox(height:40.h),
                             Center(
                               child: ConditionalBuilder(
                                 condition: state is! LoadingPostBookingState ,
                                 builder: (context) => ElevatedButton(
                                   onPressed: () {
                                     if(token == null){
                                       AwesomeDialog(
                                         context: context,
                                         showCloseIcon: true,
                                         animType: AnimType.scale,
                                         btnOkColor: Colors.deepPurple,
                                         dialogType: DialogType.noHeader,
                                         padding: EdgeInsets.all(10.r),
                                         desc: 'you need to SignIn',
                                         btnOkOnPress: () {},
                                       ).show();
                                     }else {
                                       EventDetailsCubit.get(context).postBooking(
                                         id: eventData?.id,
                                         vip: EventDetailsCubit.get(context).isVip ? 'vip' : 'normal',
                                         foodService: EventDetailsCubit.get(context).foodService,
                                         food: food?[0].id,
                                       );
                                     }
                                   },
                                   style: ElevatedButton.styleFrom(
                                     padding:const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                                     shape: RoundedRectangleBorder(
                                       borderRadius: BorderRadius.circular(30),
                                     ),
                                     backgroundColor: const Color(0xFF6818A5),
                                   ),
                                   child: Text(
                                     'Buy Ticket ${eventData?.price} Sp',
                                     style: TextStyle(
                                       color: Colors.white,
                                       fontSize: 18.sp,
                                     ),
                                   ),
                                 ),
                                 fallback: (context) => const Center(child: CircularProgressIndicator(),),

                               ),
                             ),
                           ],
                         ),
                       ),
                  
                    ],
                  ),
                );
              },
              fallback: (context) => const Center(child: CircularProgressIndicator(),),
            ),
          );
        },
      ),
    );
  }
}
