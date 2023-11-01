part of 'pokemon_bloc.dart';

sealed class PokemonEvent extends Equatable {
  const PokemonEvent();

  @override
  List<Object> get props => [];
}

/// Fetch a list of pokemons from pokeAPI
class FetchPokemonsEvent extends PokemonEvent {}

/// Fetch a given pokemon by API
class GetPokemon extends PokemonEvent {
  final String url;

  const GetPokemon(this.url);
}
