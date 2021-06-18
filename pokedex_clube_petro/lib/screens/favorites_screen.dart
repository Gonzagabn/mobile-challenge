import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex_clube_petro/models/pokemon_detail.dart';
import 'package:pokedex_clube_petro/stores/favorites_store.dart';
import 'package:pokedex_clube_petro/stores/pokemon_api_store.dart';
import 'package:pokedex_clube_petro/utils/app_routes.dart';
import 'package:pokedex_clube_petro/utils/constants.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  PokemonApiStore? _pokemonApiStore;
  FavoritesStore? _favoritesStore;
  List<PokemonDetail>? _favoritePokemonDetailList;

  @override
  void initState() {
    super.initState();
    _pokemonApiStore = GetIt.instance<PokemonApiStore>();
    _favoritesStore = GetIt.instance<FavoritesStore>();
    if (_pokemonApiStore!.favoritePokemonDetailList!.isEmpty) {
      _pokemonApiStore!.fetchFavoritePokemonDetailList(
          _favoritesStore!.favoritePokemonNames);
    }
    print(_favoritesStore!.favoritePokemonNames);
    print(_pokemonApiStore!.favoritePokemonDetailList);
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
        title: Text(
          'Favoritos',
          style: TextStyle(
            color: Theme.of(context).accentColor,
            fontSize: 18 * sFX,
            fontWeight: FontWeight.bold,
          ),
        ),
        toolbarHeight: 91 * sFY,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Theme.of(context).accentColor,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_sharp),
          onPressed: () {
            _pokemonApiStore!.pokemonName = null;
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        height: 549 * sFY,
        color: Colors.white,
        child: Observer(
          builder: (BuildContext context) {
            _favoritePokemonDetailList =
                _pokemonApiStore!.favoritePokemonDetailList;
            print('fim: $_favoritePokemonDetailList');
            while (_favoritePokemonDetailList!.isEmpty ||
                _favoritePokemonDetailList == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Container(
              height: 527 * sFY,
              child: ListView.builder(
                itemCount: _favoritePokemonDetailList!.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 84 * sFY,
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 26 * sFY,
                        backgroundColor: Constants.RED,
                        child: CircleAvatar(
                          radius: 24 * sFY,
                          backgroundColor: Colors.white,
                          child: ClipOval(
                            child: CachedNetworkImage(
                              imageUrl: _favoritePokemonDetailList![index]
                                  .sprites!
                                  .other!
                                  .officialArtwork!
                                  .frontDefault!,
                              height: 48 * sFY,
                              width: 48 * sFY,
                            ),
                          ),
                        ),
                      ),
                      title: Text(
                        _inCaps(_favoritePokemonDetailList![index].name!),
                        style: TextStyle(
                          fontSize: 16 * sFX,
                          fontWeight: FontWeight.bold,
                          color: Constants.RED,
                        ),
                      ),
                      subtitle: Text(
                        'Tipo: ${_inCaps(_favoritePokemonDetailList![index].types![0].type!.name!)}',
                        style: TextStyle(
                          fontSize: 12 * sFX,
                          color: Constants.DARK_GREY,
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.arrow_forward_ios_rounded),
                        color: Theme.of(context).primaryColor,
                        onPressed: () {
                          _pokemonApiStore!.pokemonName =
                              _favoritePokemonDetailList![index].name!;
                          Navigator.of(context)
                              .pushNamed(AppRoutes.POKEMON_DETAIL);
                        },
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
