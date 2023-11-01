import 'package:dartz/dartz.dart';
import 'package:teste_bloc/features/pokemon/domain/models/pokemon.dart';
import 'package:teste_bloc/features/pokemon/domain/repository/pokemon_repository.dart';
import 'package:teste_bloc/utils.dart';

class GetPokemonPageUsecase {
  final IPokemonRepository repository;

  GetPokemonPageUsecase(this.repository);

  Future<Either<Failure, Pokemon>> call(String url) async {
    return await repository.getPokemonPage(url);
  }
}
