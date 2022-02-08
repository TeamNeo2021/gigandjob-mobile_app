import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class DetallesOferta extends Equatable {
  final String OfferId;
  final String titulo; //Falta
  //final State: OfferStateVO;
  //final Before_State: OfferStateVO;
  final DateTime PublicationDate;
  final int Rating;
  final String Direction;
  final String Sector;
  final String Budget;
  final String Description;
  //final application: Application[];
  //final reports: OfferReportVO[] = []

  DetallesOferta(
      this.OfferId,
      this.titulo, //Falta
      //final State: OfferStateVO,
      //final Before_State: OfferStateVO,
      this.PublicationDate,
      this.Rating,
      this.Direction,
      this.Sector,
      this.Budget,
      this.Description)
      : super();
  @override
  List<Object> get props => [];
}
