import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex_clube_petro/models/pokemon_detail.dart';
import 'package:pokedex_clube_petro/models/pokemon_evolution_chain.dart';
import 'package:pokedex_clube_petro/utils/constants.dart';

part 'pokemon_api_store.g.dart';

class PokemonApiStore = _PokemonApiStoreBase with _$PokemonApiStore;

abstract class _PokemonApiStoreBase with Store {
  @observable
  PokemonDetail? pokemonDetail;

  @observable
  PokemonEvolutionChain? pokemonEvolutionChain;

  @observable
  String? pokemonName;

  @observable
  List<PokemonDetail>? favoritePokemonDetailList;

  @action
  fetchPokemonDetail() {
    pokemonDetail = null;
    _loadPokemonDetails(pokemonName).then((_pokemonDetail) {
      pokemonDetail = _pokemonDetail;
    });
  }

  @action
  fetchFavoritePokemonDetailList(List<String> favoritePokemonNamesList) {
    favoritePokemonNamesList.forEach((pokemonFavoriteName) {
      _loadPokemonDetails(pokemonFavoriteName).then((_pokemonDetailResponse) {
        pokemonDetail = _pokemonDetailResponse;
      });
      favoritePokemonDetailList!.add(pokemonDetail!);
    });
  }

  @action
  fetchPokemonEvolutionChain() {
    pokemonEvolutionChain = null;
    _loadPokemonEvolutionChain(pokemonName).then((_pokemonEvolutionChain) {
      pokemonEvolutionChain = _pokemonEvolutionChain;
    });
  }

  Future<PokemonDetail?> _loadPokemonDetails(String? pokemonName) async {
    final url = '${Constants.POKEMON_DETAIL}${pokemonName!.toLowerCase()}';
    try {
      final response = await http.get(Uri.parse(url));
      var decodeJson = jsonDecode(response.body);
      return PokemonDetail.fromJson(decodeJson);
    } catch (error) {
      print('Erro ao carregar o loadPokemonDetail');
      return null;
    }
  }

  @action
  Future<PokemonEvolutionChain?> _loadPokemonEvolutionChain(
      String? pokemonName) async {
    final url = '${Constants.POKEMON_DETAIL}${pokemonName!.toLowerCase()}';
    try {
      final response = await http.get(Uri.parse(url));
      var pokemonDecodeJson = jsonDecode(response.body);
      String specieUrl = pokemonDecodeJson['species']['url'];

      final responseSpecie = await http.get(Uri.parse(specieUrl));
      var specieDecodeJson = jsonDecode(responseSpecie.body);
      String evolutionChainUrl = specieDecodeJson['evolution_chain']['url'];

      final responseEvolutionChain =
          await http.get(Uri.parse(evolutionChainUrl));
      var evolutionChainDecodeJson = jsonDecode(responseEvolutionChain.body);
      return PokemonEvolutionChain.fromJson(evolutionChainDecodeJson);
    } catch (error) {
      print('Erro ao carregar o loadPokemonEvolutionChain');
      return null;
    }
  }
}
