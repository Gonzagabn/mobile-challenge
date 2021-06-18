import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex_clube_petro/models/pokemon_evolution_chain.dart';
import 'package:pokedex_clube_petro/stores/pokemon_api_store.dart';
import 'package:pokedex_clube_petro/utils/app_routes.dart';
import 'package:pokedex_clube_petro/utils/constants.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  PokemonApiStore? _pokemonApiStore;
  PokemonEvolutionChain? _pokemonEvolutionChain;
  String? _pokemonName;
  TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _pokemonApiStore = GetIt.instance<PokemonApiStore>();
    if (_pokemonApiStore!.pokemonEvolutionChain == null) {
      _pokemonApiStore!.fetchPokemonEvolutionChain();
    }
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
          'Pesquisar',
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
          size: 16 * sFY,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_sharp),
          onPressed: () {
            Navigator.of(context).pop();
            _pokemonName = null;
            _pokemonApiStore!.pokemonEvolutionChain = null;
          },
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(left: 24 * sFX, right: 16 * sFX),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Observer(builder: (context) {
                _pokemonEvolutionChain =
                    _pokemonApiStore!.pokemonEvolutionChain;
                _pokemonName = _pokemonApiStore!.pokemonName;
                _textController.text = _pokemonName!;
                return TextFormField(
                  controller: _textController,
                  decoration: InputDecoration(
                    focusColor: Constants.BLUE,
                    hintText: 'Digite o nome do pokémon...',
                    hintStyle: TextStyle(
                      fontSize: 12 * sFX,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 189, 189, 189),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.close_rounded),
                      onPressed: () {
                        _textController.clear();
                      },
                    ),
                  ),
                  keyboardType: TextInputType.name,
                  textCapitalization: TextCapitalization.sentences,
                  style: TextStyle(
                    fontSize: 14 * sFX,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).accentColor,
                  ),
                  cursorColor: Theme.of(context).accentColor,
                  onChanged: (value) {
                    _textController.text = value;
                  },
                );
              }),
              Observer(
                builder: (context) {
                  if ((_pokemonApiStore!.pokemonEvolutionChain != null)) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextButton(
                          child: Text(
                            _inCaps(
                                _pokemonEvolutionChain!.chain!.species!.name!),
                            style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontSize: 12 * sFX,
                            ),
                          ),
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          onPressed: () {
                            _pokemonApiStore!.pokemonName =
                                _pokemonEvolutionChain!.chain!.species!.name!;
                            Navigator.of(context)
                                .pushNamed(AppRoutes.SEARCH_RESULTS);
                          },
                        ),
                        _pokemonEvolutionChain!.chain!.evolvesTo!.isEmpty
                            ? Text('')
                            : TextButton(
                                child: Text(
                                  _inCaps(_pokemonEvolutionChain!
                                      .chain!.evolvesTo![0].species!.name!),
                                  style: TextStyle(
                                    color: Theme.of(context).accentColor,
                                    fontSize: 12 * sFX,
                                  ),
                                ),
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                ),
                                onPressed: () {
                                  _pokemonApiStore!.pokemonName =
                                      _pokemonEvolutionChain!
                                          .chain!.evolvesTo![0].species!.name!;
                                  Navigator.of(context)
                                      .pushNamed(AppRoutes.SEARCH_RESULTS);
                                },
                              ),
                        _pokemonEvolutionChain!
                                .chain!.evolvesTo![0].evolvesTo!.isEmpty
                            ? Text('')
                            : TextButton(
                                child: Text(
                                  _inCaps(_pokemonEvolutionChain!
                                      .chain!
                                      .evolvesTo![0]
                                      .evolvesTo![0]
                                      .species!
                                      .name!),
                                  style: TextStyle(
                                    color: Theme.of(context).accentColor,
                                    fontSize: 12 * sFX,
                                  ),
                                ),
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                ),
                                onPressed: () {
                                  _pokemonApiStore!.pokemonName =
                                      _pokemonEvolutionChain!
                                          .chain!
                                          .evolvesTo![0]
                                          .evolvesTo![0]
                                          .species!
                                          .name!;
                                  Navigator.of(context)
                                      .pushNamed(AppRoutes.SEARCH_RESULTS);
                                },
                              ),
                      ],
                    );
                  } else {
                    return Padding(
                      padding: EdgeInsets.only(top: 50 * sFY),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }
                },
              ),
              Container(),
            ],
          ),
        ),
      ),
    );
  }
}
