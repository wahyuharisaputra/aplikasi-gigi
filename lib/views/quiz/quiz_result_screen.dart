import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/quiz_provider.dart';
import 'quiz_screen.dart';
import 'quiz_player_screen.dart';

class QuizResultScreen extends StatelessWidget {
  const QuizResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<QuizProvider>();
    final totalQuestions = provider.questions.length;
    final score = provider.score;
    final percentage = (score / totalQuestions) * 100;
    
    String getMotivation() {
      if (percentage == 100) return 'Sempurna! Pengetahuan kesehatan gigimu sangat luar biasa.';
      if (percentage >= 80) return 'Hebat! Pengetahuan kesehatan gigimu sangat baik.';
      if (percentage >= 60) return 'Bagus! Sedikit lagi belajar kamu pasti bisa sempurna.';
      return 'Jangan menyerah! Ayo baca lebih banyak artikel edukasi lagi.';
    }

    Color getScoreColor() {
      if (percentage >= 80) return Colors.green;
      if (percentage >= 60) return Colors.orange;
      return Colors.red;
    }

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  percentage >= 60 ? Icons.emoji_events : Icons.sentiment_dissatisfied,
                  size: 120,
                  color: getScoreColor(),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Hasil Kuis',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 150,
                      height: 150,
                      child: CircularProgressIndicator(
                        value: percentage / 100,
                        strokeWidth: 12,
                        backgroundColor: Colors.grey[200],
                        valueColor: AlwaysStoppedAnimation<Color>(getScoreColor()),
                      ),
                    ),
                    Text(
                      '${percentage.toInt()}%',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: getScoreColor(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                Text(
                  getMotivation(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          const Text('Benar', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                          Text('$score', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Column(
                        children: [
                          const Text('Salah', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                          Text('${totalQuestions - score}', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<QuizProvider>().resetQuiz();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const QuizScreen()),
                      );
                    },
                    child: const Text('Kembali ke Daftar Kuis'),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {
                      context.read<QuizProvider>().resetQuiz();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const QuizPlayerScreen()),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      side: BorderSide(color: Theme.of(context).colorScheme.primary),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: Text(
                      'Ulangi Kuis Ini',
                      style: TextStyle(color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
