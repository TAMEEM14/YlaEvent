import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:ylaevent/home/main/main_cubit.dart';
import 'package:ylaevent/home/main/main_screen.dart';
import 'package:ylaevent/profile/cubit/cubit.dart';
import 'package:ylaevent/profile/cubit/states.dart';
import 'package:ylaevent/shared/components/colors.dart';
import 'package:ylaevent/shared/components/components.dart';

class CardsScreen extends StatelessWidget {
   CardsScreen({super.key, this.amount, this.ticketID, this.receiverAccount});

   final amount;
   final ticketID;
   final receiverAccount;

   bool isLightTheme = false;
   String expiryDate = '12/12';
   String cardHolderName = '';
   String cvvCode = '123';
   bool isCvvFocused = false;
   bool useGlassMorphism = false;
   bool useBackgroundImage = false;
   bool useFloatingAnimation = true;
   var pinController = TextEditingController();
   var lockPinController = TextEditingController();
   var formKey = GlobalKey<FormState>();
   var card_number;
   String? number;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..getAllBankAccount(),
      child: BlocConsumer<ProfileCubit , ProfileStates>(
        listener: (context, state) {
          if(state is SuccessMakeTransactionState){
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.green, width: 1),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  content:  Center(
                    child: Text(
                      'Register Payment Success',
                      style:  TextStyle(
                        color: Colors.white,
                        fontSize: 15.sp,
                      ),),
                  ),
                  backgroundColor: Colors.green,
                ));
          }else if(state is ErrorMakeTransactionState){
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.red, width: 1),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  content:  Center(
                    child: Text(
                      'Something wrong, try again',
                      style:  TextStyle(
                        color: Colors.white,
                        fontSize: 15.sp,
                      ),),
                  ),
                  backgroundColor: Colors.red,
                ));
          }
          if(state is SuccessCancelTicketState){
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.green, width: 1),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  content:  Center(
                    child: Text(
                      'Success',
                      style:  TextStyle(
                        color: Colors.white,
                        fontSize: 15.sp,
                      ),),
                  ),
                  backgroundColor: Colors.green,
                ));
            MainCubit.get(context).currentIndex = 0;
            navigateAndFinish(context, MainScreen());
          }
        },
        builder: (context, state) {
          var model = ProfileCubit.get(context).getAllBankAccountModel?.data;
          return  Scaffold(
            appBar: AppBar(),
            body: SingleChildScrollView(
              child: ConditionalBuilder(
                condition: state is! LoadingGetAllBankAccountState && model != null,
                builder: (context) => Form(
                  key: formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 230,
                        child: Column(
                          children: [
                            Expanded(
                              child: Swiper(
                                itemWidth: 600,
                                itemHeight: 270,
                                loop: true,
                                duration: 500,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) {
                                   number = model[index].accountNumber.toString();
                                  return CreditCardWidget(
                                    cardNumber: '${model[index].accountNumber}',
                                    expiryDate: expiryDate,
                                    cardHolderName: '${model[index].accountHolderName}',
                                    cvvCode: cvvCode,
                                    bankName: 'Al Baraka',
                                    frontCardBorder: useGlassMorphism
                                        ? null
                                        : Border.all(color: Colors.grey),
                                    backCardBorder: useGlassMorphism
                                        ? null
                                        : Border.all(color: Colors.grey),
                                    showBackView: isCvvFocused,
                                    obscureCardNumber: true,
                                    obscureCardCvv: true,
                                    isHolderNameVisible: true,
                                    cardBgColor: AppColors.cardBgColor,
                                    backgroundImage: 'assets/card_bg.png' ,
                                    isSwipeGestureEnabled: false,
                                    onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
                                    customCardTypeIcons: <CustomCardTypeIcon>[
                                      CustomCardTypeIcon(
                                        cardType: CardType.mastercard,
                                        cardImage: Image.asset(
                                          'assets/mastercard.png',
                                          height: 48,
                                          width: 48,
                                        ),
                                      ),
                                    ],
                                  );
                                },
                                itemCount: model!.length,
                                layout: SwiperLayout.STACK,
                              ),
                            ),
                          ],
                        ),
                      ),
                         Padding(
                           padding: EdgeInsets.all(15.0.r),
                           child: Column(
                             children: [
                               defaultformfild(
                                   labeltext: 'Transaction PIN',
                                   control: pinController,
                                   prefix: Icons.pin,
                                   type: const TextInputType.numberWithOptions(),
                                   validat: (string){
                                     if(string!.isEmpty){
                                       return 'Enter your pin';
                                     }
                                   }
                               ),
              
                               SizedBox(height: 15.h,) ,
                               defaultformfild(
                                   labeltext: 'Lock PIN',
                                   control: lockPinController,
                                   type: const TextInputType.numberWithOptions(),
                                   prefix: Icons.pin,
                                   validat: (string){
                                     if(string!.isEmpty){
                                       return 'Enter your pin';
                                     }
                                   }
                               ),
                               SizedBox(height: 15.h,) ,
                               ConditionalBuilder(
                                 condition: state is! LoadingMakeTransactionState,
                                 builder: (context) => defaultbutton(
                                     context: context,
                                     function: (){
                                       if (formKey.currentState!.validate()) {
                                         // ProfileCubit.get(context).postAccountTransaction(cardNumber: card_number, PIN: pinController.text);
                                         ProfileCubit.get(context).postMakeTransaction(
                                             cardNumber: number,
                                             lockPIN: lockPinController.text,
                                             transactionPIN: pinController.text,
                                             amount: amount,
                                             receiverAccount: receiverAccount,
                                             ticketId: ticketID
                                         );
                                       }
                                     },
                                     isbage: false,
                                     text: 'Register Payment'  ,
                                     backcground: Colors.deepPurple
                                 ),
                                 fallback: (context) => const Center(child: CircularProgressIndicator(),),
                               ),
                               SizedBox(height: 15.h,) ,
                               ConditionalBuilder(
                                 condition: state is! LoadingCancelTicketState,
                                 builder: (context) => defaultbutton(
                                     context: context,
                                     function: (){
                                       ProfileCubit.get(context).cancelTicket(id: ticketID);
                                     },
                                     isbage: false,
                                     text: 'Cancel Ticket'  ,
                                     backcground: Colors.red
                                 ),
                                 fallback: (context) => const Center(child: CircularProgressIndicator(),),
                               ),
                             ],
                           ),
                         ) ,
                    ],
                  ),
                ),
                fallback: (context) => const Center(child: CircularProgressIndicator(),),
              ),
            ),
          );
        },
      ),
    );
  }

}


