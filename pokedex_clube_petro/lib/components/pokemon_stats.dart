import 'package:flutter/material.dart';
import 'package:pokedex_clube_petro/utils/constants.dart';

class PokemonStats extends StatelessWidget {
  final int hp;
  final int attack;
  final int defense;
  final int speed;
  final double sFX;
  final double sFY;

  const PokemonStats({
    Key? key,
    required this.hp,
    required this.attack,
    required this.defense,
    required this.speed,
    required this.sFX,
    required this.sFY,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          height: 42 * sFY,
          width: 45 * sFX,
          child: Column(
            children: <Widget>[
              Text(
                hp.toString(),
                style: TextStyle(
                  fontSize: 16 * sFX,
                  fontWeight: FontWeight.bold,
                  color: Constants.RED,
                ),
              ),
              Text(
                'HP',
                style: TextStyle(
                  fontSize: 12 * sFX,
                  color: Constants.RED,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 43 * sFX,
        ),
        Container(
          height: 42 * sFY,
          width: 49 * sFX,
          child: Column(
            children: <Widget>[
              Text(
                attack.toString(),
                style: TextStyle(
                  fontSize: 16 * sFX,
                  fontWeight: FontWeight.bold,
                  color: Constants.RED,
                ),
              ),
              Text(
                'Attack',
                style: TextStyle(
                  fontSize: 12 * sFX,
                  color: Constants.RED,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 43 * sFX,
        ),
        Container(
          height: 42 * sFY,
          width: 49 * sFX,
          child: Column(
            children: <Widget>[
              Text(
                defense.toString(),
                style: TextStyle(
                  fontSize: 16 * sFX,
                  fontWeight: FontWeight.bold,
                  color: Constants.RED,
                ),
              ),
              Text(
                'Defense',
                style: TextStyle(
                  fontSize: 12 * sFX,
                  color: Constants.RED,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 43 * sFX,
        ),
        Container(
          height: 42 * sFY,
          width: 49 * sFX,
          child: Column(
            children: <Widget>[
              Text(
                speed.toString(),
                style: TextStyle(
                  fontSize: 16 * sFX,
                  fontWeight: FontWeight.bold,
                  color: Constants.RED,
                ),
              ),
              Text(
                'Speed',
                style: TextStyle(
                  fontSize: 12 * sFX,
                  color: Constants.RED,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
