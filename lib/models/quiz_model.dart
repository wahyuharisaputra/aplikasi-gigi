class QuizModel {
  final String question;
  final List<String> options;
  final int correctAnswerIndex;

  QuizModel({
    required this.question,
    required this.options,
    required this.correctAnswerIndex,
  });

  factory QuizModel.fromJson(Map<String, dynamic> json) {
    return QuizModel(
      question: json['pertanyaan'],
      options: List<String>.from(json['opsi']),
      correctAnswerIndex: json['jawaban'],
    );
  }
}
