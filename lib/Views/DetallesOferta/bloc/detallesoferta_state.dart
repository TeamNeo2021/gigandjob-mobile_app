part of 'detallesoferta_bloc.dart';

abstract class DetallesofertaState extends Equatable {
  const DetallesofertaState();

  @override
  List<Object> get props => [];
}

class DetallesofertaInitial extends DetallesofertaState {}

class DetallesofertaInitial() extends DetallesofertaState {}

class OfertaCargada extends DetallesofertaState {
  final DetallesOferta Oferta;

  OfertaCargada(this.Oferta) : super();
}
