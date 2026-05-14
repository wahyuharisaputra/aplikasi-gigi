import 'package:flutter/material.dart';
import '../models/quiz_model.dart';
import '../data/dummy_quiz.dart';

class QuizProvider with ChangeNotifier {
  List<QuizModel> _questions = [];
  int _currentIndex = 0;
  int _score = 0;
  bool _isFinished = false;
  int? _selectedAnswerIndex;
  bool _isAnswerChecked = false;
  String _currentQuizTitle = "";

  List<QuizModel> get questions => _questions;
  int get currentIndex => _currentIndex;
  int get score => _score;
  bool get isFinished => _isFinished;
  int? get selectedAnswerIndex => _selectedAnswerIndex;
  bool get isAnswerChecked => _isAnswerChecked;
  String get currentQuizTitle => _currentQuizTitle;

  void loadQuizSet(int setIndex) {
    if (setIndex >= 0 && setIndex < dummyQuizSets.length) {
      final quizSet = dummyQuizSets[setIndex];
      _currentQuizTitle = quizSet["title"];
      final rawQuestions = quizSet["questions"] as List;
      _questions = rawQuestions.map((e) => QuizModel.fromJson(e)).toList();
      _questions.shuffle(); // Randomize questions
      resetQuiz();
    }
  }

  void checkAnswer(int selectedIndex) {
    if (_isAnswerChecked) return;
    
    _selectedAnswerIndex = selectedIndex;
    _isAnswerChecked = true;

    if (selectedIndex == _questions[_currentIndex].correctAnswerIndex) {
      _score++;
    }
    notifyListeners();
  }

  void nextQuestion() {
    if (_currentIndex < _questions.length - 1) {
      _currentIndex++;
      _selectedAnswerIndex = null;
      _isAnswerChecked = false;
    } else {
      _isFinished = true;
    }
    notifyListeners();
  }

  void resetQuiz() {
    _currentIndex = 0;
    _score = 0;
    _isFinished = false;
    _selectedAnswerIndex = null;
    _isAnswerChecked = false;
    notifyListeners();
  }
}
