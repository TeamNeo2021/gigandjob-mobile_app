part of 'detallesoferta_bloc.dart';

abstract class DetallesofertaEvent extends Equatable {
  const DetallesofertaEvent();

  @override
  List<Object> get props => [];
}

class GetOferta extends DetallesofertaEvent {
  final String OfertaId;

  GetOferta(this.OfertaId) : super();    
}

class Aplicar extends DetallesofertaEvent {
  final String OfferId;
  final String employerId;
  final String candidateId;
  final String state;
  final int budget;
  final String description;
  final int duration_days;

    Aplicar(
      this.OfferId,      
      this.candidateId,
      this.employerId,
      this.state,    
      this.budget,
      this.description,
      this.duration_days,
    ) : super();
}