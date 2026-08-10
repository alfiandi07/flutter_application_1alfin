import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UseMoodelSQL {
  final int? id;
  final String email;
  final String password;
  final String noHp;
  final String kota;

  UseMoodelSQL({
    this.id,
    required this.email,
    required this.password,
    required this.noHp,
    required this.kota,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'password': password,
      'noHp': noHp,
      'kota': kota,
    };
  }

  factory UseMoodelSQL.fromMap(Map<String, dynamic> map) {
    return UseMoodelSQL(
      id: map['id'] != null ? map['id'] as int : null,
      email: map['email'] as String,
      password: map['password'] as String,
      noHp: map['noHp'] as String,
      kota: map['kota'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UseMoodelSQL.fromJson(String source) =>
      UseMoodelSQL.fromMap(json.decode(source) as Map<String, dynamic>);
}
