import 'dart:async';

import 'package:jankenpon_app/fire_base/fire_base_auth.dart';
import 'package:jankenpon_app/validators/auth_validation.dart';

class AuthBloc {
  final _fireAuth = FireAuth();
  final StreamController _emailController = StreamController.broadcast();
  final StreamController _phoneController = StreamController.broadcast();
  final StreamController _passwordController = StreamController.broadcast();

  Stream get emailController => _emailController.stream;
  Stream get phoneController => _phoneController.stream;
  Stream get passwordController => _passwordController.stream;

  bool isValidInfo(String email, phone, password) {
    if (!AuthValidation.isValidEmail(email)) {
      _emailController.sink.addError('Email của bạn không hợp lệ!');
      return false;
    }
    _emailController.sink.add('OK');
    if (!AuthValidation.isValidPhone(phone)) {
      _phoneController.sink.addError('Số điện thoại của bạn không hợp lệ!');
      return false;
    }
    _phoneController.sink.add('OK');
    if (!AuthValidation.isValidPassword(password)) {
      _passwordController.sink
          .addError('Mật khẩu của bạn phải lớn hơn 6 kí tự!');
      return false;
    }
    _passwordController.sink.add('OK');
    return true;
  }

  void signUp(String email, String phone, String password, Function onSucsess,
      Function(String) onRegisterError) {
    _fireAuth.signUp(email, phone, password, onSucsess, onRegisterError);
  }

  void logIn(String email, String password, Function onSucsess,
      Function(String) onLogInError) {
    _fireAuth.logIn(email, password, onSucsess, onLogInError);
  }

  void dispose() {
    _emailController.close();
    _phoneController.close();
    _passwordController.close();
  }
}
