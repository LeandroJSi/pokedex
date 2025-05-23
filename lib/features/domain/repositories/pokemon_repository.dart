import '../entities/pokemon_details.dart';
import '../entities/pokemon_entity.dart';

abstract class PokemonRepository {
  Future<List<Pokemon>> getAllPokemon();

  Future<PokemonDetails> getPokemonDetailsByUrl(String url);
}