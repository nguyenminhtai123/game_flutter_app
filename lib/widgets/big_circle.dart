import 'package:flutter/material.dart';

class BigCircle extends StatelessWidget {
  final Widget innerChild;
  final Color gradientColor1;
  final Color gradientColor2;
  final Color shadowColor;

  const BigCircle(
      {super.key,
      required this.innerChild,
      required this.gradientColor1,
      required this.gradientColor2,
      required this.shadowColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [
            gradientColor1,
            gradientColor2,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            spreadRadius: 1,
            offset: const Offset(
              1.0,
              4,
            ),
          ),
        ],
        shape: BoxShape.circle,
      ),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        width: 80.0,
        height: 80.0,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 0.6,
              blurRadius: 7.0,
              offset: Offset(4, -6),
            ),
          ],
        ),
        child: innerChild,
      ),
    );
  }
}
