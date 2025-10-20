class FaceResult {
  final bool matched;
  final double confidence;
  final String? message;

  FaceResult({required this.matched, required this.confidence, this.message});

  factory FaceResult.fromJson(Map<String, dynamic> json) => FaceResult(
    matched: json['matched'] as bool,
    confidence: (json['confidence'] as num).toDouble(),
    message: json['message'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'matched': matched,
    'confidence': confidence,
    'message': message,
  };
}
