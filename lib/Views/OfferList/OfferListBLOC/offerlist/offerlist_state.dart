part of 'offerlist_bloc.dart';

/*class OfferlistState {
  final String offerId;
  final String offerName;

  OfferlistState({this.offerId = '1', this.offerName = 'Prueba'});
}*/

class OfferlistState {
  List<OfferDTO> offer;

  OfferlistState({required this.offer});
}
