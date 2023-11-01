import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_bloc/features/pokemon/domain/models/pokemon_model.dart';
import 'package:teste_bloc/features/pokemon/presentation/bloc/pokemon_bloc.dart';
import 'package:teste_bloc/features/pokemon/presentation/pages/pokemon_page.dart';

class PokemonCard extends StatelessWidget {
  final PokemonModel pokemon;
  const PokemonCard({
    super.key,
    required this.pokemon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<PokemonBloc>().add(GetPokemon(pokemon.url));
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PokemonPage()),
        );
      },
      child: Container(
        width: MediaQuery.sizeOf(context).width / 3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(color: Colors.red.withOpacity(0.2))],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 10),
                Text(
                  pokemon.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Image.network(
                  pokemon.imageURL ?? '',
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Container(
                height: 40,
                width: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color.fromARGB(255, 255, 98, 7),
                ),
                child: const Center(
                  child: Text(
                    'Mais informações',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
