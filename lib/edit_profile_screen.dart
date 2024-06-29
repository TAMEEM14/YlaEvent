import 'package:flutter/material.dart';
import 'package:ylaevent/shared/components/components.dart';

class EditProfileScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:Form(
        key: formKey ,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  defaultformfild(
                      control: nameController,
                      labeltext:'Name' ,
                      validat: (String? value){
                        if(value!.isEmpty){
                          return 'enter your name' ;
                        }
                      },
                      prefix: Icons.person
                  ),
                  const SizedBox(height: 15,),
                  defaultformfild(
                      control: emailController,
                      labeltext:'Email' ,
                      validat: (String? value){
                        if(value!.isEmpty){
                          return 'enter your email';
                        }
                      },
                      prefix: Icons.email_outlined
                  ),
                  SizedBox(height: 15,),
                  defaultformfild(
                   control: cityController,
                   labeltext:'City' ,
                   validat: (String? value){
                   if(value!.isEmpty){
                     return 'enter your city ' ;
                    }
                   },
                  prefix: Icons.location_city_outlined
                   ),
                  const SizedBox(height: 15,),
                  defaultformfild(
                      control: phoneController,
                      labeltext:'Phone number' ,
                      validat: (String? value){
                        if(value!.isEmpty){
                          return 'enter your phone number ' ;
                        }
                      },
                      prefix: Icons.phone_outlined
                  ),
                  const SizedBox(height: 15,),
                  defaultbutton(
                    context: context,
                    function: (){
                      if(formKey.currentState!.validate()){
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.green, width: 1),
                                borderRadius: BorderRadius.circular(24),
                              ),
                              content: Center(
                                child: Text(
                                  'success save change',
                                  style: TextStyle(
                                      fontFamily: 'Somar',
                                      color: Colors.white,
                                      fontSize: 20
                                  ),),
                              ),
                              backgroundColor: Colors.green,
                            ));
                      }
                    },
                    text: 'Save Change',
                    backcground: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ),
          ),
        ),
      ) ,
    );
  }
}
