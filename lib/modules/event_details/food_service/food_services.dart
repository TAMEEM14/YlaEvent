import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ylaevent/modules/event_details/cubit/cubit.dart';
import 'package:ylaevent/modules/event_details/cubit/states%20(2).dart';
import 'package:ylaevent/modules/event_details/food_service/food_services_details_screen.dart';
import 'package:ylaevent/shared/components/components.dart';
import 'package:ylaevent/shared/components/constans.dart';

class FoodServices extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var searchcontroller = TextEditingController();
  final id;

   FoodServices({super.key, this.id});

  @override
  Widget build(BuildContext context) {
    var model;
    return BlocProvider(
        create: (context) => EventDetailsCubit()..getFoodServices(id: id),
        child: BlocConsumer<EventDetailsCubit, EventDetailstates>(
            listener: (context, state) {}, builder: (context, state) {
          model = EventDetailsCubit.get(context).foodServicesModel;
          return Scaffold(
            body: Column(
              children: [
              Expanded(
              flex: 5,
              child: ConditionalBuilder(
                condition: state is ! FoodServicesLoading && model != null,
                builder: (context) =>
                    GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 0,
                      childAspectRatio: 1 / 1.4,
                      children: List.generate(
                        model?.data?.length ?? 0,
                            (index) =>
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: foodItem(model?.data![index], context),
                            ),
                      ),
                    ),
                fallback: (context) => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),)
              ],
            ),
          );
        }));
  }

  Widget foodItem(data, context) {
    return GestureDetector(
      onTap: () {
        navigateTo(context, FoodServicesDetailsScreen(data: data,));
      },
      child: Container(
        height: 210.h,
        width: 170.w,
        decoration:  const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 0.5,
              blurRadius: 0.5,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 8.0, right: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    child: Image.network(
                      '$image${data.photoLink}',
                      height: 130.h,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Image.asset(
                        'assets/img_1.png',
                        height: 130.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )),
              SizedBox(
                height: 10.h,
              ),
              Center(

                child: Text(
                  '${data.name}',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget foodServicesDetails(data, context) {
    return GestureDetector(
      child: Container(
          color: Colors.white,
          height: 60.h,
          child: Row(
            children: [
              Image.asset(
                'assets/images/jkfslhj.jpg', // Ensure the path is correct
                width: 50.w,
                height: 50.h,
                fit: BoxFit.cover,
              ),
              SizedBox(width: 15),
              Column(
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

            ],
          ), // Set a fixed height for each item
        ),
    );
  }
}
