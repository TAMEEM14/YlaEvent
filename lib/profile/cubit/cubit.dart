import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ylaevent/home/main/states.dart';
import 'package:ylaevent/profile/create_event/show_transaction_model.dart';
import 'package:ylaevent/profile/credite_card/account_transaction_model.dart';
import 'package:ylaevent/profile/credite_card/credite_card_model.dart';
import 'package:ylaevent/profile/credite_card/get_all_bank_account.dart';
import 'package:ylaevent/profile/cubit/states.dart';
import 'package:ylaevent/profile/profile_data_model.dart';
import 'package:ylaevent/remote/dio.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitialState());

  static ProfileCubit get(context) => BlocProvider.of(context);


  ProfileDataModel? profileDataModel;

  Future<void> getProfileData() async{
    emit(LoadingGetProfileDataState());
   await DioHelper.getData(
        url: 'end-user/profile'
    ).then((value) {
      profileDataModel = ProfileDataModel.fromJson(value.data);
      emit(SuccessGetProfileDataState());
    }).catchError((onError){
      print(onError.toString());
      emit(ErrorGetProfileDataState());
   });
  }

  Future<void> updateProfileData({
    required String name,
    required String city,
}) async{
    emit(LoadingUpdateProfileDataState());
    DioHelper.putData(
        url: 'end-user/update-profile',
        data: {
          "name" : name,
          "city" : city
        }
    ).then((value) {
      emit(SuccessUpdateProfileDataState());
    }).catchError((onError){
      print(onError);
      emit(ErrorUpdateProfileDataState());
    });
  }


  Future<void> signOut() async{
    emit(LoadingSignOutState());
    await DioHelper.getData(
        url: 'end-user/sign-out'
    ).then((value) {
      emit(SuccessSignOutState());
    }).catchError((onError){
      print(onError.toString());
      emit(ErrorSignOutState());
    });
  }



  CrediteCardModel? creditCardModel;

  Future<void> createCreditCard({
    required String accountNumber,
    required String accountPIN
})async{
    emit(LoadingCreateCreditCardState());
   await DioHelper.postData(
        url: 'end-user/bank-account/auth',
        data: {
          'account_number' : accountNumber,
          'account_lock_pin': accountPIN,
        }
    ).then((value){
      creditCardModel = CrediteCardModel.fromJson(value.data);
      emit(SuccessCreateCreditCardState());
    }).catchError((onError){
      print(onError.toString());
      emit(ErrorCreateCreditCardState());
    });
  }


  GetAllBankAccountModel? getAllBankAccountModel;

  Future<void> getAllBankAccount() async{
    emit(LoadingGetAllBankAccountState());
    await DioHelper.getData(
        url: 'end-user/bank-account/get'
    ).then((value) {
      getAllBankAccountModel = GetAllBankAccountModel.fromJson(value.data);
      emit(SuccessGetAllBankAccountState());
    }).catchError((onError){
      print(onError.toString());
      emit(ErrorGetAllBankAccountState());
    });
  }

  AccountTransactionModel? accountTransactionModel;

  Future<void> postAccountTransaction({
    required cardNumber,
    required PIN,
})async{
    emit(LoadingAccountTransactionState());
    await DioHelper.postData(
        url: 'end-user/bank-account/account-transaction',
        data: {
          "account_number": cardNumber ,
          "account_lock_pin": PIN
        },
    ).then((value){
      accountTransactionModel = AccountTransactionModel.fromJson(value.data);
      emit(SuccessAccountTransactionState());
    }).catchError((onError){
      print(onError);
      emit(ErrorAccountTransactionState());
    });
  }


  Future<void> postMakeTransaction({
    required cardNumber,
    required lockPIN,
    required transactionPIN,
    required amount,
    required receiverAccount,
    required ticketId,
  })async{
    emit(LoadingMakeTransactionState());
    await DioHelper.postData(
      url: 'end-user/bank-account/make-transaction',
      data: {
        "account_number": cardNumber,
        "account_transaction_pin": transactionPIN,
        "account_lock_pin": lockPIN,
        "amount": amount,
        "receiver_account": receiverAccount,
        "ticket_id":ticketId
      }
    ).then((value){
      emit(SuccessMakeTransactionState());
    }).catchError((onError){
      print(onError);
      emit(ErrorMakeTransactionState());
    });
  }

  ShowTransactoinModel? showTransactoinModel;

  Future<void> postShowTransaction({
    required cardNumber,
    required lockPIN,
  })async{
    emit(LoadingShowTransactionState());
    await DioHelper.postData(
        url: 'end-user/bank-account/account-transaction',
        data: {
          "account_number": cardNumber,
          "account_lock_pin": lockPIN,
        }
    ).then((value){
      showTransactoinModel = ShowTransactoinModel.fromJson(value.data);
      emit(SuccessShowTransactionState());
    }).catchError((onError){
      print(onError);
      emit(ErrorShowTransactionState());
    });
  }


  Future<void> cancelTicket({required id}) async{
    emit(LoadingCancelTicketState());
    await DioHelper.getData(
        url: 'end-user/booking/$id/cancel'
    ).then((value) {
      emit(SuccessCancelTicketState());
    }).catchError((onError){
      print(onError.toString());
      emit(ErrorCancelTicketState());
    });
  }


}