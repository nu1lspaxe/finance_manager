class User {
  final int id;
  final String username;
  final String email;
  final String password;
  final DateTime createdAt;
  final DateTime updatedAt;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      username: json['username'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      createdAt: DateTime.fromMicrosecondsSinceEpoch(json['created_at'] as int),
      updatedAt: DateTime.fromMicrosecondsSinceEpoch(json['updated_at'] as int),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'password': password,
    };
  }

  @override
  String toString() {
    return 'User{username: $username, email: $email}';
  }
}