import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jankenpon_app/btn_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? userPick;
  String? computerPick;
  String? result;

  String GetComputerPick() {
    int randomNumber = Random().nextInt(2);
    if (randomNumber == 0) {
      computerPick = "Kéo";
    } else if (randomNumber == 1) {
      computerPick = "Búa";
    } else {
      computerPick = "Bao";
    }

    return computerPick!;
  }

  void getUserPick(String title) {
    setState(() {
      userPick = title;
    });
  }

  String? getResult() {
    if (userPick == computerPick) {
      return 'draw';
    } else if (userPick == "Kéo" && computerPick == "Bao") {
      return 'you win';
    } else if (userPick == "Búa" && computerPick == "Kéo") {
      return 'you win';
    } else if (userPick == "Bao" && computerPick == "Búa") {
      return 'you win';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(
          top: 30.0,
          left: 8.0,
          right: 8.0,
          bottom: 8.0,
        ),
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [
              const HSLColor.fromAHSL(1, 214, 0.47, 0.23).toColor(),
              const HSLColor.fromAHSL(1, 239, 0.49, 0.15).toColor(),
            ],
          ),
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 3.0,
                  color: const HSLColor.fromAHSL(1, 217, 0.16, 0.45).toColor(),
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Rock\nPaper\nScissos',
                    style: GoogleFonts.barlowSemiCondensed(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 24.0,
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(
                        const Size(100, 80),
                      ),
                      backgroundColor: MaterialStateProperty.all(
                        Colors.white,
                      ),
                    ),
                    onPressed: null,
                    child: RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                        children: [
                          TextSpan(
                            text: 'Score\n',
                            style: GoogleFonts.barlowSemiCondensed(
                              fontSize: 15.0,
                              color: const HSLColor.fromAHSL(1, 229, 0.64, 0.31)
                                  .toColor(),
                            ),
                          ),
                          TextSpan(
                            text: '12',
                            style: GoogleFonts.barlowSemiCondensed(
                              fontSize: 40.0,
                              color: const HSLColor.fromAHSL(1, 229, 0.25, 0.31)
                                  .toColor(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        gradient: RadialGradient(
                          colors: [
                            const HSLColor.fromAHSL(1, 230, 0.89, 0.62)
                                .toColor(),
                            const HSLColor.fromAHSL(1, 230, 0.49, 0.65)
                                .toColor(),
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: const HSLColor.fromAHSL(1, 229, 0.64, 0.46)
                                .toColor(),
                          ),
                        ],
                      ),
                      child: Expanded(
                        child: ButtonWidget(
                          title: 'Kéo',
                          onTap: () {
                            getUserPick("Kéo");
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ButtonWidget(
                        title: 'Búa',
                        onTap: () {
                          getUserPick("Búa");
                        },
                      ),
                    ),
                  ],
                ),
                Center(
                  child: ButtonWidget(
                    title: 'Bao',
                    onTap: () {
                      getUserPick("Bao");
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
