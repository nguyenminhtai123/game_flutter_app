import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isChecked = false;
  bool isPlayer = false;

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
                  const TextField(
                    decoration: InputDecoration(
                      label: Text('Enter Your Email'),
                      labelStyle: TextStyle(
                        color: Color.fromARGB(255, 133, 132, 132),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 194, 193, 193),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 194, 193, 193),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      label: Text('Please Enter Your Password'),
                      labelStyle: TextStyle(
                        color: Color.fromARGB(255, 133, 132, 132),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 194, 193, 193),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 194, 193, 193),
                        ),
                      ),
                    ),
                  ),
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
                    onTap: () {},
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
                  const TextField(
                    decoration: InputDecoration(
                      label: Text('Enter Your Email'),
                      labelStyle: TextStyle(
                        color: Color.fromARGB(255, 133, 132, 132),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 194, 193, 193),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 194, 193, 193),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      label: Text('Enter Your Phone Number'),
                      labelStyle: TextStyle(
                        color: Color.fromARGB(255, 133, 132, 132),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 194, 193, 193),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 194, 193, 193),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      label: Text('Please Enter Your Password'),
                      labelStyle: TextStyle(
                        color: Color.fromARGB(255, 133, 132, 132),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 194, 193, 193),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 194, 193, 193),
                        ),
                      ),
                    ),
                  ),
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
                    onTap: () {},
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
