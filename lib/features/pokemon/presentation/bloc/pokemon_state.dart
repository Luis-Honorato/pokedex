part of 'pokemon_bloc.dart';

class PokemonState extends Equatable {
  final List<PokemonModel> pokemons;
  final Pokemon? pokemon;
  final RequestStatus pokemonStatus;
  final RequestStatus pokemonPageStatus;
  const PokemonState({
    this.pokemons = const [],
    this.pokemon,
    this.pokemonStatus = RequestStatus.inital,
    this.pokemonPageStatus = RequestStatus.inital,
  });

  PokemonState copyWith({
    List<PokemonModel>? pokemons,
    Pokemon? pokemon,
    RequestStatus? pokemonStatus,
    RequestStatus? pokemonPageStatus,
  }) {
    return PokemonState(
      pokemons: pokemons ?? this.pokemons,
      pokemon: pokemon ?? this.pokemon,
      pokemonStatus: pokemonStatus ?? this.pokemonStatus,
      pokemonPageStatus: pokemonPageStatus ?? this.pokemonPageStatus,
    );
  }

  @override
  List<Object?> get props => [
        pokemons,
        pokemon,
        pokemonStatus,
        pokemonPageStatus,
      ];
}
