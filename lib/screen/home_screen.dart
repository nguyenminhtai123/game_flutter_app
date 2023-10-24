// ignore_for_file: avoid_print
import 'dart:math';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jankenpon_app/widgets/big_circle.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _drawerGlobalKey =
      new GlobalKey<ScaffoldState>();
  String userPick = '';
  String computerPick = '';
  String message = '';
  double myPoints = 0.0;
  bool hasChosen = false;
  Widget userPicked = Container(), computerPicked = Container();

  final List<String> _choices = ['Paper', 'Rock', 'Scissors'];

  getComputerPick() {
    int randomNumber = Random().nextInt(3);
    computerPick = _choices[randomNumber];
  }

  getResult(userPick, computerPick) {
    var rpsChoices = {
      'Rock': {'Scissors': 1, 'Rock': 0.5, 'Paper': 0},
      'Paper': {'Rock': 1, 'Paper': 0.5, 'Scissors': 0},
      'Scissors': {'Paper': 1, 'Scissors': 0.5, 'Rock': 0},
    };

    var myScore = rpsChoices[userPick]?[computerPick];
    updateScore(myScore);
    picked();
    hasChosen = true;
  }

  updateScore(myScore) {
    if (myScore == 0) {
      return {
        message = 'You lost!',
        myPoints += 0.0,
      };
    } else if (myScore == 0.5) {
      return {
        message = 'You tired!',
        myPoints += 0.5,
      };
    } else {
      return {
        message = 'You won!',
        myPoints += 1,
      };
    }
  }

  picked() {
    // userPicked
    if (userPick == 'Paper') {
      userPicked = BigCircle(
          innerChild: SvgPicture.asset('assets/images/icon-paper.svg'),
          gradientColor1: const HSLColor.fromAHSL(1, 230, 0.89, 0.62).toColor(),
          gradientColor2: const HSLColor.fromAHSL(1, 230, 0.49, 0.65).toColor(),
          shadowColor: const HSLColor.fromAHSL(1, 229, 0.64, 0.46).toColor());
    } else if (userPick == 'Rock') {
      userPicked = BigCircle(
          innerChild: SvgPicture.asset('assets/images/icon-rock.svg'),
          gradientColor1: const HSLColor.fromAHSL(1, 349, 0.71, 0.52).toColor(),
          gradientColor2: const HSLColor.fromAHSL(1, 349, 0.70, 0.56).toColor(),
          shadowColor: const HSLColor.fromAHSL(1, 349, 0.64, 0.46).toColor());
    } else {
      userPicked = BigCircle(
          innerChild: SvgPicture.asset('assets/images/icon-scissors.svg'),
          gradientColor1: const HSLColor.fromAHSL(1, 39, 0.89, 0.49).toColor(),
          gradientColor2: const HSLColor.fromAHSL(1, 40, 0.84, 0.53).toColor(),
          shadowColor: const HSLColor.fromAHSL(1, 39, 0.64, 0.46).toColor());
    }
    // computerPicked

    if (computerPick == 'Paper') {
      computerPicked = BigCircle(
          innerChild: SvgPicture.asset('assets/images/icon-paper.svg'),
          gradientColor1: const HSLColor.fromAHSL(1, 230, 0.89, 0.62).toColor(),
          gradientColor2: const HSLColor.fromAHSL(1, 230, 0.49, 0.65).toColor(),
          shadowColor: const HSLColor.fromAHSL(1, 229, 0.64, 0.46).toColor());
    } else if (computerPick == 'Rock') {
      computerPicked = BigCircle(
          innerChild: SvgPicture.asset('assets/images/icon-rock.svg'),
          gradientColor1: const HSLColor.fromAHSL(1, 349, 0.71, 0.52).toColor(),
          gradientColor2: const HSLColor.fromAHSL(1, 349, 0.70, 0.56).toColor(),
          shadowColor: const HSLColor.fromAHSL(1, 349, 0.64, 0.46).toColor());
    } else {
      computerPicked = BigCircle(
          innerChild: SvgPicture.asset('assets/images/icon-scissors.svg'),
          gradientColor1: const HSLColor.fromAHSL(1, 39, 0.89, 0.49).toColor(),
          gradientColor2: const HSLColor.fromAHSL(1, 40, 0.84, 0.53).toColor(),
          shadowColor: const HSLColor.fromAHSL(1, 39, 0.64, 0.46).toColor());
    }
  }

  userClicking() {
    getComputerPick();
    getResult(userPick, computerPick);
    setState(() {
      myPoints;
      hasChosen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const HSLColor.fromAHSL(1, 239, 0.49, 0.15).toColor(),
        leading: IconButton(
          onPressed: () {
            if (_drawerGlobalKey.currentState!.isDrawerOpen) {
              Navigator.pop(context);
            } else {
              _drawerGlobalKey.currentState!.openDrawer();
            }
          },
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
      ),
      body: Scaffold(
        key: _drawerGlobalKey,
        drawer: Drawer(
          child: SafeArea(
            child: Container(
              color: const HSLColor.fromAHSL(1, 239, 0.49, 0.15).toColor(),
              child: Column(
                children: [
                  ListTile(
                      title: Text(
                        'Đăng xuất',
                        style: GoogleFonts.barlowSemiCondensed(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      leading: const Icon(
                        Icons.logout_outlined,
                        color: Colors.white,
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, '/login');
                      }),
                ],
              ),
            ),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.only(
            top: 15.0,
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
                    color:
                        const HSLColor.fromAHSL(1, 217, 0.16, 0.45).toColor(),
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Rock\nPaper\nScissors',
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
                                color:
                                    const HSLColor.fromAHSL(1, 229, 0.64, 0.31)
                                        .toColor(),
                              ),
                            ),
                            TextSpan(
                              text: myPoints.toString(),
                              style: GoogleFonts.barlowSemiCondensed(
                                fontSize: 30.0,
                                color:
                                    const HSLColor.fromAHSL(1, 229, 0.25, 0.31)
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
              Container(
                padding:
                    const EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0),
                child: hasChosen
                    ? Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  userPicked,
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    'I picked',
                                    style: GoogleFonts.barlowSemiCondensed(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25.0),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  computerPicked,
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    'Bot picked',
                                    style: GoogleFonts.barlowSemiCondensed(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25.0),
                                  )
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 40.0,
                          ),
                          Text(
                            message,
                            style: GoogleFonts.barlowSemiCondensed(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 60.0,
                            ),
                          ),
                          const SizedBox(
                            height: 40.0,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 60.0, vertical: 10.0)),
                              onPressed: () {
                                setState(() {
                                  hasChosen = false;
                                });
                              },
                              child: Text(
                                'PLAY AGAIN!',
                                style: GoogleFonts.barlowSemiCondensed(
                                    color: const HSLColor.fromAHSL(
                                            1, 239, 0.49, 0.15)
                                        .toColor(),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30.0),
                              ))
                        ],
                      )
                    : Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  userPick = 'Paper';
                                  userClicking();
                                },
                                child: BigCircle(
                                    innerChild: SvgPicture.asset(
                                        'assets/images/icon-paper.svg'),
                                    gradientColor1: const HSLColor.fromAHSL(
                                            1, 230, 0.89, 0.62)
                                        .toColor(),
                                    gradientColor2: const HSLColor.fromAHSL(
                                            1, 230, 0.49, 0.65)
                                        .toColor(),
                                    shadowColor: const HSLColor.fromAHSL(
                                            1, 229, 0.64, 0.46)
                                        .toColor()),
                              ),
                              InkWell(
                                onTap: () {
                                  userPick = 'Scissors';
                                  userClicking();
                                },
                                child: BigCircle(
                                    innerChild: SvgPicture.asset(
                                        'assets/images/icon-scissors.svg'),
                                    gradientColor1: const HSLColor.fromAHSL(
                                            1, 39, 0.89, 0.49)
                                        .toColor(),
                                    gradientColor2: const HSLColor.fromAHSL(
                                            1, 40, 0.84, 0.53)
                                        .toColor(),
                                    shadowColor: const HSLColor.fromAHSL(
                                            1, 39, 0.64, 0.46)
                                        .toColor()),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          InkWell(
                            onTap: () {
                              userPick = 'Rock';
                              userClicking();
                            },
                            child: BigCircle(
                                innerChild: SvgPicture.asset(
                                    'assets/images/icon-rock.svg'),
                                gradientColor1:
                                    const HSLColor.fromAHSL(1, 349, 0.71, 0.52)
                                        .toColor(),
                                gradientColor2:
                                    const HSLColor.fromAHSL(1, 349, 0.70, 0.56)
                                        .toColor(),
                                shadowColor:
                                    const HSLColor.fromAHSL(1, 349, 0.64, 0.46)
                                        .toColor()),
                          ),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
