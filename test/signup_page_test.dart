import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gigandjob_mobile_app/Views/SignUp/signup.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter test',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('test'),
        ),
        body: const SignupPage(),
      ),
    );
  }
}

void main() {
  testWidgets('SignupPage has a title', (WidgetTester tester) async {
    await tester.pumpWidget(const MyWidget());
    final titleFinder = find.text('test');

    expect(titleFinder, findsOneWidget);
  });
}
