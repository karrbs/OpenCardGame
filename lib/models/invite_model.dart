import 'dart:convert';

class Invite {
  final String friendly_code;
  final DateTime? created_on;
  final DateTime? expires_on;
  Invite({
    required this.friendly_code,
    this.created_on,
    this.expires_on,
  });

  Invite copyWith({
    String? friendly_code,
    DateTime? created_on,
    DateTime? expires_on,
  }) {
    return Invite(
      friendly_code: friendly_code ?? this.friendly_code,
      created_on: created_on ?? this.created_on,
      expires_on: expires_on ?? this.expires_on,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'friendly_code': friendly_code,
      'created_on': created_on?.millisecondsSinceEpoch,
      'expires_on': expires_on?.millisecondsSinceEpoch,
    };
  }

  factory Invite.fromMap(Map<String, dynamic> map) {
    return Invite(
      friendly_code: map['friendly_code'],
      created_on: map['created_on'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['created_on'])
          : null,
      expires_on: map['expires_on'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['expires_on'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Invite.fromJson(String source) => Invite.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Invite(friendly_code: $friendly_code, created_on: $created_on, expires_on: $expires_on)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Invite &&
        other.friendly_code == friendly_code &&
        other.created_on == created_on &&
        other.expires_on == expires_on;
  }

  @override
  int get hashCode {
    return friendly_code.hashCode ^ created_on.hashCode ^ expires_on.hashCode;
  }
}
