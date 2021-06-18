import 'package:mobx/mobx.dart';
import 'package:pokedex_clube_petro/utils/db_util.dart';

part 'favorites_store.g.dart';

class FavoritesStore = _FavoritesStoreBase with _$FavoritesStore;

abstract class _FavoritesStoreBase with Store {
  @observable
  List<dynamic> _favoritePokemonNames = [];

  @action
  Future<void> loadFavoritePokemonNames() async {
    final dataList = await DbUtil.getData('favorites');
    _favoritePokemonNames = dataList.map((item) => item['name']).toList();
  }

  List<String> get favoritePokemonNames {
    return [..._favoritePokemonNames];
  }

  int get favoritePokemonNamesCount {
    return _favoritePokemonNames.length;
  }

  String favoritePokemonNameByIndex(int index) {
    return _favoritePokemonNames[index];
  }

  @action
  Future<void> addFavoritePokemonName(String name) async {
    _favoritePokemonNames.add(name);
    DbUtil.insert('favorites', {
      'name': name,
    });
  }

  @action
  Future<void> removeFavoritePokemonName(String name) async {
    _favoritePokemonNames.remove(name);
    DbUtil.delete('favorites', {
      'name': name,
    });
  }
}
