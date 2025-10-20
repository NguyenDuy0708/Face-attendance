class ClassModel {
  final int id;
  final String title;
  final String schedule;

  ClassModel({required this.id, required this.title, required this.schedule});

  factory ClassModel.fromJson(Map<String, dynamic> json) => ClassModel(
        id: json['id'] as int,
        title: json['title'] as String,
        schedule: json['schedule'] as String,
      );

  Map<String, dynamic> toJson() => {'id': id, 'title': title, 'schedule': schedule};
}
