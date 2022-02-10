import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:gigandjob_mobile_app/Dominio/Models/Offer.dart';
import 'package:meta/meta.dart';
import 'package:gigandjob_mobile_app/Dominio/Services/OfferService.dart';
part 'offerlist_event.dart';
part 'offerlist_state.dart';

class OfferlistBloc extends Bloc<OfferlistEvent, OfferlistState> {
  Future<void> _onGetAll(GetAll event, Emitter<OfferlistState> emit) async {
    List<OfferDTO> ofertas = [];
    OfferService service = new OfferService();
    try {
      ofertas = await service.FetchOfertas();
      emit(OfferlistState(offer: ofertas
          /*new OfferDTO('1', 'Prueba 1'),
        new OfferDTO('2', 'Prueba 2'),
        new OfferDTO('3', 'Prueba 3')*/
          ));
    } on Exception catch (e) {
      print(e);
    }
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
