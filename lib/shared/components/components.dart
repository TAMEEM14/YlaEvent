import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ylaevent/profile/credite_card/cards_screen.dart';
import 'package:ylaevent/shared/components/colors.dart';
import 'package:ylaevent/shared/components/constans.dart';

void navigateAndFinish (
    context,
    widget,
    ) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
        builder:(context) => widget
    ),
        (route) => false
);


void navigateTo (
    context,
    widget,
    ) => Navigator.push(
  context,
  MaterialPageRoute(
      builder:(context) => widget
  ),
);


Widget basicContainer ({
  String text='',
})=>  Container(
    height: double.infinity,
    width: double.infinity,
    decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              Color(0xFF310055),
              Color(0xFF6818A5),
            ]
        )
    ),
    child:
    Padding(
      padding:  EdgeInsets.only(
        top: 70.0.r,
        left: 20.0.r,
      ),
      child: Text(text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30.0.sp,
          )),

    ),
);



Widget basicBottom({
  required String text,
  required Function()? function,
})=> Container(
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
    onPressed: function,
    child: Center(child: Text( text,
      style: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),)),
  ),
);





Widget defaultformfild ({
   TextEditingController? control ,
  ontap ,
  onchange,
  TextInputType? type,
  required String? Function(String?)? validat,
  required String labeltext,
  IconData? prefix ,
  IconData? Suffix,
  bool scuretext = false,
  String? initialValue,
  bool readOnly = false,
  buttonpressed,
}) => TextFormField(
  controller: control,
  initialValue: initialValue,
  readOnly: readOnly,
  onChanged:onchange,
  onTap: ontap,
  validator:validat,
  keyboardType: type,
  decoration: InputDecoration(
    labelText: labeltext,
    prefixIcon:Icon(prefix) ,
    border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.r)),
    ),
    suffixIcon: Suffix != null ? IconButton(icon: Icon(Suffix),onPressed: buttonpressed,) : null,
  ),
  obscureText:scuretext ,
);




Widget defaultbutton (
    {
      Color? backcground ,
      double width = double.infinity ,
      double height = 40 ,
      bool isbage = true,
      IconData? icon ,
      required context,
      required Function()? function,
      required String text,
    }) {
  return Container(
    height: height.h,
    width:width.w ,
    decoration: BoxDecoration(
      color: backcground,
      borderRadius: BorderRadius.circular(10.r),
      boxShadow: [
        BoxShadow(
          color: Theme.of(context).shadowColor,
          spreadRadius: 0.5,
          blurRadius: 0.5,
          offset:const Offset(0, 1), // changes position of shadow
        ),
      ],
    ),
    child: MaterialButton(
      onPressed: function,
      child: Row(
        children: [
          Expanded(

            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                if(icon != null)
                Icon(icon ,color: Colors.white,size: 23.r),

                SizedBox(width: 6.w,),
                Text(isbage ? text.toUpperCase() : text,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize:20.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}




Widget defaultFormField({
  required TextEditingController controller,
  required FormFieldValidator<String>? validate,
  ValueChanged <dynamic>? onChanged,
  required String text,
  IconData? suffixIcon,
  required  IconData brefixIcon,
  TextInputType? textInputType,
  ValueChanged<String>? onSubmit,
  Function()? suffixpresed,
  Function()? onTap,
  bool isPassword = false,
  bool readOnly = false,
})=>TextFormField(
  readOnly: readOnly,
  onTap: onTap ,
  obscureText: !isPassword,
  onChanged: onChanged,
  onFieldSubmitted: onSubmit,
  controller: controller,
  keyboardType: textInputType,
  decoration: InputDecoration(
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color:const Color(0xFF6818A5),
        width: 2.0.w,
      ),
      borderRadius: BorderRadius.all(Radius.circular(30.r)),

    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color:const Color(0xFF6818A5),
        width: 2.0.w,
      ),
      borderRadius: BorderRadius.all(Radius.circular(30.r)),
    ),
    fillColor: Colors.white,
    filled: true,
    label: Text(text,
      style: TextStyle(
        color: Color(0xFF310055),
        fontWeight: FontWeight.bold,
        fontSize: 20.sp,
      ),),
    suffixIcon: suffixIcon != null ? IconButton(
      iconSize: 20.0.r,
      icon: Icon(
        suffixIcon,
        //size: 20.sp,
        color:const Color(0xFF310055),
      ),
      onPressed: suffixpresed,
    ):null,
    prefixIcon: Icon(
      brefixIcon,
      size: 20.sp,
      color: const Color(0xFF310055),
    ),

  ),
  validator: validate,
);


class TicketCard extends StatelessWidget {

  final  model ;
  double? height =130.h;
  TicketCard({super.key, required this.model , this.height});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 15.r, vertical: 10.r),
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => GestureDetector(
        onTap: (){
          if(model[index].status == 'Pending'){
            navigateTo(context, CardsScreen(
              amount:model[index].totalPrice ,
              receiverAccount: model[index].receiveAccount,
              ticketID:model[index].id ,));
          }
        },
        child: SizedBox(
          height: height,
          width: double.infinity,
          child: Stack(
              children: [
                ClipPath(
                  clipper: ticketCardDesign(radius: 10 , rightCircle: 2,leftCircle: 2),
                  child: Container(
                    height: 165.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(ScreenUtil().radius(20)),
                      color: Theme.of(context).cardColor,
                      
                    ),
                    child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                padding:  EdgeInsetsDirectional.only(start: 20.r,top: 20.r),
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${model[index].eventName.substring(0,10)}',
                                      style:TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: largeSize,
                                          color: ColorPicker.sColor
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                              const Spacer(),
                              Container(
                                padding:  EdgeInsetsDirectional.only(end: 20.r , top: 20.r),
                                alignment: Alignment.centerRight,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${model[index].totalPrice} Sp',
                                      style:TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: largeSize,
                                          color: ColorPicker.sColor
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 35.h,),
                          CustomPaint(
                            painter: DottedLine(radius: ScreenUtil().radius(10)),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                            ),),
                          SizedBox(height: 10.h,),
                          Row(
                            children: [
                              Container(
                                padding:  EdgeInsetsDirectional.only(start: 20.r),
                                alignment: Alignment.centerLeft,
                                child:Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Status'.tr(),
                                      style: TextStyle(
                                          fontSize: titleSize,
                                          color: Colors.grey
                                      ),
                                    ),
                                    SizedBox(height: 3.h,),
                                    Text(
                                      '${model[index].status}',
                                      style:TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: largeSize,
                                          color: ColorPicker.sColor
                                      ),
                                    ),
                                    Text(
                                      '',
                                      style: TextStyle(
                                          fontSize: titleSize,
                                          color: Colors.grey
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const Spacer(),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: 18.h,),
                                  Text('${model[index].bookedAt}',style: TextStyle(color: Colors.grey , fontSize: titleSize),)
                                ],
                              ),
                              const Spacer(),
                              Container(
                                padding:  EdgeInsetsDirectional.only(end: 20.r),
                                alignment: Alignment.centerRight,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Type'.tr(),
                                      style: TextStyle(
                                          fontSize: titleSize,
                                          color: Colors.grey
                                      ),
                                    ),
                                    SizedBox(height: 3.h,),
                                    Text(
                                      '${model[index].type}',
                                      style:TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: largeSize,
                                          color: ColorPicker.sColor
                                      ),
                                    ),
                                    SizedBox(height: 19.h,)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ]),
                  ),
                ),

              ]),

        ),
      ),
      separatorBuilder: (context, index) =>  SizedBox(
        height: 10.h,
      ),
      itemCount: model.length,
    );
  }}

Widget ticketHistoryCard({
  required model,
  double height = 170,
}) => ListView.separated(
  padding:  EdgeInsetsDirectional.symmetric(horizontal: 15.r, vertical: 10.r),
  physics: const BouncingScrollPhysics(),
  itemBuilder: (context, index) => GestureDetector(
    onTap: ()async{

    },
    child: SizedBox(
      height: height.h,
      width: double.infinity,
      child: Stack(
          children: [
            ClipPath(
              clipper: ticketCardDesign(radius: 10 , rightCircle: 2,leftCircle: 2),
              child: Container(
                height: 200.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: ColorPicker.backgroundColor,
                ),
                child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsetsDirectional.only(start: 20.r,top: 20.r),
                            alignment: Alignment.centerLeft,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${model[index].companyName}',
                                  style:TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: largeSize,
                                      color: ColorPicker.sColor
                                  ),
                                ),
                                Text(
                                  model[index].isVip ? 'VIP' : 'normal'.tr(),
                                  style: TextStyle(
                                      fontSize: titleSize,
                                      color: Colors.green
                                  ),
                                )
                              ],
                            ),
                          ),
                          const Spacer(),
                          Container(
                            padding:  EdgeInsetsDirectional.only(end: 20.r , top: 20.r),
                            alignment: Alignment.centerRight,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${model[index].totalPrice} ${'Sp'.tr()}',
                                  style:TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: largeSize,
                                      color: ColorPicker.sColor
                                  ),
                                ),
                                Text(
                                  '${model[index].seatCont} ${'Seats'.tr()}',
                                  style: TextStyle(
                                      fontSize: titleSize,
                                      color: Colors.green
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 19.h,),
                      CustomPaint(
                        painter: DottedLine(radius: 10.r),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                        ),),
                      SizedBox(height: 10.h,),
                      Row(
                        children: [
                          Container(
                            padding:  EdgeInsetsDirectional.only(start: 20.r),
                            alignment: Alignment.centerLeft,
                            child:Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Departure station',
                                  style: TextStyle(
                                      fontSize: 10.sp,
                                      color: Colors.grey
                                  ),
                                ).tr(),
                                SizedBox(height: 3.r,),
                                Text(
                                  langu == 'en' ? '${model[index].tripDepartureStation}' : '${model[index].tripDepartureStationAr}',
                                  style:TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.sp,
                                      color: ColorPicker.sColor
                                  ),
                                ),
                                Text(
                                  '',
                                  style: TextStyle(
                                      fontSize: titleSize,
                                      color: Colors.grey
                                  ),
                                )
                              ],
                            ),
                          ),
                          const Spacer(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 18.h,),
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.circle_rounded,
                                        size: 10,
                                        color: ColorPicker.sColor,
                                      ),
                                      Container(
                                        width: 100,
                                        height: 1,
                                        color: Colors.grey,
                                      ),
                                      Icon(
                                        Icons.circle_rounded,
                                        size: 10,
                                        color: ColorPicker.sColor,
                                      ),
                                    ],
                                  ),
                                  const Icon(Icons.directions_bus),

                                ],
                              ),
                              Text('${model[index].bookingDate}',style: TextStyle(color: Colors.grey , fontSize: titleSize),)
                            ],
                          ),
                          const Spacer(),
                          Container(
                            padding:  EdgeInsetsDirectional.only(end: 20.r),
                            alignment: Alignment.centerRight,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'Arrival station',
                                  style: TextStyle(
                                      fontSize: 10.sp,
                                      color: Colors.grey
                                  ),
                                ).tr(),
                                SizedBox(height: 3.h,),
                                Text(
                                  langu == 'en' ? '${model[index].tripArrivalStation}' : '${model[index].tripArrivalStationAr}',
                                  style:TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.sp,
                                      color: ColorPicker.sColor
                                  ),
                                ),
                                SizedBox(height: 19.h,)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ]),
              ),
            ),

          ]),

    ),
  ),
  separatorBuilder: (context, index) =>  SizedBox(
    height: 10.h,
  ),
  itemCount: model.length,
);






class ticketCardDesign extends CustomClipper<Path> {
  double radius;
  double leftCircle;
  double rightCircle;
  ticketCardDesign({required this.radius , required this.leftCircle , required this.rightCircle});
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);

    path.addOval(
        Rect.fromCircle(
            center: Offset(0.0, size.height / rightCircle.r), radius: radius.r));
    path.addOval(Rect.fromCircle(
        center: Offset(size.width, size.height / leftCircle.r), radius: radius.r));
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}



class DottedLine extends CustomPainter {
  double radius;
  DottedLine({required this.radius});
  @override
  void paint(Canvas canvas, Size size) {
    double dashWidth = 3;
    double dashSpace = 4;
    double startX = radius;

    final paint = Paint()
      ..color = ColorPicker.sColor
      ..strokeWidth = 1.w;
    while (startX < size.width - radius) {
      canvas.drawLine(Offset(startX, size.height / 1.5),
          Offset(startX + dashWidth.w, size.height / 1.5), paint);
      startX += dashWidth.w + dashSpace.r;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}