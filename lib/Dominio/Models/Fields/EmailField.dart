import 'package:formz/formz.dart';

enum EmailError { empty }

class EmailField extends FormzInput<String, EmailError> {
  const EmailField.pure() : super.pure('');
  const EmailField.dirty([String value = '']) : super.dirty(value);

  @override
  EmailError? validator(String value) {
    // TODO: implement validator
    throw UnimplementedError();
  }
  // Email Validation

}
