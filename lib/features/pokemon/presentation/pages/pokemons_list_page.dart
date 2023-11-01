import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_bloc/features/pokemon/presentation/bloc/pokemon_bloc.dart';
import 'package:teste_bloc/features/pokemon/presentation/widgets/pokemon_card.dart';
import 'package:teste_bloc/utils.dart';

class PokemonsListPage extends StatefulWidget {
  const PokemonsListPage({super.key});

  @override
  State<PokemonsListPage> createState() => _PokemonsListPageState();
}

class _PokemonsListPageState extends State<PokemonsListPage> {
  @override
  void initState() {
    super.initState();
    context.read<PokemonBloc>().add(FetchPokemonsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemon'),
        centerTitle: true,
      ),
      body: BlocBuilder<PokemonBloc, PokemonState>(
        buildWhen: (previous, current) =>
            previous.pokemonStatus != current.pokemonStatus,
        builder: (context, state) {
          if (state.pokemonStatus == RequestStatus.success) {
            return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: state.pokemons.length,
                itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: PokemonCard(
                        pokemon: state.pokemons[index],
                      ),
                    ));
          }
          if (state.pokemonStatus == RequestStatus.failure) {
            return const Center(
              child: Text('Deu ruim'),
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
