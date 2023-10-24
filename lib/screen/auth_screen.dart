import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jankenpon_app/blocs/auth_bloc.dart';
import 'package:jankenpon_app/main.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final AuthBloc bloc = AuthBloc();

  bool isChecked = false;
  bool isPlayer = true;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  void onPressRegister() {
    setState(() {
      if (bloc.isValidInfo(_emailController.text, _phoneController.text,
          _passwordController.text)) {
        bloc.signUp(_emailController.text, _phoneController.text,
            _passwordController.text, () {
          Navigator.pushNamed(context, '/home');
        }, (msg) {});
      }
    });
  }

  void onPressLogin() {
    String email = _emailController.text;
    String pass = _passwordController.text;
    var authBloc = MyApp.of(context)?.bloc;
    authBloc?.logIn(email, pass, () {
      Navigator.pushNamed(context, '/home');
    }, (msg) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [
              const HSLColor.fromAHSL(1, 214, 0.47, 0.23).toColor(),
              const HSLColor.fromAHSL(1, 239, 0.49, 0.15).toColor(),
            ],
          ),
        ),
        padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
        child: isPlayer
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hi, Welcome Back!',
                    style: GoogleFonts.barlowSemiCondensed(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                    ),
                  ),
                  Text(
                    'Hello again, you’ve been missed!',
                    style: GoogleFonts.barlowSemiCondensed(
                      color: Colors.white30,
                      fontWeight: FontWeight.w600,
                      fontSize: 14.0,
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  StreamBuilder(
                      stream: bloc.emailController.asBroadcastStream(),
                      builder: (context, snapshot) {
                        return TextField(
                          controller: _emailController,
                          style: GoogleFonts.barlowSemiCondensed(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                          decoration: InputDecoration(
                              label: const Text('Enter Your Email'),
                              labelStyle: const TextStyle(
                                color: Color.fromARGB(255, 133, 132, 132),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 194, 193, 193),
                                ),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 194, 193, 193),
                                ),
                              ),
                              errorText: snapshot.hasError
                                  ? snapshot.error.toString()
                                  : null),
                        );
                      }),
                  const SizedBox(
                    height: 12,
                  ),
                  StreamBuilder(
                      stream: bloc.passwordController.asBroadcastStream(),
                      builder: (context, snapshot) {
                        return TextField(
                          controller: _passwordController,
                          style: GoogleFonts.barlowSemiCondensed(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                          obscureText: true,
                          decoration: InputDecoration(
                              label: const Text('Please Enter Your Password'),
                              labelStyle: const TextStyle(
                                color: Color.fromARGB(255, 133, 132, 132),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 194, 193, 193),
                                ),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 194, 193, 193),
                                ),
                              ),
                              errorText: snapshot.hasError
                                  ? snapshot.error.toString()
                                  : null),
                        );
                      }),
                  const SizedBox(
                    height: 18,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                      const Text(
                        'Remember Me',
                        style: TextStyle(
                            color: Color.fromARGB(255, 133, 132, 132),
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      const Spacer(),
                      RichText(
                        text: const TextSpan(
                          text: 'Forgot Password',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(255, 189, 70, 62),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 125,
                  ),
                  GestureDetector(
                    onTap: onPressLogin,
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 11),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: const HSLColor.fromAHSL(1, 229, 0.64, 0.31)
                              .toColor(),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Don’t have an account ?',
                            style: TextStyle(
                              color: Color.fromARGB(255, 133, 132, 132),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const WidgetSpan(
                            child: SizedBox(width: 9),
                          ),
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                setState(() {
                                  isPlayer = !isPlayer;
                                });
                              },
                            text: 'Sign up',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )

            // Sign up
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Create an account',
                    style: GoogleFonts.barlowSemiCondensed(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                    ),
                  ),
                  Text(
                    'Connect with your friends today!',
                    style: GoogleFonts.barlowSemiCondensed(
                      color: Colors.white30,
                      fontWeight: FontWeight.w600,
                      fontSize: 14.0,
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  StreamBuilder(
                      stream: bloc.emailController.asBroadcastStream(),
                      builder: (context, snapshot) {
                        return TextField(
                          controller: _emailController,
                          style: GoogleFonts.barlowSemiCondensed(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                          decoration: InputDecoration(
                              label: const Text('Enter Your Email'),
                              labelStyle: const TextStyle(
                                color: Color.fromARGB(255, 133, 132, 132),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 194, 193, 193),
                                ),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 194, 193, 193),
                                ),
                              ),
                              errorText: snapshot.hasError
                                  ? snapshot.error.toString()
                                  : null),
                        );
                      }),
                  const SizedBox(
                    height: 12,
                  ),
                  StreamBuilder(
                      stream: bloc.phoneController.asBroadcastStream(),
                      builder: (context, snapshot) {
                        return TextField(
                          controller: _phoneController,
                          style: GoogleFonts.barlowSemiCondensed(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                          decoration: InputDecoration(
                              label: const Text('Enter Your Phone Number'),
                              labelStyle: const TextStyle(
                                color: Color.fromARGB(255, 133, 132, 132),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 194, 193, 193),
                                ),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 194, 193, 193),
                                ),
                              ),
                              errorText: snapshot.hasError
                                  ? snapshot.error.toString()
                                  : null),
                        );
                      }),
                  const SizedBox(
                    height: 12,
                  ),
                  StreamBuilder(
                      stream: bloc.passwordController.asBroadcastStream(),
                      builder: (context, snapshot) {
                        return TextField(
                          controller: _passwordController,
                          style: GoogleFonts.barlowSemiCondensed(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                          obscureText: true,
                          decoration: InputDecoration(
                              label: const Text('Please Enter Your Password'),
                              labelStyle: const TextStyle(
                                color: Color.fromARGB(255, 133, 132, 132),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 194, 193, 193),
                                ),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 194, 193, 193),
                                ),
                              ),
                              errorText: snapshot.hasError
                                  ? snapshot.error.toString()
                                  : null),
                        );
                      }),
                  const SizedBox(
                    height: 18,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                      const Text(
                        'Remember Me',
                        style: TextStyle(
                            color: Color.fromARGB(255, 133, 132, 132),
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  GestureDetector(
                    onTap: onPressRegister,
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 11),
                      child: Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: const HSLColor.fromAHSL(1, 229, 0.64, 0.31)
                              .toColor(),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Already have an account ?',
                            style: TextStyle(
                              color: Color.fromARGB(255, 133, 132, 132),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const WidgetSpan(
                            child: SizedBox(width: 9),
                          ),
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                setState(() {
                                  isPlayer = !isPlayer;
                                });
                              },
                            text: 'Login',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
