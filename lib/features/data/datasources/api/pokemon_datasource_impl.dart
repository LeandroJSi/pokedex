import 'dart:convert';
import 'package:pokedex_app/core/http/http_client.dart';

import '../../../../core/errors/exceptions.dart';
import '../../models/pokemon_details_model.dart';
import '../pokemon_datasource.dart';


class PokemonDataSourceImpl implements PokemonDataSource {
  final HttpClient client;

  const PokemonDataSourceImpl(this.client);

  @override
  Future<Map<String, dynamic>> fetchAllPokemonRaw() async {
    final response = await client.get(
      'api/v2/pokemon?limit=1300',
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      return json.decode(response.body) as Map<String, dynamic>;
    } else {
      throw ServerException(
          'Error ${response.statusCode} fetching all pokemons');
    }
  }

  @override
  Future<PokemonDetailsModel> fetchPokemonDetailsByUrl(String url) async {
    final response = await client.get(url);
    if (response.statusCode == 200) {
      return PokemonDetailsModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
