import 'package:dio/dio.dart';
import 'package:teste_bloc/core/api.dart';

class PokemonDataSource {
  final Dio client;

  const PokemonDataSource(this.client);

  Future<Response> getPokemons() async {
    final response = await client.get('${Api.apiURL}/pokemon/');

    return response;
  }

  Future<Response> getPokemonPicture(String url) async {
    final response = await client.get(url);

    return response;
  }

  Future<Response> getPokemonPage(String url) async {
    final response = await client.get(url);

    return response;
  }
}
