part of 'offerlist_bloc.dart';

@immutable
abstract class OfferlistEvent {}

class GetAll extends OfferlistEvent {
  final String id;
  final String body;

  GetAll(this.id, this.body);
}

class DoNotShow extends OfferlistEvent {}
