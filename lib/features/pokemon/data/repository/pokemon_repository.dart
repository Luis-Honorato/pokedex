import 'package:dartz/dartz.dart';
import 'package:teste_bloc/features/pokemon/data/adapter/pokemon_page_adapter.dart';
import 'package:teste_bloc/features/pokemon/data/adapter/pokemon_photo_adapter.dart';
import 'package:teste_bloc/features/pokemon/data/adapter/pokemons_adapter.dart';
import 'package:teste_bloc/features/pokemon/data/datasource/pokemon_datasource.dart';
import 'package:teste_bloc/features/pokemon/domain/models/pokemon.dart';
import 'package:teste_bloc/features/pokemon/domain/models/pokemon_model.dart';
import 'package:teste_bloc/features/pokemon/domain/repository/pokemon_repository.dart';
import 'package:teste_bloc/utils.dart';

class PokemonRepository implements IPokemonRepository {
  final PokemonDataSource dataSource;

  const PokemonRepository(this.dataSource);
  @override
  Future<Either<Failure, List<PokemonModel>>> getPokemons() async {
    try {
      final result = await dataSource.getPokemons();

      final body = result.data;

      final List<PokemonModel> pokemonsList = PokemonsAdapter.fromJson(body);

      List<PokemonModel> pokemonListWithPhoto = [];
      for (PokemonModel pokemon in pokemonsList) {
        final responseURL = await updatePokemonPhoto(pokemon.url);
        final imageURL = responseURL.fold(
          (failure) => null,
          (url) => url,
        );
        final PokemonModel pokemonWithPhoto = PokemonModel(
          name: pokemon.name,
          url: pokemon.url,
          imageURL: imageURL,
        );

        pokemonListWithPhoto.add(pokemonWithPhoto);
      }

      return Right(pokemonListWithPhoto);
    } catch (e) {
      return const Left(Failure('', null));
    }
  }

  @override
  Future<Either<Failure, String?>> updatePokemonPhoto(String url) async {
    try {
      final result = await dataSource.getPokemonPicture(url);

      final body = result.data;

      final imageURL = PokemonPhotoAdapter.fromJson(body);

      return Right(imageURL);
    } catch (e) {
      return const Left(Failure('', null));
    }
  }

  @override
  Future<Either<Failure, Pokemon>> getPokemonPage(String url) async {
    try {
      final result = await dataSource.getPokemonPage(url);

      final body = result.data;

      final pokemon = PokemonPageAdapter.fromJson(body);

      return Right(pokemon);
    } catch (e) {
      return const Left(Failure('', null));
    }
  }
}
