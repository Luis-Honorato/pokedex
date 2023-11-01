import 'package:teste_bloc/features/pokemon/domain/models/pokemon.dart';

class PokemonPageAdapter {
  PokemonPageAdapter._();

  static Pokemon fromJson(Map<String, dynamic> json) {
    return Pokemon(
      name: json['name'],
      imageURL: json['sprites']['front_default'],
      types: _attributesAdapter(json['types'], 'type'),
      stats: _attributesAdapter(json['stats'], 'stat'),
      moves: _attributesAdapter(json['moves'], 'move'),
    );
  }

  static List<String> _attributesAdapter(List types, String key) {
    return types.map((type) => type[key]['name'] as String? ?? '').toList();
  }
}
