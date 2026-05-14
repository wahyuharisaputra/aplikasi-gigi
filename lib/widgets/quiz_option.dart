import 'package:flutter/material.dart';

class QuizOption extends StatelessWidget {
  final String text;
  final bool isSelected;
  final bool isCorrect;
  final bool showResult;
  final VoidCallback onTap;

  const QuizOption({
    super.key,
    required this.text,
    required this.isSelected,
    required this.isCorrect,
    required this.showResult,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color getBackgroundColor() {
      if (!showResult) {
        return isSelected ? Theme.of(context).colorScheme.primary.withOpacity(0.1) : Colors.white;
      }
      if (isCorrect) {
        return Colors.green.withOpacity(0.2);
      }
      if (isSelected && !isCorrect) {
        return Colors.red.withOpacity(0.2);
      }
      return Colors.white;
    }

    Color getBorderColor() {
      if (!showResult) {
        return isSelected ? Theme.of(context).colorScheme.primary : Colors.grey.shade300;
      }
      if (isCorrect) {
        return Colors.green;
      }
      if (isSelected && !isCorrect) {
        return Colors.red;
      }
      return Colors.grey.shade300;
    }

    return GestureDetector(
      onTap: showResult ? null : onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: getBackgroundColor(),
          border: Border.all(color: getBorderColor(), width: 2),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
            if (showResult && isCorrect)
              const Icon(Icons.check_circle, color: Colors.green)
            else if (showResult && isSelected && !isCorrect)
              const Icon(Icons.cancel, color: Colors.red),
          ],
        ),
      ),
    );
  }
}
