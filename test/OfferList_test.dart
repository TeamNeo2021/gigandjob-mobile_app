import 'package:flutter_test/flutter_test.dart';
import 'package:gigandjob_mobile_app/Views/OfferList/OfferListPage.dart';

void main() {
  testWidgets('Traeme las ofertas', (WidgetTester tester) async {
    var widget = OfferListPage();
    await tester.pumpWidget(widget);
  });
}
