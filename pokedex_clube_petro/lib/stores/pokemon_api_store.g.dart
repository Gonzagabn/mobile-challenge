// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_api_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokemonApiStore on _PokemonApiStoreBase, Store {
  final _$pokemonDetailAtom = Atom(name: '_PokemonApiStoreBase.pokemonDetail');

  @override
  PokemonDetail? get pokemonDetail {
    _$pokemonDetailAtom.reportRead();
    return super.pokemonDetail;
  }

  @override
  set pokemonDetail(PokemonDetail? value) {
    _$pokemonDetailAtom.reportWrite(value, super.pokemonDetail, () {
      super.pokemonDetail = value;
    });
  }

  final _$pokemonEvolutionChainAtom =
      Atom(name: '_PokemonApiStoreBase.pokemonEvolutionChain');

  @override
  PokemonEvolutionChain? get pokemonEvolutionChain {
    _$pokemonEvolutionChainAtom.reportRead();
    return super.pokemonEvolutionChain;
  }

  @override
  set pokemonEvolutionChain(PokemonEvolutionChain? value) {
    _$pokemonEvolutionChainAtom.reportWrite(value, super.pokemonEvolutionChain,
        () {
      super.pokemonEvolutionChain = value;
    });
  }

  final _$pokemonNameAtom = Atom(name: '_PokemonApiStoreBase.pokemonName');

  @override
  String? get pokemonName {
    _$pokemonNameAtom.reportRead();
    return super.pokemonName;
  }

  @override
  set pokemonName(String? value) {
    _$pokemonNameAtom.reportWrite(value, super.pokemonName, () {
      super.pokemonName = value;
    });
  }

  final _$favoritePokemonDetailListAtom =
      Atom(name: '_PokemonApiStoreBase.favoritePokemonDetailList');

  @override
  List<PokemonDetail>? get favoritePokemonDetailList {
    _$favoritePokemonDetailListAtom.reportRead();
    return super.favoritePokemonDetailList;
  }

  @override
  set favoritePokemonDetailList(List<PokemonDetail>? value) {
    _$favoritePokemonDetailListAtom
        .reportWrite(value, super.favoritePokemonDetailList, () {
      super.favoritePokemonDetailList = value;
    });
  }

  final _$_loadPokemonEvolutionChainAsyncAction =
      AsyncAction('_PokemonApiStoreBase._loadPokemonEvolutionChain');

  @override
  Future<PokemonEvolutionChain?> _loadPokemonEvolutionChain(
      String? pokemonName) {
    return _$_loadPokemonEvolutionChainAsyncAction
        .run(() => super._loadPokemonEvolutionChain(pokemonName));
  }

  final _$_PokemonApiStoreBaseActionController =
      ActionController(name: '_PokemonApiStoreBase');

  @override
  dynamic fetchPokemonDetail() {
    final _$actionInfo = _$_PokemonApiStoreBaseActionController.startAction(
        name: '_PokemonApiStoreBase.fetchPokemonDetail');
    try {
      return super.fetchPokemonDetail();
    } finally {
      _$_PokemonApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic fetchFavoritePokemonDetailList(
      List<String> favoritePokemonNamesList) {
    final _$actionInfo = _$_PokemonApiStoreBaseActionController.startAction(
        name: '_PokemonApiStoreBase.fetchFavoritePokemonDetailList');
    try {
      return super.fetchFavoritePokemonDetailList(favoritePokemonNamesList);
    } finally {
      _$_PokemonApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic fetchPokemonEvolutionChain() {
    final _$actionInfo = _$_PokemonApiStoreBaseActionController.startAction(
        name: '_PokemonApiStoreBase.fetchPokemonEvolutionChain');
    try {
      return super.fetchPokemonEvolutionChain();
    } finally {
      _$_PokemonApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pokemonDetail: ${pokemonDetail},
pokemonEvolutionChain: ${pokemonEvolutionChain},
pokemonName: ${pokemonName},
favoritePokemonDetailList: ${favoritePokemonDetailList}
    ''';
  }
}
