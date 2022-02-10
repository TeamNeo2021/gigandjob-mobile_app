import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:gigandjob_mobile_app/Views/OfferList/OfferListPage.dart';

part 'bottomnavbar_event.dart';
part 'bottomnavbar_state.dart';

class BottomNavBarBloc extends Bloc<BottomNavBarEvent, BottomNavBarState> {
  BottomNavBarBloc() : super(BottomnavbarInitial(0, OfferListPage())) {
    on<TabChangedEvent>(onTabChangedEvent);
  }

  Future onTabChangedEvent(
      TabChangedEvent event, Emitter<BottomNavBarState> emit) async {
    try {
      emit(BottomnavbarInitial(event.index, event.page));
    } catch (e) {
      print('OnTabChangeEventError: $e');
    }
  }
}
