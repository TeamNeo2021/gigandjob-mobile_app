import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gigandjob_mobile_app/Dominio/Models/detalles_oferta_model.dart';

import '../../../Dominio/Models/detalles_oferta_model.dart';

part 'detallesoferta_event.dart';
part 'detallesoferta_state.dart';

class DetallesofertaBloc extends Bloc<DetallesofertaEvent, DetallesofertaState> {
  void _OnDetallesOfertInitial(DetallesofertaInitial event, Emitter<OfertaLoading> emit){
    emit(OfertaLoading());
  }
  
  void _OnGetOferta(GetOferta event,Emitter<OfertaLoading> emit1,Emitter<OfertaCargada> emit2){
    emit(OfertaLoading());
    final detallesOferta = await _FetchDetallesOferta(event.OfertaId);
    emit(OfertaCargada(detallesOferta));
  }

  DetallesofertaBloc() : super(DetallesofertaInitial()) {
    on<DetallesofertaInitial>(_OnDetallesOfertInitial);
    on<GetOferta>(_OnGetOferta);
}
