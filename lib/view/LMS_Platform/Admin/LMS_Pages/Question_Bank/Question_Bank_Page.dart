import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/view/Both_Platform/widgets/GridAnimation.dart';

class QuestionBankPage extends StatefulWidget {
  const QuestionBankPage({super.key});

  @override
  State<QuestionBankPage> createState() => _QuestionBankPageState();
}

class _QuestionBankPageState extends State<QuestionBankPage> {
  @override
  Widget build(BuildContext context) {
    double ScreenWidth = MediaQuery.of(context).size.width;

    int getCrossAxisCount() {
      if (ScreenWidth >= 1278) return 4;
      if (ScreenWidth >= 1070) return 3;
      if (ScreenWidth >= 950) return 2;
      return 1;
    }

    double getChildAspectRatio() {
      if (ScreenWidth >= 1070) return 1.1;
      if (ScreenWidth >= 950) return 1.1;
      if (ScreenWidth >= 838) return 1.6;
      if (ScreenWidth >= 769) return 1.5;
      if (ScreenWidth >= 613) return 2.2;
      if (ScreenWidth >= 486) return 1.7;
      return 1.2;
    }

    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
              border: Border.all(
                  color: Theme.of(context).textTheme.titleMedium!.color!,
                  width: 0.5),
              color: Theme.of(context).cardColor,
              boxShadow: const [
                BoxShadow(
                    color: Colors.black26, offset: Offset(0, 2), blurRadius: 1)
              ]),
          width: ScreenWidth >= 600 ? 250 : 150,
          height: Get.height,
          child: Column(
            children: [],
          ),
        ),
        Expanded(
            child: GridView.builder(
          padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: getCrossAxisCount(),
              crossAxisSpacing: 20.0,
              mainAxisSpacing: 20.0,
              childAspectRatio: getChildAspectRatio()),
          itemCount: 5,
          itemBuilder: (context, index) {
            return HoverScaleCard(
              child: GestureDetector(
                onTap: () {},
                child: BuildCardQuestionBank(),
              ),
            );
          },
        ))
      ],
    );
  }
}

class BuildCardQuestionBank extends StatelessWidget {
  const BuildCardQuestionBank({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.all(
              color: Theme.of(context).textTheme.titleMedium!.color!,
              width: 0.5),
          color: Theme.of(context).cardColor,
          boxShadow: const [
            BoxShadow(
                color: Colors.black26, offset: Offset(0, 2), blurRadius: 1)
          ]),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 10.0,
          children: [
            Icon(Icons.check),
            Text("صح او خطأ"),
            Text("أسئلة بسيطة تتطلب اختيار صح أو"),
          ],
        ),
      ),
    );
  }
}
