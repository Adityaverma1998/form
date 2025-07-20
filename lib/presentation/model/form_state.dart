import 'dart:convert';

class User {
  final String name;
  final String gender;
  final String country;
  final bool termsAccepted;

  User({
    this.name = '',
    this.gender = '',
    this.country = '',
    this.termsAccepted = false,
  });

  /// CopyWith method
  User copyWith({
    String? name,
    String? gender,
    String? country,
    bool? termsAccepted,
  }) {
    return User(
      name: name ?? this.name,
      gender: gender ?? this.gender,
      country: country ?? this.country,
      termsAccepted: termsAccepted ?? this.termsAccepted,
    );
  }

  /// Create User from Map
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] ?? '',
      gender: map['gender'] ?? '',
      country: map['country'] ?? '',
      termsAccepted: map['termsAccepted'] ?? false,
    );
  }

  /// Convert User to Map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'gender': gender,
      'country': country,
      'termsAccepted': termsAccepted,
    };
  }

  /// Create User from JSON
  factory User.fromJson(String source) {
    final Map<String, dynamic> data = Map<String, dynamic>.from(jsonDecode(source));
    return User.fromMap(data);
  }

  /// Convert User to JSON
  String toJson() {
    return jsonEncode(toMap());
  }

  @override
  String toString() {
    return 'User(name: $name, gender: $gender, country: $country, termsAccepted: $termsAccepted)';
  }
}
