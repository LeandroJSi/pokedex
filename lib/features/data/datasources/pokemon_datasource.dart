import '../models/pokemon_details_model.dart';

abstract class PokemonDataSource {
  Future<Map<String, dynamic>> fetchAllPokemonRaw();

  Future<PokemonDetailsModel> fetchPokemonDetailsByUrl(String url);
}