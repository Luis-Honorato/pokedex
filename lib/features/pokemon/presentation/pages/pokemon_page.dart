import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_bloc/features/pokemon/presentation/bloc/pokemon_bloc.dart';
import 'package:teste_bloc/features/pokemon/presentation/widgets/pokemon_details.dart';
import 'package:teste_bloc/utils.dart';

class PokemonPage extends StatefulWidget {
  const PokemonPage({super.key});

  @override
  State<PokemonPage> createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage> {
  late final PokemonBloc pokemonBloc;

  @override
  void initState() {
    super.initState();
    pokemonBloc = context.read<PokemonBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PokemonBloc, PokemonState>(
        bloc: pokemonBloc,
        builder: (context, state) {
          if (state.pokemonPageStatus == RequestStatus.failure) {
            return const Center(
              child: Text('Deu ruim'),
            );
          }

          if (state.pokemonPageStatus == RequestStatus.success) {
            return PokemonDetails(pokemon: state.pokemon!);
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
