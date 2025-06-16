import 'package:flutter/material.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Pages/Quiz_Pages_LMS/Quiz_Question_LMS/Wedgets_Questions.dart';

class QuizQuestion extends StatelessWidget {
  const QuizQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth >= 600 ? 14.0 : 10.0;

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildButtonsRow(),
                const SizedBox(height: 20),
                buildQuizCard(context, isSmallScreen, screenWidth),
              ],
            ),
          ),
        ),
        if (screenWidth >= 850) buildSidePanel(context),
      ],
    );
  }
}
