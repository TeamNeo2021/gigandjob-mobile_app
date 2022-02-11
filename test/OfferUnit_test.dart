import 'package:flutter_test/flutter_test.dart';
import 'package:gigandjob_mobile_app/Dominio/Models/Offer.dart';
import 'package:gigandjob_mobile_app/Dominio/Services/OfferService.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  test('Bring offer List', () async {
    final response = await OfferService().FetchOfertas();
    expect(response.isNotEmpty, true);
  });
}
