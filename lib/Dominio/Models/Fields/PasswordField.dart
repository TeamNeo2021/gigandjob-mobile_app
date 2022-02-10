import 'package:formz/formz.dart';

enum PasswordError { empty, incorrect }

class PasswordField extends FormzInput<String, PasswordError> {
  const PasswordField.pure() : super.pure('');
  const PasswordField.dirty([String value = '']) : super.dirty(value);

  static final _password = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');

  @override
  PasswordError? validator(String value) {
    if (value.isEmpty) {
      return PasswordError.empty;
    } else if (!_password.hasMatch(value)) {
      return PasswordError.incorrect;
    }
    return null;
  }

  // @override
  // Stream<PasswordError> get validations {
  //   return super.validations
  //     .where((value) => value == null)
  //     .map((_) => validator(value));
  // }

  @override
  PasswordError? get error => validator(value);

  @override
  bool get isValid => error == null;
}
