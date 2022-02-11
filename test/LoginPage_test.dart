import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gigandjob_mobile_app/Views/Login/BLOC/authbloc_bloc.dart';
import 'package:gigandjob_mobile_app/Views/Login/LoginPage.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthBloc extends MockBloc<AuthBlocEvent, AuthBlocState>
    implements AuthBloc {}

class AuthenticationStateFake extends Fake implements AuthBlocState {}

class AuthenticationEventFake extends Fake implements AuthBlocEvent {}

void main() {
  group('Login', () {
    setUpAll(() {
      registerFallbackValue(AuthenticationStateFake());
      registerFallbackValue(AuthenticationEventFake());
    });

    testWidgets('should show a Message when the Authentication state is Error',
        (WidgetTester tester) async {
      // arrange
      final mockAuthenticationBloc = MockAuthBloc();
      when(() => mockAuthenticationBloc.state).thenReturn(
        AuthInitialState(), // the desired state
      );

      // find
      final widget = LoginPage();
      //final messageWidget = find.byType(Message);

      // test
      await tester.pumpWidget(
        BlocProvider<AuthBloc>(
          create: (context) => mockAuthenticationBloc,
          child: MaterialApp(
            title: 'Widget Test',
            home: LoginPage(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // expect
      expect(find.widgetWithText(MaterialButton, 'Sign Up'), findsOneWidget);
      expect(find.widgetWithText(MaterialButton, 'Login'), findsOneWidget);
    });
  });
}
