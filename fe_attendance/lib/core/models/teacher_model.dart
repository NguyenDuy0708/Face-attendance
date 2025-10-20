class TeacherModel {
  final int id;
  final String name;
  final String email;

  TeacherModel({required this.id, required this.name, required this.email});

  factory TeacherModel.fromJson(Map<String, dynamic> json) => TeacherModel(
        id: json['id'] as int,
        name: json['name'] as String,
        email: json['email'] as String,
      );

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'email': email};
}
