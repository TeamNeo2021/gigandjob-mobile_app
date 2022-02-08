import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:gigandjob_mobile_app/Dominio/Models/Offer.dart';
import 'package:meta/meta.dart';

part 'offerlist_event.dart';
part 'offerlist_state.dart';

class OfferlistBloc extends Bloc<OfferlistEvent, OfferlistState> {
  void _onGetAll(GetAll event, Emitter<OfferlistState> emit) {
    emit(OfferlistState(
          offer: 
          [new OfferDTO(offerName: 'Hola Luis'), 
          new OfferDTO(offerName:'Soy Crack'), 
          new OfferDTO(offerName:'Digalo')
          ]
        )
    );
  }
  OfferlistBloc() : super(OfferlistState(offer: [])) {
    /* @override
    Stream<OfferlistState> mapEventToState(
      OfferlistEvent event,
    ) async* {
      if (event is GetAll) {
        yield OfferlistState(
            offer: [new OfferDTO(offerName: 'Hola Luis'), new OfferDTO(offerName:'Soy Crack'), new OfferDTO(offerName:'Digalo')]);
      }
    }*/
    on<GetAll>(_onGetAll);
  }
}
