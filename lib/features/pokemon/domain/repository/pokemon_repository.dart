import 'package:dartz/dartz.dart';
import 'package:teste_bloc/features/pokemon/domain/models/pokemon.dart';
import 'package:teste_bloc/features/pokemon/domain/models/pokemon_model.dart';
import 'package:teste_bloc/utils.dart';

abstract class IPokemonRepository {
  Future<Either<Failure, List<PokemonModel>>> getPokemons();
  Future<Either<Failure, String?>> updatePokemonPhoto(String url);
  Future<Either<Failure, Pokemon>> getPokemonPage(String url);
}
