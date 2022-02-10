class OfferDTO {
  final String offerId;
  //final String state;
  //final DateTime publicationDate;
  final int rating;
  //final int direction; //aqui falta
  final int sector;
  /*final int budget;*/
  final String description;
  /*final reports?{String State}: { reporterId: string, reason: string }[],
  final applications?: ApplicationDTO[]*/

  OfferDTO(this.offerId, this.rating, this.sector, this.description);
}
