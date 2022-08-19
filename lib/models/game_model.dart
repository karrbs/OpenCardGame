import 'dart:convert';

import 'package:flutter/foundation.dart';

class GameModel {
  final int? id;
  final String? user_profile_id;
  final String? name;
  final String? desc;
  final bool? is_nsfw;
  final List<String>? cards;
  final List<String>? game_rules;
  final DateTime? created_at;
  final DateTime? modified_at;
  final String? avatar_url;
  GameModel({
    this.id,
    required this.user_profile_id,
    required this.name,
    this.desc,
    required this.is_nsfw,
    this.cards,
    this.game_rules,
    this.created_at,
    this.modified_at,
    this.avatar_url,
  });

  GameModel copyWith({
    int? id,
    String? user_profile_id,
    String? name,
    String? desc,
    bool? is_nsfw,
    List<String>? cards,
    List<String>? game_rules,
    DateTime? created_at,
    DateTime? modified_at,
    String? avatar_url,
  }) {
    return GameModel(
      id: id ?? this.id,
      user_profile_id: user_profile_id ?? this.user_profile_id,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      is_nsfw: is_nsfw ?? this.is_nsfw,
      cards: cards ?? this.cards,
      game_rules: game_rules ?? this.game_rules,
      created_at: created_at ?? this.created_at,
      modified_at: modified_at ?? this.modified_at,
      avatar_url: avatar_url ?? this.avatar_url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user_profile_id': user_profile_id,
      'name': name,
      'desc': desc,
      'is_nsfw': is_nsfw,
      'cards': cards,
      'game_rules': game_rules,
      'created_at': created_at?.millisecondsSinceEpoch,
      'modified_at': modified_at?.millisecondsSinceEpoch,
      'avatar_url': avatar_url,
    };
  }

  factory GameModel.fromMap(Map<String, dynamic> map) {
    return GameModel(
      id: map['id']?.toInt(),
      user_profile_id: map['user_profile_id'],
      name: map['name'],
      desc: map['desc'],
      is_nsfw: map['is_nsfw'],
      cards: List<String>.from(map['cards']),
      game_rules: List<String>.from(map['game_rules']),
      created_at: map['created_at'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['created_at'])
          : null,
      modified_at: map['modified_at'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['modified_at'])
          : null,
      avatar_url: map['avatar_url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory GameModel.fromJson(String source) =>
      GameModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'GameModel(id: $id, user_profile_id: $user_profile_id, name: $name, desc: $desc, is_nsfw: $is_nsfw, cards: $cards, game_rules: $game_rules, created_at: $created_at, modified_at: $modified_at, avatar_url: $avatar_url)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GameModel &&
        other.id == id &&
        other.user_profile_id == user_profile_id &&
        other.name == name &&
        other.desc == desc &&
        other.is_nsfw == is_nsfw &&
        listEquals(other.cards, cards) &&
        listEquals(other.game_rules, game_rules) &&
        other.created_at == created_at &&
        other.modified_at == modified_at &&
        other.avatar_url == avatar_url;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        user_profile_id.hashCode ^
        name.hashCode ^
        desc.hashCode ^
        is_nsfw.hashCode ^
        cards.hashCode ^
        game_rules.hashCode ^
        created_at.hashCode ^
        modified_at.hashCode ^
        avatar_url.hashCode;
  }
}
