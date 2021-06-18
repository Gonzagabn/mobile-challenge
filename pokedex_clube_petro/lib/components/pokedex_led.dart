import 'package:flutter/material.dart';
import 'package:pokedex_clube_petro/utils/constants.dart';

class PokedexLed extends StatelessWidget {
  final Color color;
  final double sFX;
  final double sFY;
  final double left;
  final double top;
  final double right;
  final double bottom;

  const PokedexLed({
    Key? key,
    required this.color,
    required this.sFX,
    required this.sFY,
    required this.left,
    required this.top,
    required this.right,
    required this.bottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 14 * sFX,
      child: Stack(
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Constants.BLUE_LED,
          ),
          Padding(
            padding: EdgeInsets.only(top: 2 * sFY, bottom: 2 * sFY),
            child: CircleAvatar(
              backgroundColor: color,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: left * sFX,
              top: top * sFY,
              right: right * sFX,
              bottom: bottom * sFY,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2 * sFY),
                gradient: RadialGradient(
                  colors: [
                    Constants.LIGHT,
                    color.withOpacity(0.6),
                  ],
                  radius: 0.6 * sFY,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
