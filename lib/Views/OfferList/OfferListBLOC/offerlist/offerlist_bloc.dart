import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:gigandjob_mobile_app/Dominio/Models/Offer.dart';
import 'package:meta/meta.dart';

part 'offerlist_event.dart';
part 'offerlist_state.dart';

class OfferlistBloc extends Bloc<OfferlistEvent, OfferlistState> {
  OfferlistBloc() : super(OfferlistState(offer: [])) {
    @override
    Stream<OfferlistState> mapEventToState(
      OfferlistEvent event,
    ) async* {}

    /*on<OfferlistEvent>((event, emit) {
      // TODO: implement event handler
    });*/
  }
}
