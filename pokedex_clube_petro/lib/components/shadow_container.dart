import 'package:flutter/material.dart';

class ShadowContainer extends StatelessWidget {
  final Widget child;
  final double sFY;

  const ShadowContainer({
    Key? key,
    required this.sFY,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 41 * sFY,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
              offset: Offset(1, 1),
              blurRadius: 6,
              spreadRadius: 1,
              color: Color.fromARGB(15, 0, 0, 0)),
        ],
      ),
      child: child,
    );
  }
}
