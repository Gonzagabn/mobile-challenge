import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex_clube_petro/components/pokedex_led.dart';
import 'package:pokedex_clube_petro/components/shadow_container.dart';
import 'package:pokedex_clube_petro/stores/favorites_store.dart';
import 'package:pokedex_clube_petro/stores/pokemon_api_store.dart';
import 'package:pokedex_clube_petro/utils/app_routes.dart';
import 'package:pokedex_clube_petro/utils/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PokemonApiStore? _pokemonApiStore;
  FavoritesStore? _favoritesStore;

  bool _isSearchButtonEnabled = false;
  TextEditingController _textController = TextEditingController();

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
    final themeAccentColor = Theme.of(context).accentColor;

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 48 * sFY),
              Container(
                alignment: Alignment.center,
                height: 85 * sFY,
                width: availableWidth,
                child: Padding(
                  padding: EdgeInsets.only(left: 65 * sFX, right: 64 * sFX),
                  child: Image.asset(
                    'assets/images/pokemon-logo.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              SizedBox(height: 16 * sFY),
              Container(
                height: 14 * sFY,
                child: Padding(
                  padding: EdgeInsets.only(right: 24 * sFX),
                  child: Row(
                    children: <Widget>[
                      Spacer(),
                      PokedexLed(
                        color: Constants.RED_LED,
                        sFX: sFX,
                        sFY: sFY,
                        left: 5,
                        top: 3,
                        right: 5,
                        bottom: 7,
                      ),
                      SizedBox(width: 8 * sFX),
                      PokedexLed(
                        color: Constants.YELLOW_LED,
                        sFX: sFX,
                        sFY: sFY,
                        left: 6,
                        top: 3,
                        right: 4,
                        bottom: 7,
                      ),
                      SizedBox(width: 8 * sFX),
                      PokedexLed(
                        color: Constants.GREEN_LED,
                        sFX: sFX,
                        sFY: sFY,
                        left: 7,
                        top: 3,
                        right: 3,
                        bottom: 7,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16 * sFY),
              Container(
                height: 437 * sFY,
                width: availableWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0 * sFY),
                  color: Colors.white,
                ),
                margin: EdgeInsets.only(
                    left: 24 * sFX, right: 24 * sFX, bottom: 24 * sFY),
                child: Container(
                  margin: EdgeInsets.only(
                      left: 24 * (2 / 39), right: 24 * (2 / 39)),
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 16 * sFX,
                      right: 16 * sFX,
                      top: 46 * sFY,
                      bottom: 27 * sFY,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          'Conheça a Pokédex',
                          style: TextStyle(
                            fontSize: 22 * sFX,
                            fontWeight: FontWeight.bold,
                            color: themeAccentColor,
                          ),
                        ),
                        SizedBox(height: 8 * sFY),
                        Text(
                          'Utilize a pokédex para encontrar mais informações sobre os seus pokémons.',
                          style: TextStyle(
                            fontSize: 16 * sFX,
                            fontWeight: FontWeight.w300,
                            color: themeAccentColor,
                          ),
                        ),
                        SizedBox(height: 40 * sFY),
                        ShadowContainer(
                          sFY: sFY,
                          child: Row(
                            children: <Widget>[
                              SizedBox(
                                width: 16 * sFY,
                              ),
                              Expanded(
                                child: TextFormField(
                                  controller: _textController,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Digite o nome do pokémon...',
                                    hintStyle: TextStyle(
                                      fontSize: 12 * sFX,
                                      color: Constants.LIGHT_GREY,
                                    ),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                  ),
                                  keyboardType: TextInputType.name,
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  style: TextStyle(
                                    fontSize: 12 * sFX,
                                    color: Constants.DARK_GREY,
                                  ),
                                  cursorColor: Constants.DARK_GREY,
                                  onChanged: (value) {
                                    bool isEmpty = value.trim().isEmpty;
                                    if (!isEmpty) {
                                      _isSearchButtonEnabled = true;
                                    } else {
                                      _isSearchButtonEnabled = false;
                                    }
                                    _pokemonApiStore!.pokemonName =
                                        _textController.text;
                                  },
                                ),
                              ),
                              InkWell(
                                onTap: _isSearchButtonEnabled
                                    ? () {
                                        _pokemonApiStore!.pokemonName =
                                            _textController.text;
                                        Navigator.of(context).pushNamed(
                                            AppRoutes.SEARCH_RESULTS);
                                      }
                                    : null,
                                child: Container(
                                  height: 24 * sFY,
                                  width: 24 * sFY,
                                  child: SvgPicture.asset(
                                    'assets/icons/search-icon.svg',
                                    color: _isSearchButtonEnabled
                                        ? Theme.of(context).accentColor
                                        : Constants.LIGHT_GREY,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 8 * sFX,
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        ShadowContainer(
                          sFY: sFY,
                          child: ElevatedButton(
                            child: Text('PESQUISAR',
                                style: TextStyle(fontSize: 14 * sFX)),
                            style: ElevatedButton.styleFrom(
                              primary: _isSearchButtonEnabled
                                  ? themeAccentColor
                                  : Constants.LIGHT_GREY,
                            ),
                            onPressed: _isSearchButtonEnabled
                                ? () {
                                    _pokemonApiStore!.pokemonName =
                                        _textController.text;
                                    Navigator.of(context)
                                        .pushNamed(AppRoutes.SEARCH);
                                  }
                                : null,
                          ),
                        ),
                        SizedBox(height: 32 * sFY),
                        ShadowContainer(
                          sFY: sFY,
                          child: ElevatedButton(
                            child: Text('VER FAVORITOS',
                                style: TextStyle(fontSize: 14 * sFX)),
                            style: ElevatedButton.styleFrom(
                              primary: Constants.YELLOW_BTN,
                              onPrimary: themeAccentColor,
                            ),
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(AppRoutes.FAVORITES);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
