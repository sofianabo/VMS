import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Quiz_Controller/Quiz_Questions_Controller.dart';
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Pages/Quiz_Pages_LMS/Quiz_Question_LMS/Questions_List_Wedget.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Pages/Quiz_Pages_LMS/Quiz_Question_LMS/Wedgets_Questions.dart';

class showFullQuestionsPreviewDialog extends StatefulWidget {
  showFullQuestionsPreviewDialog({super.key});
  @override
  State<showFullQuestionsPreviewDialog> createState() =>
      _showFullQuestionsPreviewDialogState();
}

class _showFullQuestionsPreviewDialogState
    extends State<showFullQuestionsPreviewDialog> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = 10.0;
    final remainingPercentage = screenWidth - 900;

    return VMSAlertDialog(
      action: [],
      contents: Container(
        width: 600,
        child: buildQuizCard(
          isSmallScreen,
          remainingPercentage,
        ),
      ),
      apptitle: "apptitle",
      subtitle: "none",
    );
  }
}

Widget buildQuizCard(double fontSize, double screenWidth) {
  return Container(
    padding: const EdgeInsets.all(15.0),
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(2)),
      border: Border.all(
        color: Get.theme.textTheme.titleMedium!.color!,
        width: 0.5,
      ),
      color: Get.theme.cardColor,
      boxShadow: const [
        BoxShadow(
          color: Colors.black26,
          offset: Offset(0, 2),
          blurRadius: 1,
        ),
      ],
    ),
    child: SingleChildScrollView(
      child: Column(
        children: [
          buildHeaderRow(fontSize),
          SizedBox(
            height: 25,
          ),
          const Divider(thickness: 1, color: Colors.black),
          GetBuilder<Quiz_Questions_Controller>(builder: (controller) {
            if (controller.IsLoading) {
              return Padding(
                padding: const EdgeInsets.only(top: 80.0),
                child: LoadingAnimationWidget.inkDrop(
                  color: Get.theme.primaryColor,
                  size: 40,
                ),
              );
            } else {
              return buildQuestionsList(
                  screenWidth: screenWidth, isSmallScreen: fontSize);
            }
          }),
        ],
      ),
    ),
  );
}
