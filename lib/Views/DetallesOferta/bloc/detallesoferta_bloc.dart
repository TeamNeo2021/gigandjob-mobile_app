import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gigandjob_mobile_app/Dominio/Models/detalles_oferta_model.dart';
import 'package:gigandjob_mobile_app/Dominio/Services/OfferService.dart';
import '../../../Dominio/Models/detalles_oferta_model.dart';

part 'detallesoferta_event.dart';
part 'detallesoferta_state.dart';

class DetallesofertaBloc
    extends Bloc<DetallesofertaEvent, DetallesofertaState> {
  DetallesofertaBloc() : super(DetallesofertaInitial()) {
    on<GetOferta>(_OnGetOferta);
    on<Aplicar>(_OnAplicar);
  }

  Future<void> _OnGetOferta(
      GetOferta event, Emitter<DetallesofertaState> emit) async {
    final detallesOferta = await _FetchDetallesOferta(event.OfertaId);
    emit(OfertaCargada(detallesOferta));
  }

  Future<void> _OnAplicar(
      Aplicar event, Emitter<DetallesofertaState> emit) async {
    OfferService service = new OfferService();
    await service.EnviarAplicacion(event);
  }

  Future<DetallesOferta> _FetchDetallesOferta(String OfertaId) {
    DateTime now = new DateTime.now();
    DateTime date = new DateTime(now.year, now.month, now.day);
    return Future.delayed(Duration(seconds: 1), () {
      return DetallesOferta(
        OfertaId,
        'Hola vengo del bloc',
        date,
        66,
        'En un lugar',
        'Informática',
        50,
          'Descripcion laruisima',
        );
      });
  }  
}  
      