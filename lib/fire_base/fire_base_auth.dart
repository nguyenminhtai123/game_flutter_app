import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class FireAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void signUp(String email, String phone, String password, Function onSucsess,
      Function(String) onRegisterError) async {
    try {
      UserCredential result = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      _createUser(user!.uid, email, phone, onSucsess, onRegisterError);
    } catch (error) {
      // ignore: prefer_interpolation_to_compose_strings, avoid_print
      print('Error: ' + error.toString());
      _onSignUpError(error.toString(), onRegisterError);
    }
  }

  void logIn(String email, String password, Function onSucsess,
      Function(String) onLogInError) {
    _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((user) {
      onSucsess();
    }).catchError((error) {
      // ignore: prefer_interpolation_to_compose_strings, avoid_print
      print('Error: ' + error.toString());
      onLogInError('Sign in fail, please try again!');
    });
  }

  void _createUser(String userId, String email, String phone,
      Function onSucsess, Function(String) onRegisterError) {
    // ignore: prefer_collection_literals
    var user = Map<String, String>();
    user['email'] = email;
    user['phone'] = phone;
    // ignore: deprecated_member_use
    var ref = FirebaseDatabase.instance.reference().child('user');
    ref.child(userId).set(user).then((user) {
      onSucsess();
    }).catchError((error) {
      onRegisterError('Signup fail, please try again!');
    });
  }

  void _onSignUpError(String code, Function(String) onRegisterError) {
    // ignore: avoid_print
    print(code);
    switch (code) {
      case "ERROR_INVALID_EMAIL":
      case "ERROR_INVALID_CREDETIAL":
        onRegisterError('Invalid email');
        break;
      case "ERROR_EMAIL_ALREADY_EXIST":
        onRegisterError('Email already exists');
        break;
      case "ERROR_WEAK_PASSWORD":
        onRegisterError('The password is not strong enough!');
        break;
      default:
        onRegisterError('Signup fail, please try again!');
        break;
    }
  }
}
