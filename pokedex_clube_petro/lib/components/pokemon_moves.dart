import 'package:flutter/material.dart';
import 'package:pokedex_clube_petro/models/pokemon_detail.dart';
import 'package:pokedex_clube_petro/utils/constants.dart';

class PokemonMoves extends StatelessWidget {
  final List<Moves> moves;
  final double sFX;
  final double sFY;

  const PokemonMoves({
    Key? key,
    required this.moves,
    required this.sFX,
    required this.sFY,
  }) : super(key: key);

  List<Widget> getMoves({required List<Moves> moves}) {
    List<Widget> _movesList = [];
    moves.forEach(
      (moves) {
        _movesList.add(
          Padding(
            padding: EdgeInsets.only(bottom: 15 * sFY),
            child: Text(
              '•  ${_inCaps(moves.move!.name!)}',
              style: TextStyle(
                fontSize: 16 * sFX,
                fontWeight: FontWeight.bold,
                color: Constants.RED,
              ),
            ),
          ),
        );
      },
    );
    return _movesList;
  }

  String _inCaps(String string) {
    return '${string[0].toUpperCase()}${string.substring(1)}';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: getMoves(moves: moves),
    );
  }
}
