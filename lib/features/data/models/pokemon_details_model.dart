import '../../domain/entities/pokemon_details.dart';

class PokemonDetailsModel {
  final int id;
  final int height;
  final int weight;
  final List<String> types;
  final String imageUrl;

  const PokemonDetailsModel({
    required this.id,
    required this.height,
    required this.weight,
    required this.types,
    required this.imageUrl,
  });

  factory PokemonDetailsModel.fromJson(Map<String, dynamic> json) {
    return PokemonDetailsModel(
      id: json['id'],
      height: json['height'],
      weight: json['weight'],
      types: (json['types'] as List)
          .map((e) => e['type']['name'] as String)
          .toList(),
      imageUrl: json['sprites']['front_default'],
    );
  }

  PokemonDetails toEntity() {
    return PokemonDetails(
      id: id,
      height: height,
      weight: weight,
      types: types,
      imageUrl: imageUrl,
    );
  }
}