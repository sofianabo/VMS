import 'package:flutter/material.dart';
import 'package:vms_school/Link/API/LMS_APIs/QuizAPI/Quiz_Questions_APIs/Get_All_Quiz_Question_API.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Pages/Quiz_Pages_LMS/Quiz_Question_LMS/Wedgets_Questions.dart';

class QuizQuestion extends StatefulWidget {
  const QuizQuestion({super.key});

  @override
  State<QuizQuestion> createState() => _QuizQuestionState();
}

class _QuizQuestionState extends State<QuizQuestion> {
  @override
  void initState() {
    Get_Quiz_Questions_API().Get_Quiz_Questions(quizId: "1");
    super.initState();
  }

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
