import '../entities/pokemon_details.dart';
import '../repositories/pokemon_repository.dart';

class GetPokemonDetailsByUrlUseCase {
  final PokemonRepository repository;

  GetPokemonDetailsByUrlUseCase(this.repository);

  Future<PokemonDetails> call(String url) {
    return repository.getPokemonDetailsByUrl(url);
  }
}