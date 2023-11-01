import 'package:teste_bloc/features/pokemon/domain/models/pokemon_model.dart';

class PokemonsAdapter {
  PokemonsAdapter._();

  static List<PokemonModel> fromJson(Map<String, dynamic> json) {
    final pokemonsMap = json['results'];
    final List<PokemonModel> list = [];
    for (Map<String, dynamic> pokemon in pokemonsMap) {
      list.add(PokemonModel(
        name: pokemon['name']!,
        url: pokemon['url']!,
      ));
    }
    return list;
  }
}
