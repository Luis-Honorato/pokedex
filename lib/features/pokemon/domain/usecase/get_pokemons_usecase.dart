import 'package:dartz/dartz.dart';
import 'package:teste_bloc/features/pokemon/domain/models/pokemon_model.dart';
import 'package:teste_bloc/features/pokemon/domain/repository/pokemon_repository.dart';
import 'package:teste_bloc/utils.dart';

class GetPokemonsUsecase {
  final IPokemonRepository repository;

  GetPokemonsUsecase(this.repository);

  Future<Either<Failure, List<PokemonModel>>> call() async {
    return await repository.getPokemons();
  }
}
