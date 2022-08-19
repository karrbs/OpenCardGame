import 'dart:convert';
import 'dart:ffi';

class Card {
  final String? name;
  final String? desc;
  final int id;
  final int game_id;
  final String? graphic_url;
  final DateTime? created_at;
  final DateTime? modified_at;
  Card({
    this.name,
    this.desc,
    required this.id,
    required this.game_id,
    this.graphic_url,
    this.created_at,
    this.modified_at,
  });

  Card copyWith({
    String? name,
    String? desc,
    int? id,
    int? game_id,
    String? graphic_url,
    DateTime? created_at,
    DateTime? modified_at,
  }) {
    return Card(
      name: name ?? this.name,
      desc: desc ?? this.desc,
      id: id ?? this.id,
      game_id: game_id ?? this.game_id,
      graphic_url: graphic_url ?? this.graphic_url,
      created_at: created_at ?? this.created_at,
      modified_at: modified_at ?? this.modified_at,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'desc': desc,
      'id': id,
      'game_id': game_id,
      'graphic_url': graphic_url,
      'created_at': created_at?.millisecondsSinceEpoch,
      'modified_at': modified_at?.millisecondsSinceEpoch,
    };
  }

  factory Card.fromMap(Map<String, dynamic> map) {
    return Card(
      name: map['name'],
      desc: map['desc'],
      id: map['id']?.toInt() ?? 0,
      game_id: map['game_id']?.toInt() ?? 0,
      graphic_url: map['graphic_url'],
      created_at: map['created_at'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['created_at'])
          : null,
      modified_at: map['modified_at'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['modified_at'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Card.fromJson(String source) => Card.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Card(name: $name, desc: $desc, id: $id, game_id: $game_id, graphic_url: $graphic_url, created_at: $created_at, modified_at: $modified_at)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Card &&
        other.name == name &&
        other.desc == desc &&
        other.id == id &&
        other.game_id == game_id &&
        other.graphic_url == graphic_url &&
        other.created_at == created_at &&
        other.modified_at == modified_at;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        desc.hashCode ^
        id.hashCode ^
        game_id.hashCode ^
        graphic_url.hashCode ^
        created_at.hashCode ^
        modified_at.hashCode;
  }
}
