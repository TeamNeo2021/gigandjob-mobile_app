
import 'package:equatable/equatable.dart';

class Meeting extends Equatable{
  final Map candidate;
  final Map employer;
  final String id;
  final String state;
  final String description;
  final DateTime date;
  final Map location;

  Meeting(
    this.candidate,
    this.employer, 
    this.id,
    this.state,
    this.description,
    this.date,
    this.location)
     : super();
  @override
  List<Object> get props => [];
}