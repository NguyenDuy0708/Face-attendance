class AttendanceRecord {
  final int id;
  final int studentId;
  final int classId;
  final DateTime timestamp;
  final String status;
  final double? confidence;

  AttendanceRecord({
    required this.id,
    required this.studentId,
    required this.classId,
    required this.timestamp,
    required this.status,
    this.confidence,
  });

  factory AttendanceRecord.fromJson(Map<String, dynamic> json) =>
      AttendanceRecord(
        id: json['id'] as int,
        studentId: json['student_id'] as int,
        classId: json['class_id'] as int,
        timestamp: DateTime.parse(json['timestamp'] as String),
        status: json['status'] as String,
        confidence: (json['confidence'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'student_id': studentId,
    'class_id': classId,
    'timestamp': timestamp.toIso8601String(),
    'status': status,
    'confidence': confidence,
  };
}
