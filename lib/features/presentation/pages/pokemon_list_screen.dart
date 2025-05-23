import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/pokemon_model.dart';
import '../cubit/pokemon_list/pokemon_list_cubit.dart';
import '../cubit/pokemon_list/pokemon_list_state.dart';
import '../widgets/pokemon_tile_widget.dart';


class PokemonListScreen extends StatefulWidget {
  const PokemonListScreen({super.key});

  @override
  State<PokemonListScreen> createState() => _PokemonListScreenState();
}

class _PokemonListScreenState extends State<PokemonListScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchTerm = '';

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _searchTerm = _searchController.text.toLowerCase();
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokédex'),
        backgroundColor: Colors.redAccent,
        elevation: 2,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Buscar Pokémon',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<PokemonListCubit, PokemonListState>(
              builder: (context, state) {
                if (state is PokemonListLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is PokemonListSuccess) {
                  final allPokemons = state.pokemons.cast<PokemonModel>();
                  final pokemons = _searchTerm.isEmpty
                      ? allPokemons
                      : allPokemons.where((p) => p.name.toLowerCase().contains(_searchTerm)).toList();

                  if (pokemons.isEmpty) {
                    return const Center(child: Text('Nenhum Pokémon encontrado'));
                  }

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        childAspectRatio: 0.8,
                      ),
                      itemCount: pokemons.length,
                      itemBuilder: (context, index) {
                        final pokemon = pokemons[index];
                        return PokemonTile(pokemon: pokemon, imageUrl: pokemon.imageUrl);
                      },
                    ),
                  );
                } else if (state is PokemonListError) {
                  return Center(child: Text('Erro: ${state.message}'));
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
