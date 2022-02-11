import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gigandjob_mobile_app/Dominio/Models/Offer.dart';
import 'package:gigandjob_mobile_app/Views/OfferList/OfferListBLOC/offerlist/offerlist_bloc.dart';
import 'package:gigandjob_mobile_app/Views/OfferList/OfferListWidgets/OfferListWidget.dart';

// class MockOfferlistBloc extends MockBloc<OfferlistEvent, OfferlistState>
//     implements OfferlistBloc {}

class MockOfferListBloc extends MockBloc<OfferlistEvent, OfferlistState>
    implements OfferlistBloc {}

void main() {
  group('Main', () {
    final bloc = MockOfferListBloc();
    setUpAll(() {
      // flutter pub add mocktail
      whenListen(
          bloc,
          Stream.fromIterable([
            OfferlistState(offer: [
              OfferDTO(
                  '0854d7fb-6aa5-46ab-99c8-fef87c05efc6', 0, 0, 'test de lista')
            ])
          ]),
          initialState: OfferlistState(offer: [
            OfferDTO('123e4567-e89b-12d3-a456-426614174000', 0, 0,
                'test de lista inicial')
          ]));
    });
    // flutter test <dir/file>
    testWidgets("OfferListWidget should render bloc state items",
        (WidgetTester tester) async {
      final widget = OfferListWidget();
      await tester.pumpWidget(BlocProvider<OfferlistBloc>(
          create: (_) => bloc,
          child: MaterialApp(home: Scaffold(body: widget))));

      await expectLater(find.text("test de lista inicial"), findsOneWidget);
    });
  });
}
