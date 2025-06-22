// lib/models/clan_model.dart

class Clan {
  final String id;
  final String name;
  final List<dynamic> characters;

  Clan({required this.id, required this.name, required this.characters});

  factory Clan.fromJson(Map<String, dynamic> json) {
    return Clan(
      id: json['id'].toString(),
      name: json['name'],
      characters: json['characters'],
    );
  }
}