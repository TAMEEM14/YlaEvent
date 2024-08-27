import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ylaevent/home/main/main_cubit.dart';
import 'package:ylaevent/home/main/states.dart';
import 'package:ylaevent/shared/components/components.dart';
import 'package:ylaevent/shared/components/constans.dart';

class PocketScreen extends StatelessWidget {
  const PocketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCubit()..getAllTicket(),
      child: BlocConsumer<MainCubit , AppStates>(
        listener:(context, state) {
          if(state is ErrorGetAllTicketState){
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
            }
          }
        },
        builder: (context, state) {
          var model = MainCubit.get(context).getAllTicketModel?.data;
          return Scaffold(
            body: ConditionalBuilder(
              condition: state is! LoadingGetAllTicketState && model != null,
              builder: (context) => Column(
                children: [
                  Expanded(child: TicketCard(model: model))
                ],
              ),
              fallback: (context) => const Center(child: CircularProgressIndicator(),),
            ),
          );
        },
      ),
    );
  }
}
