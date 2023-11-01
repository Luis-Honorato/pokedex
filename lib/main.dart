import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_bloc/features/pokemon/data/datasource/pokemon_datasource.dart';
import 'package:teste_bloc/features/pokemon/data/repository/pokemon_repository.dart';
import 'package:teste_bloc/features/pokemon/domain/usecase/get_pokemon_page_usecase.dart';
import 'package:teste_bloc/features/pokemon/domain/usecase/get_pokemons_usecase.dart';
import 'package:teste_bloc/features/pokemon/presentation/bloc/pokemon_bloc.dart';
import 'package:teste_bloc/routes.dart';

void main() {
  runApp(BlocProvider<PokemonBloc>(
    create: (context) => PokemonBloc(
      GetPokemonsUsecase(
        PokemonRepository(
          PokemonDataSource(Dio()),
        ),
      ),
      GetPokemonPageUsecase(
        PokemonRepository(
          PokemonDataSource(Dio()),
        ),
      ),
    ),
    child: MaterialApp.router(
      theme: ThemeData(useMaterial3: true),
      routerConfig: routes,
      debugShowCheckedModeBanner: false,
    ),
  ));
}
