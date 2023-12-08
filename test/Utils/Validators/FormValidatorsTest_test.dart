import 'package:delivery/src/Utils/Validators/FormValidators.dart';
import 'package:flutter_test/flutter_test.dart';

abstract class _Constants {
  static String correctEmail = "zarek@gmail.com";
  static String wrongEmail1 = "zarek@gmail.com";
  static String wrongEmail2 = "zarek@@gmailcom";
  static String correctPassword = "1235678992";
  static String wrongPassword = "123";
  static String correctInputText = "something";
  static String wrongInputText = "";
}

void main() {

  // Test forms validators escenarios
  group('Test forms validators escenarios', () {
    // Test correct email input in text fields
    test('Test correct email input', () {
      final email = EmailFormValidator.validateEmail(email: _Constants.correctEmail);

      expect(email, null);
    });

    // Test wrong email input without @ in text fields
    test('Test wrong email input withot @', () {
      final email = EmailFormValidator.validateEmail(email: _Constants.wrongEmail1);

      expect(email, EmailFormValidator.message);
    });

    // Test wrong email input without dot in text fields
    test('Test wrong email input without dot', () {
      final email = EmailFormValidator.validateEmail(email: _Constants.wrongEmail2);

      expect(email, EmailFormValidator.message);
    });

    // Test correct password input with more than 6 digits
    test('Test correct password input with more than 6 digits', () {
      final password = PasswordFormValidator.validatePassword(password: _Constants.correctPassword);

      expect(password, null);
    });

    // Test wrong password input with not 6 digits
    test('Test wrong password input with not 6 digits', () {
      final password = PasswordFormValidator.validatePassword(password: _Constants.wrongPassword);

      expect(password, PasswordFormValidator.message);
    });

    // Test correct input text with more than 0 digits
    test('Test correct input text with more than 0 digits', () {
      final text = DefaultFormValidator.validateIsNotEmpty(value: _Constants.correctInputText);

      expect(text, null);
    });

    // Test wrong input text with empty digits
    test('Test wrong input text with empty digits', () {
      final text = DefaultFormValidator.validateIsNotEmpty(value: _Constants.wrongInputText);

      expect(text, DefaultFormValidator.message);
    });
  });
}