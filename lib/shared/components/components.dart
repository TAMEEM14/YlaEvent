import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ylaevent/shared/components/colors.dart';

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
      padding: const EdgeInsets.only(
        top: 70.0,
        left: 20.0,
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
  required TextEditingController control ,
  ontap ,
  onchange,
  TextInputType? type,
  required String? Function(String?)? validat,
  required String labeltext,
  IconData? prefix ,
  IconData? Suffix,
  bool scuretext = false,
  buttonpressed,
}) => TextFormField(
  controller: control,
  onChanged:onchange,
  onTap: ontap,
  validator:validat,
  keyboardType: type,
  decoration: InputDecoration(
    labelText: labeltext,
    prefixIcon:Icon(prefix) ,
    border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
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
    height: height,
    width:width ,
    decoration: BoxDecoration(
      color: backcground,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Theme.of(context).shadowColor,
          spreadRadius: 4,
          blurRadius: 7,
          offset: Offset(1, 4), // changes position of shadow
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
                Icon(icon ,color: Colors.white,size: 23),

                SizedBox(width: 6,),
                Text(isbage ? text.toUpperCase() : text,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize:20,
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
        color: Color(0xFF6818A5),
        width: 2.0,
      ),
      borderRadius: BorderRadius.all(Radius.circular(30)),

    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color:  Color(0xFF6818A5),
        width: 2.0,
      ),
      borderRadius: BorderRadius.all(Radius.circular(30)),
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
      iconSize: 20.0,
      icon: Icon(
        suffixIcon,
        //size: 20.sp,
        color:Color(0xFF310055),
      ),
      onPressed: suffixpresed,
    ):null,
    prefixIcon: Icon(
      brefixIcon,
      size: 20.sp,
      color:Color(0xFF310055),
    ),

  ),
  validator: validate,
);
