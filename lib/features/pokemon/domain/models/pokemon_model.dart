import 'package:equatable/equatable.dart';

class PokemonModel extends Equatable {
  final String name;
  final String url;
  final String? imageURL;

  const PokemonModel({
    required this.name,
    required this.url,
    this.imageURL,
  });

  PokemonModel copyWith({
    String? name,
    String? url,
    String? imageURL,
  }) {
    return PokemonModel(
      name: name ?? this.name,
      url: url ?? this.url,
      imageURL: imageURL ?? this.imageURL,
    );
  }

  @override
  List<Object?> get props => [
        name,
        url,
        imageURL,
      ];
}
