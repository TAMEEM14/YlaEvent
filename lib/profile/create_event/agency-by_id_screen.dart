import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ylaevent/modules/event_details/cubit/cubit.dart';
import 'package:ylaevent/modules/event_details/cubit/states%20(2).dart';
import 'package:ylaevent/profile/create_event/agency_details_screen.dart';
import 'package:ylaevent/shared/components/components.dart';

class EgencyById extends StatelessWidget {
  final id;
  const EgencyById({super.key, this.id});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    var model;
    return BlocProvider(
      create: (context) => EventDetailsCubit()..getAgencyById(id: id.toString()),
      child: BlocConsumer<EventDetailsCubit, EventDetailstates>(
        listener: (context, state) {
          if(state is AskEventSuccessState){
            AwesomeDialog(
              context: context,
              showCloseIcon: true,
              animType: AnimType.scale,
              btnOkColor: Colors.deepPurple,
              dialogType: DialogType.noHeader,
              padding: EdgeInsets.all(10.r),
              title: 'Ask for event',
              desc: 'We have sent an email to the company and they will contact you.',
              btnOkOnPress: () {},
            ).show();
          }
        },
        builder: (context, state) {
          model = EventDetailsCubit.get(context).agencyByIdModel?.data;
          return Scaffold(
            body: ConditionalBuilder(
              condition: state is! AgencyByIdLoadingState && model != null,
              builder: (context) => Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 220.h,
                        width: double.infinity,
                        child: Image.network(
                          '${model.logo}',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => Image.asset('assets/img_1.png',fit: BoxFit.cover,),
                        ),
                      ),
                      Positioned(
                        bottom: 0.h,
                        left: 20.w,
                        right: 20.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${model.companyName}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 0.h,
                        child: IconButton(
                          onPressed: () {
                            navigateTo(context, AgencyDetailsScreen());
                          },
                          icon: Icon(Icons.arrow_back),
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Expanded( // Use Expanded here to allow the scroll view to fill available space
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildReadOnlyTextFormField(
                              context: context,
                              initialValue: '${model.location}',
                              icon: Icons.location_on,
                            ),
                            SizedBox(height: 10.h),
                            buildReadOnlyTextFormField(
                              context: context,
                              initialValue: '${model.contactEmail}',
                              icon: Icons.email,
                            ),
                            SizedBox(height: 10.h),
                            buildReadOnlyTextFormField(
                              context: context,
                              initialValue: '${model.contactNumber}',
                              icon: Icons.phone_android,
                            ),
                            SizedBox(height: 10.h),
                            buildReadOnlyTextFormField(
                              context: context,
                              initialValue: '${model.landLine}',
                              icon: Icons.phone,
                            ),
                            SizedBox(height: 10.h),
                            buildReadOnlyTextFormField(
                              context: context,
                              initialValue: '${model.typeOfBusiness}',
                              icon: Icons.list,
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              'Analysis',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.sp,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            buildReadOnlyTextFormField(
                              context: context,
                              initialValue: 'Events : ${model.numberOfEvent}',
                              icon: Icons.circle,
                            ),
                            SizedBox(height: 10.h),
                            buildReadOnlyTextFormField(
                              context: context,
                              initialValue: 'Services : ${model.numberOfServices}',
                              icon: Icons.circle,
                            ),
                            SizedBox(height: 10.h),
                            buildReadOnlyTextFormField(
                              context: context,
                              initialValue: 'Sponsor : ${model.numberOfSponsor}',
                              icon: Icons.circle,
                            ),
                            SizedBox(height: 10.h),
                            buildReadOnlyTextFormField(
                              context: context,
                              initialValue: 'Member : ${model.numberOfMember}',
                              icon: Icons.circle,
                            ),
                            SizedBox(height: 10.h),
                            buildReadOnlyTextFormField(
                              context: context,
                              initialValue: 'MusicalBand : ${model.numberOfMusicalBand}',
                              icon: Icons.circle,
                            ),
                           SizedBox(height: 20.h,),
                          Align(
                            alignment: AlignmentDirectional.center,
                            child: Container(
                            height: 50.h,
                            width: 300.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                gradient: LinearGradient(
                                    colors: [
                                      Color(0xFF310055),
                                      Color(0xFF6818A5),
                                    ]
                                )
                            ),
                            child: TextButton(
                              onPressed: (){
                                EventDetailsCubit.get(context).getAskEvent(id: id);
                              },
                              child: Center(child: Text( 'Ask for privte event',
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),)),
                            ),
                                                    ),
                          ),
                           ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              fallback: (context) => const Center(child: CircularProgressIndicator()),
            ),
          );
        },
      ),
    );
  }

  // Utility function to build read-only TextFormFields
  Widget buildReadOnlyTextFormField({
    required BuildContext context,
    required String initialValue,
    required IconData icon,
  }) {
    return TextFormField(
      readOnly: true,
      initialValue: initialValue,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF6818A5),
            width: 2.0,
          ),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF6818A5),
            width: 2.0,
          ),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        prefixIcon: Icon(icon),
      ),
    );
  }
}
