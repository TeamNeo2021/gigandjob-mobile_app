import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gigandjob_mobile_app/Views/Main/MainPage.dart';
import 'package:gigandjob_mobile_app/Views/Profile/ProfilePage.dart';
import 'package:gigandjob_mobile_app/Widgets/BottomNavBar/bloc/bottomnavbar_bloc.dart';
import 'package:gigandjob_mobile_app/Widgets/CustomBottonNavigationBar.dart';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gigandjob_mobile_app/Views/Login/BLOC/authbloc_bloc.dart';
import 'package:gigandjob_mobile_app/Views/Login/LoginPage.dart';
import 'package:mocktail/mocktail.dart';

class MockBottomNavBarBloc
    extends MockBloc<BottomNavBarEvent, BottomNavBarState>
    implements BottomNavBarBloc {}

class BottomNavBarStateFake extends Fake implements BottomNavBarState {}

class BottomNavBarEventFake extends Fake implements BottomNavBarEvent {}

void main() {
  group('Main', () {
    setUpAll(() {
      registerFallbackValue(BottomNavBarStateFake());
      registerFallbackValue(BottomNavBarEventFake());
    });

    testWidgets('should show a Message when the Authentication state is Error',
        (WidgetTester tester) async {
      // arrange
      final mockBottomNavBarBloc = MockBottomNavBarBloc();
      when(() => mockBottomNavBarBloc.state).thenReturn(
        BottomNavBarInitial(0, Scaffold()), // the desired state
      );

      // find
      final widget = LoginPage();
      //final messageWidget = find.byType(Message);

      // test
      await tester.pumpWidget(
        BlocProvider<BottomNavBarBloc>(
          create: (context) => mockBottomNavBarBloc,
          child: MaterialApp(
            title: 'Widget Test',
            home: Scaffold(
              body: Container(child: Text('Test')),
              bottomNavigationBar: CustomBottomNavigationBar(),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // expect
      expect(find.byIcon(Icons.cases_rounded), findsOneWidget);
    });
  });
}
