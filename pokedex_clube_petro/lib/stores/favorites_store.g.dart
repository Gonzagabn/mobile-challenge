// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FavoritesStore on _FavoritesStoreBase, Store {
  final _$_favoritePokemonNamesAtom =
      Atom(name: '_FavoritesStoreBase._favoritePokemonNames');

  @override
  List<dynamic> get _favoritePokemonNames {
    _$_favoritePokemonNamesAtom.reportRead();
    return super._favoritePokemonNames;
  }

  @override
  set _favoritePokemonNames(List<dynamic> value) {
    _$_favoritePokemonNamesAtom.reportWrite(value, super._favoritePokemonNames,
        () {
      super._favoritePokemonNames = value;
    });
  }

  final _$loadFavoritePokemonNamesAsyncAction =
      AsyncAction('_FavoritesStoreBase.loadFavoritePokemonNames');

  @override
  Future<void> loadFavoritePokemonNames() {
    return _$loadFavoritePokemonNamesAsyncAction
        .run(() => super.loadFavoritePokemonNames());
  }

  final _$addFavoritePokemonNameAsyncAction =
      AsyncAction('_FavoritesStoreBase.addFavoritePokemonName');

  @override
  Future<void> addFavoritePokemonName(String name) {
    return _$addFavoritePokemonNameAsyncAction
        .run(() => super.addFavoritePokemonName(name));
  }

  final _$removeFavoritePokemonNameAsyncAction =
      AsyncAction('_FavoritesStoreBase.removeFavoritePokemonName');

  @override
  Future<void> removeFavoritePokemonName(String name) {
    return _$removeFavoritePokemonNameAsyncAction
        .run(() => super.removeFavoritePokemonName(name));
  }

  final _$_FavoritesStoreBaseActionController =
      ActionController(name: '_FavoritesStoreBase');

  @override
  String favoritePokemonNameByIndex(int index) {
    final _$actionInfo = _$_FavoritesStoreBaseActionController.startAction(
        name: '_FavoritesStoreBase.favoritePokemonNameByIndex');
    try {
      return super.favoritePokemonNameByIndex(index);
    } finally {
      _$_FavoritesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
