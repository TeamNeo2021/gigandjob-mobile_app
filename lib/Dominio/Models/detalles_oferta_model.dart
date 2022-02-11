import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class DetallesOferta extends Equatable {
  final String OfferId; 
  final int State;
  final DateTime PublicationDate;
  final int Rating;  
  final int Sector;
  final int Budget;
  final String Description;
  final int applications;
  final int reports;
  DetallesOferta(
      this.OfferId,    
      this.State,      
      this.PublicationDate,
      this.Rating,      
      this.Sector,
      this.Budget,
      this.Description,
      this.applications,
      this.reports)
      : super();
  @override
  List<Object> get props => [];
}
