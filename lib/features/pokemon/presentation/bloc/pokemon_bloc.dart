import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:teste_bloc/features/pokemon/domain/models/pokemon.dart';
import 'package:teste_bloc/features/pokemon/domain/models/pokemon_model.dart';
import 'package:teste_bloc/features/pokemon/domain/usecase/get_pokemon_page_usecase.dart';
import 'package:teste_bloc/features/pokemon/domain/usecase/get_pokemons_usecase.dart';
import 'package:teste_bloc/utils.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final GetPokemonsUsecase getPokemonsUsecase;
  final GetPokemonPageUsecase getPokemonPageUsecase;
  PokemonBloc(
    this.getPokemonsUsecase,
    this.getPokemonPageUsecase,
  ) : super(PokemonState()) {
    on<FetchPokemonsEvent>((event, emit) async {
      emit(state.copyWith(
        pokemonStatus: RequestStatus.loading,
      ));

      final result = await getPokemonsUsecase();

      result.fold(
        (failure) {
          emit(state.copyWith(
            pokemonStatus: RequestStatus.failure,
          ));
        },
        (pokemons) {
          emit(state.copyWith(
            pokemonStatus: RequestStatus.success,
            pokemons: pokemons,
          ));
        },
      );
    });

    on<GetPokemon>(
      (event, emit) async {
        emit(state.copyWith(
          pokemonPageStatus: RequestStatus.loading,
        ));

        final result = await getPokemonPageUsecase(event.url);

        result.fold(
          (failure) {
            emit(state.copyWith(
              pokemonPageStatus: RequestStatus.failure,
            ));
          },
          (pokemon) {
            emit(state.copyWith(
              pokemonPageStatus: RequestStatus.success,
              pokemon: pokemon,
            ));
          },
        );
      },
    );
  }
}
