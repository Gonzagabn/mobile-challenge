import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex_clube_petro/components/pokemon_moves.dart';
import 'package:pokedex_clube_petro/components/pokemon_stats.dart';
import 'package:pokedex_clube_petro/models/pokemon_detail.dart';
import 'package:pokedex_clube_petro/models/pokemon_evolution_chain.dart';
import 'package:pokedex_clube_petro/stores/favorites_store.dart';
import 'package:pokedex_clube_petro/stores/pokemon_api_store.dart';
import 'package:pokedex_clube_petro/utils/constants.dart';

class PokemonDetailScreen extends StatefulWidget {
  const PokemonDetailScreen({
    Key? key,
  }) : super(key: key);

  @override
  _PokemonDetailScreenState createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen> {
  PokemonApiStore? _pokemonApiStore;
  FavoritesStore? _favoritesStore;
  PokemonDetail? _pokemonDetail;
  PokemonEvolutionChain? _pokemonEvolutionChain;
  List<String>? _favoritePokemonNames;
  bool? _isFavorite;

  @override
  void initState() {
    super.initState();
    _pokemonApiStore = GetIt.instance<PokemonApiStore>();
    _favoritesStore = GetIt.instance<FavoritesStore>();
    _favoritesStore!.loadFavoritePokemonNames();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final availableHeight = mediaQuery.size.height - mediaQuery.padding.top;
    final availableWidth = mediaQuery.size.width;
    final scaleFactorY = (1 / 640) * availableHeight;
    final scaleFactorX = (1 / 360) * availableWidth;
    final sFX = scaleFactorX;
    final sFY = scaleFactorY;

    String _inCaps(String string) {
      return '${string[0].toUpperCase()}${string.substring(1)}';
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 49 * sFY,
        leading: IconButton(
          icon: Icon(Icons.close_rounded),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        elevation: 0.0,
      ),
      body: Observer(builder: (context) {
        _favoritePokemonNames = _favoritesStore!.favoritePokemonNames;
        _pokemonDetail = _pokemonApiStore!.pokemonDetail;
        if (_favoritePokemonNames!.contains(_pokemonDetail!.name!)) {
          _isFavorite = true;
        } else {
          _isFavorite = false;
        }
        print('Início: $_favoritePokemonNames');

        return (_pokemonApiStore!.pokemonDetail != null)
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 92 * sFY,
                    color: Constants.RED,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(width: 24 * sFX),
                        CircleAvatar(
                          radius: 34 * sFY,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 31 * sFY,
                            backgroundColor: Constants.RED,
                            child: ClipOval(
                              child: CachedNetworkImage(
                                imageUrl: _pokemonDetail!.sprites!.other!
                                    .officialArtwork!.frontDefault!,
                                height: 62 * sFY,
                                width: 62 * sFY,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 16 * sFX),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 3 * sFY),
                            Text(
                              _inCaps(_pokemonDetail!.name!),
                              style: TextStyle(
                                fontSize: 18 * sFY,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 3 * sFY),
                            Text(
                              'Tipo: ${_inCaps(_pokemonDetail!.types![0].type!.name!)}',
                              style: TextStyle(
                                fontSize: 12 * sFY,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          children: [
                            Spacer(),
                            Padding(
                              padding: EdgeInsets.only(
                                bottom: 12 * sFY,
                                right: 16 * sFX,
                              ),
                              child: IconButton(
                                icon: _isFavorite == true
                                    ? Icon(Icons.star_rounded)
                                    : Icon(Icons.star_border_rounded),
                                onPressed: () {
                                  setState(() {
                                    if (_favoritePokemonNames!
                                        .contains(_pokemonDetail!.name!)) {
                                      _isFavorite = true;
                                    } else {
                                      _isFavorite = false;
                                    }
                                    _isFavorite = !_isFavorite!;
                                  });

                                  if (_isFavorite == true) {
                                    _favoritesStore!.addFavoritePokemonName(
                                        _pokemonDetail!.name!);
                                    Navigator.of(context).pop();
                                  } else {
                                    _favoritesStore!.removeFavoritePokemonName(
                                        _pokemonDetail!.name!);
                                  }
                                  print('Fim: $_favoritePokemonNames');
                                },
                                color: Colors.white,
                                iconSize: 32 * sFY,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    height: 499 * sFY,
                    child: Observer(
                      builder: (context) {
                        _pokemonEvolutionChain =
                            _pokemonApiStore!.pokemonEvolutionChain;
                        if ((_pokemonApiStore!.pokemonEvolutionChain != null)) {
                          return Padding(
                            padding: EdgeInsets.only(
                              left: 20 * sFX,
                              right: 19 * sFX,
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(height: 16 * sFY),
                                  Text(
                                    'Características',
                                    style: TextStyle(
                                      fontSize: 16 * sFX,
                                      fontWeight: FontWeight.bold,
                                      color: Constants.BLUE,
                                    ),
                                  ),
                                  SizedBox(height: 11 * sFY),
                                  Text(
                                    'Peso',
                                    style: TextStyle(
                                      fontSize: 14 * sFX,
                                      fontWeight: FontWeight.w600,
                                      color: Constants.BLUE,
                                    ),
                                  ),
                                  SizedBox(height: 6 * sFY),
                                  Text(
                                    '${_pokemonDetail!.weight} kg',
                                    style: TextStyle(
                                      fontSize: 16 * sFX,
                                      fontWeight: FontWeight.bold,
                                      color: Constants.RED,
                                    ),
                                  ),
                                  SizedBox(height: 32 * sFY),
                                  Text(
                                    'Evoluções',
                                    style: TextStyle(
                                      fontSize: 14 * sFX,
                                      fontWeight: FontWeight.w600,
                                      color: Constants.BLUE,
                                    ),
                                  ),
                                  SizedBox(height: 6 * sFY),
                                  Text(
                                    _inCaps(_pokemonEvolutionChain!
                                        .chain!.species!.name!),
                                    style: TextStyle(
                                      fontSize: 16 * sFX,
                                      fontWeight: FontWeight.bold,
                                      color: Constants.RED,
                                    ),
                                  ),
                                  Text(
                                    _inCaps(_pokemonEvolutionChain!
                                        .chain!.evolvesTo![0].species!.name!),
                                    style: TextStyle(
                                      fontSize: 16 * sFX,
                                      fontWeight: FontWeight.bold,
                                      color: Constants.RED,
                                    ),
                                  ),
                                  Text(
                                    _inCaps(_pokemonEvolutionChain!
                                        .chain!
                                        .evolvesTo![0]
                                        .evolvesTo![0]
                                        .species!
                                        .name!),
                                    style: TextStyle(
                                      fontSize: 16 * sFX,
                                      fontWeight: FontWeight.bold,
                                      color: Constants.RED,
                                    ),
                                  ),
                                  SizedBox(height: 32 * sFY),
                                  Text(
                                    'Status base',
                                    style: TextStyle(
                                      fontSize: 14 * sFX,
                                      fontWeight: FontWeight.w600,
                                      color: Constants.BLUE,
                                    ),
                                  ),
                                  SizedBox(height: 6 * sFY),
                                  PokemonStats(
                                    hp: _pokemonDetail!.stats![0].baseStat!,
                                    attack: _pokemonDetail!.stats![1].baseStat!,
                                    defense:
                                        _pokemonDetail!.stats![2].baseStat!,
                                    speed: _pokemonDetail!.stats![3].baseStat!,
                                    sFX: sFX,
                                    sFY: sFY,
                                  ),
                                  SizedBox(height: 32 * sFY),
                                  Text(
                                    'Habilidades',
                                    style: TextStyle(
                                      fontSize: 14 * sFX,
                                      fontWeight: FontWeight.w600,
                                      color: Constants.BLUE,
                                    ),
                                  ),
                                  SizedBox(height: 6 * sFY),
                                  PokemonMoves(
                                    moves: _pokemonDetail!.moves!,
                                    sFX: sFX,
                                    sFY: sFY,
                                  ),
                                ],
                              ),
                            ),
                          );
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                      },
                    ),
                  ),
                ],
              )
            : Center(
                child: CircularProgressIndicator(),
              );
      }),
    );
  }
}
