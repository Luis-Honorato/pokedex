class PokemonPhotoAdapter {
  PokemonPhotoAdapter._();

  static String fromJson(Map<String, dynamic> json) {
    return json['sprites']['front_default'];
  }
}
