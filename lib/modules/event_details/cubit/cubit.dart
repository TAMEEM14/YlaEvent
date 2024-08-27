import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ylaevent/modules/event_details/Event_data_by_id_model.dart';
import 'package:ylaevent/modules/event_details/cubit/states%20(2).dart';
import 'package:ylaevent/modules/event_details/event_sponsor_model.dart';
import 'package:ylaevent/modules/event_details/food_service/food_services_model.dart';
import 'package:ylaevent/modules/event_details/musical_band_model.dart';
import 'package:ylaevent/profile/create_event/agency_by_id_model.dart';
import 'package:ylaevent/profile/create_event/agency_details_model.dart';
import 'package:ylaevent/remote/dio.dart';


class EventDetailsCubit extends Cubit<EventDetailstates> {
  EventDetailsCubit() : super(EventDetailsInitialState());

  static EventDetailsCubit get(context) => BlocProvider.of(context);
  int ticketquantity = 1 ;
  void increaseNumberOfTicket (){
    ticketquantity++ ;
    emit(ChangeNumberOfTicketState());
    print(ticketquantity);

  }
  void decreaseNumberOfTicket()
  {
    if(ticketquantity > 1)
    ticketquantity--;
    emit(ChangeNumberOfTicketState());
  }

  bool foodService = false;

  void changeFoodService (){
    foodService = !foodService;
    emit(ChangeFoodServicesState());
  }

  bool isVip = false;

  void changeIsVip(index){
    isVip = index;
    emit(IsVipState());
  }


  FoodServicesModel? foodServicesModel;

  void getFoodServices({
    required id,
}){
    emit(FoodServicesLoading());
    DioHelper.getData(
      url: 'guest-mobile-platform/event/$id/food/services',
    ).then((value) {
      foodServicesModel = FoodServicesModel.fromJson(value.data);
      emit(FoodServicesSuccess());
    }).catchError((error){
      emit(FoodServicesError());
    });
  }

  MusicalBandModel? musicalBandModel ;
  Future<void> getMusicalBand({
    required id,
})async
  {
   emit(MusicalBandLoadingState());
  await DioHelper.getData(
    url: 'guest-mobile-platform/event/$id/musical-band/services',
  ).then((value) {
     musicalBandModel =  MusicalBandModel.fromJson(value.data);
     emit(MusicalBandSuccessState());
   }).catchError((error){
     print(error.toString());
     emit(MusicalBandErrorState());
   });
  }


  EventDataByIdModel? eventDataByIdModel;

  Future<void> getEventDataById({
    required id,
})async
  {
    emit(LoadingGetEventDataByIdState());
    await DioHelper.getData(
      url: 'guest-mobile-platform/event/get/$id',
    ).then((value) {
      eventDataByIdModel =  EventDataByIdModel.fromJson(value.data);
      emit(SuccessGetEventDataByIdState());
    }).catchError((error){
      print(error.toString());
      emit(ErrorGetEventDataByIdState());
    });
  }


  Future<void> postBooking({
    required id,
    required vip,
    required bool foodService,
    required  food,
  })async
  {
    emit((LoadingPostBookingState()));
    await DioHelper.postData(
      url: 'end-user/booking/create',
      data: {
        "event_info_id": id,
        "ticket_type": vip,
        "food_services": foodService,
        "foods": food != null ? [food] : [],
      }
    ).then((value) {
      emit(SuccessPostBookingState());
    }).catchError((error){
      print(error.toString());
      emit(ErrorPostBookingState());
    });
  }

  AgencyDetailsModel? agencyDetailsModel;
  Future<void> getAgency()async
  {
    emit(AgencyLoadingState());
    await DioHelper.getData(
        url:'end-user/agency/get',
    ).then((value) {
      agencyDetailsModel =  AgencyDetailsModel.fromJson(value.data);
      emit(AgencySuccessState());
    }).catchError((error){
      print(error.toString());
      emit(AgencyErrorState());
    });
  }

  AgencyByIdModel? agencyByIdModel;
  Future<void> getAgencyById({
    required id ,
  })async
  {
    emit(AgencyByIdLoadingState());
    await DioHelper.getData(url: 'end-user/agency/get/$id').then((value) {
      agencyByIdModel =  AgencyByIdModel.fromJson(value.data);
      emit(AgencyByIdSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(AgencyByIdErrorState());
    });
  }

  Future<void> getAskEvent({
    required id ,
  })async
  {
    emit(AskEventLoadingState());
    await DioHelper.getData(url: 'end-user/agency/$id/ask-private-event').then((value) {
      emit(AskEventSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(AskEventErrorState());
    });
  }



  EventSponsorModel? eventSponsorModel;

  Future<void> getEventSponsor({
     required id,
})async
  {
    emit(EventSponsorLoadingState());
    DioHelper.getData(url: 'guest-mobile-platform/event/$id/sponsor/services').then((value) {
      eventSponsorModel =  EventSponsorModel.fromJson(value.data);
      emit(EventSponsorSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(EventSponsorErrorState());
    });
  }
}