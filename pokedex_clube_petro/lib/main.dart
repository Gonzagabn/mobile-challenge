import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex_clube_petro/screens/favorites_screen.dart';
import 'package:pokedex_clube_petro/screens/home_screen.dart';
import 'package:pokedex_clube_petro/screens/pokemon_detail_screen.dart';
import 'package:pokedex_clube_petro/screens/search_results_screen.dart';
import 'package:pokedex_clube_petro/screens/search_screen.dart';
import 'package:pokedex_clube_petro/stores/favorites_store.dart';
import 'package:pokedex_clube_petro/stores/pokemon_api_store.dart';
import 'package:pokedex_clube_petro/utils/app_routes.dart';
import 'package:pokedex_clube_petro/utils/constants.dart';

void main() {
  GetIt getIt = GetIt.instance;
  getIt.registerSingleton<PokemonApiStore>(PokemonApiStore());
  getIt.registerSingleton<FavoritesStore>(FavoritesStore());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokédex',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Constants.RED,
        accentColor: Constants.BLUE,
        fontFamily: 'OpenSans',
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold,
            )),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            )),
            foregroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) return Colors.white;
              return Colors.white;
            }),
          ),
        ),
      ),
      routes: {
        AppRoutes.HOME: (ctx) => HomeScreen(),
        AppRoutes.SEARCH: (ctx) => SearchScreen(),
        AppRoutes.FAVORITES: (ctx) => FavoritesScreen(),
        AppRoutes.SEARCH_RESULTS: (ctx) => SearchResultsScreen(),
        AppRoutes.POKEMON_DETAIL: (ctx) => PokemonDetailScreen(),
      },
    );
  }
}
