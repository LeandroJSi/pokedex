import '../entities/pokemon_entity.dart';
import '../repositories/pokemon_repository.dart';

class GetAllPokemonsUseCase {
  final PokemonRepository repository;

  const GetAllPokemonsUseCase(this.repository);

  Future<List<Pokemon>> call() async {
    return await repository.getAllPokemon();
  }
}