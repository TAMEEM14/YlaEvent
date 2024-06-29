import 'package:flutter/material.dart';
import 'package:ylaevent/shared/components/components.dart';

class ChangePasswordScreen extends StatelessWidget {

  var formKey = GlobalKey<FormState>();
  var currentPasswordController = TextEditingController();
  var newPasswordController = TextEditingController();
  var reNewPasswordController = TextEditingController();


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
                    control:currentPasswordController ,
                    labeltext:'Current password' ,
                      validat: (String? value){
                        if(value!.isEmpty){
                          return 'enter current password' ;
                        }
                      },
                    prefix: Icons.lock_outline
                  ),
                  const SizedBox(height: 15,),
                  defaultformfild(
                      control:newPasswordController ,
                      labeltext:'New password' ,
                      validat: (String? value){
                        if(value!.isEmpty){
                          return 'enter new password';
                        }
                      },
                      prefix: Icons.password_outlined
                  ),
                  const SizedBox(height: 15,),
                  defaultformfild(
                      control:reNewPasswordController ,
                      labeltext:'Re-type new password' ,
                      validat: (String? value){
                        if(value!.isEmpty){
                          return 'enter re-type new password' ;
                        }
                      },
                      prefix: Icons.password_outlined
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
