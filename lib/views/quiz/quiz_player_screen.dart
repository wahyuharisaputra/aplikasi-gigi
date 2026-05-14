import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/quiz_provider.dart';
import '../../widgets/quiz_option.dart';
import 'quiz_result_screen.dart';

class QuizPlayerScreen extends StatelessWidget {
  const QuizPlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<QuizProvider>(
          builder: (context, provider, child) {
            return Text(provider.currentQuizTitle.isNotEmpty ? provider.currentQuizTitle : 'Kuis Pengetahuan');
          }
        ),
      ),
      body: Consumer<QuizProvider>(
        builder: (context, provider, child) {
          if (provider.questions.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          if (provider.isFinished) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const QuizResultScreen()),
              );
            });
            return const SizedBox(); // Temporary empty widget before navigating
          }

          final question = provider.questions[provider.currentIndex];
          final progress = (provider.currentIndex + 1) / provider.questions.length;

          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Progress Bar
                LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.grey[200],
                  valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).colorScheme.primary),
                  minHeight: 8,
                  borderRadius: BorderRadius.circular(4),
                ),
                const SizedBox(height: 16),
                Text(
                  'Pertanyaan ${provider.currentIndex + 1}/${provider.questions.length}',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 24),
                
                // Question text
                Text(
                  question.question,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 32),

                // Options
                Expanded(
                  child: ListView.builder(
                    itemCount: question.options.length,
                    itemBuilder: (context, index) {
                      return QuizOption(
                        text: question.options[index],
                        isSelected: provider.selectedAnswerIndex == index,
                        isCorrect: question.correctAnswerIndex == index,
                        showResult: provider.isAnswerChecked,
                        onTap: () {
                          provider.checkAnswer(index);
                        },
                      );
                    },
                  ),
                ),

                // Next Button
                if (provider.isAnswerChecked)
                  ElevatedButton(
                    onPressed: () {
                      provider.nextQuestion();
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: Text(
                      provider.currentIndex == provider.questions.length - 1
                          ? 'Lihat Hasil'
                          : 'Pertanyaan Selanjutnya',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
