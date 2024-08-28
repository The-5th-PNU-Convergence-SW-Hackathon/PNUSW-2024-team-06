class DailyModel {
  final String id;
  final String question;
  final String answer;
  final String emotionImageUrl;

  DailyModel({
    required this.id,
    required this.question,
    required this.answer,
    required this.emotionImageUrl,
  });

  DailyModel copyWith({
    String? id,
    String? question,
    String? answer,
    String? emotionImageUrl,
  }) {
    return DailyModel(
      id: id ?? this.id,
      question: question ?? this.question,
      answer: answer ?? this.answer,
      emotionImageUrl: emotionImageUrl ?? this.emotionImageUrl,
    );
  }
}
