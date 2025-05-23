import '../../domain/entities/pokemon_entity.dart';

class PokemonModel extends Pokemon {
  final String imageUrl;

  PokemonModel({
    required super.name,
    required super.url,
    required this.imageUrl,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    final name = json['name'] as String;
    final url = json['url'] as String;
    final id = url.split('/')
        .where((segment) => segment.isNotEmpty)
        .last;
    final imageUrl =
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';
    return PokemonModel(name: name, url: url, imageUrl: imageUrl);
  }
}