import 'package:go_router/go_router.dart';
import 'package:teste_bloc/features/pokemon/presentation/pages/pokemon_page.dart';
import 'package:teste_bloc/features/pokemon/presentation/pages/pokemons_list_page.dart';

final routes = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const PokemonsListPage(),
    ),
    GoRoute(
      path: '/pokemon-page',
      builder: (context, state) => const PokemonPage(),
    )
  ],
);
