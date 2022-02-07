part of 'detallesoferta_bloc.dart';

abstract class DetallesofertaEvent extends Equatable {
  const DetallesofertaEvent();

  @override
  List<Object> get props => [];
}


DetallesofertaInitial()
class  extends DetallesofertaEvent {
  final String OfertaId;

  GetOferta(this.OfertaId) : super();
}
class GetOferta extends DetallesofertaEvent {
  final String OfertaId;

  GetOferta(this.OfertaId) : super();
}

