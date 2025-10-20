class StudentModel {
  final int id;
  final String name;
  final String email;
  final String? avatarUrl;

  StudentModel({
    required this.id,
    required this.name,
    required this.email,
    this.avatarUrl,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) => StudentModel(
    id: json['id'] as int,
    name: json['name'] as String,
    email: json['email'] as String,
    avatarUrl: json['avatar_url'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'avatar_url': avatarUrl,
  };
}
