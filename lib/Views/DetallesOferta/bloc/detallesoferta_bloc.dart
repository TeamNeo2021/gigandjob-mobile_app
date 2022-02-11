import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gigandjob_mobile_app/Dominio/Models/detalles_oferta_model.dart';
import 'package:gigandjob_mobile_app/Dominio/Services/OfferService.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Dominio/Models/detalles_oferta_model.dart';

part 'detallesoferta_event.dart';
part 'detallesoferta_state.dart';

class DetallesofertaBloc
    extends Bloc<DetallesofertaEvent, DetallesofertaState> {
  DetallesofertaBloc() : super(DetallesofertaInitial()) {
    on<GetOferta>(_OnGetOferta);
    on<Aplicar>(_OnAplicar);
    on<Denunciar>(_OnDenunciar);
  }

  Future<void> _OnGetOferta(
      GetOferta event, Emitter<DetallesofertaState> emit) async {
    OfferService service = new OfferService();
    try {
      final detallesOferta = await service.FetchDetallesOferta(event.OfertaId);
      emit(OfertaCargada(detallesOferta));
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<void> _OnAplicar(
      Aplicar event, Emitter<DetallesofertaState> emit) async {
    OfferService service = new OfferService();
    String? Id = await getCurrentId();
    await service.EnviarAplicacion(event,Id);
  }

  Future<void> _OnDenunciar(
      Denunciar event, Emitter<DetallesofertaState> emit) async {
    OfferService service = new OfferService();
    String? Id = await getCurrentId();
    print('blo'+event.OfferId);
    await service.DenunciarOferta(event.OfferId,Id);
  }

  Future<String?> getCurrentId() async {
    final prefs = await SharedPreferences.getInstance();
    final String? userId = prefs.getString('id');
    return userId;
  }
}  
      
