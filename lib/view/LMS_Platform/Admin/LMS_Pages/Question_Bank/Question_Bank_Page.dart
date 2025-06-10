import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vms_school/Link/API/LMS_APIs/Admin/Get_All_Curr_LMS.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Qustions_Bank_Controller.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/view/Both_Platform/widgets/GridAnimation.dart';

class QuestionBankPage extends StatefulWidget {
  const QuestionBankPage({super.key});

  @override
  State<QuestionBankPage> createState() => _QuestionBankPageState();
}

class _QuestionBankPageState extends State<QuestionBankPage> {
  @override
  void initState() {
    Get_LMS_Curriculm_API().Get_LMS_Curriculm();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double ScreenWidth = MediaQuery.of(context).size.width;

    int getCrossAxisCount() {
      if (ScreenWidth >= 1278) return 4;
      if (ScreenWidth >= 1070) return 3;
      if (ScreenWidth >= 760) return 2;
      return 1;
    }

    double getChildAspectRatio() {
      if (ScreenWidth >= 1070) return 1.1;
      if (ScreenWidth >= 760) return 1.1;
      if (ScreenWidth >= 838) return 1.6;
      if (ScreenWidth >= 769) return 1.5;
      if (ScreenWidth >= 690) return 2.2;
      if (ScreenWidth >= 486) return 1.2;
      return 0.8;
    }

    return GetBuilder<Qustions_Bank_Controller>(builder: (controller) {
      if (controller.isLoading) {
        return Container(
          alignment: Alignment.center,
          width: 90,
          height: 90,
          child: LoadingAnimationWidget.staggeredDotsWave(
            color: Get.theme.primaryColor,
            size: 60,
          ),
        );
      } else {
        return Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8)),
                  border: Border.all(
                      color: Theme.of(context).textTheme.titleMedium!.color!,
                      width: 0.5),
                  color: Theme.of(context).cardColor,
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 2),
                        blurRadius: 1)
                  ]),
              width: ScreenWidth >= 550 ? 250 : 150,
              height: Get.height,
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Curriculum".tr,
                    style:
                        Get.theme.textTheme.titleMedium!.copyWith(fontSize: 14),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: controller.curriculum!.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            controller.setSelectedCurriculum(index);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              color: controller.idx == index
                                  ? Get.theme.primaryColor
                                  : Colors.transparent,
                            ),
                            padding: EdgeInsets.all(10.0),
                            margin: EdgeInsets.only(
                                top: 10.0, left: 8.0, right: 8.0),
                            child: Text(
                                style: TextStyle(
                                  color: controller.idx == index
                                      ? Colors.white
                                      : Get.theme.textTheme.titleMedium!.color,
                                ),
                                overflow: TextOverflow.ellipsis,
                                Get.find<LocalizationController>()
                                            .currentLocale
                                            .value
                                            .languageCode ==
                                        'ar'
                                    ? "${controller.curriculum![index].name}"
                                    : "${controller.curriculum![index].enName}"),
                          ),
                        );
                      },
                    ),
                  ),
                ],
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
              itemCount: 7,
              itemBuilder: (context, index) {
                return HoverScaleCard(
                  child: GestureDetector(
                    onTap: () {
                      controller.qustions_Bank[index]["onTap"]();
                    },
                    child: BuildCardQuestionBank(
                      Icon: Icon(
                        controller.qustions_Bank[index]["icon"],
                        size: 45,
                        color: Get.theme.textTheme.titleMedium!.color,
                      ),
                      Uptext: controller.qustions_Bank[index]["text"],
                      subtitle: controller.qustions_Bank[index]["subTitle"],
                    ),
                  ),
                );
              },
            ))
          ],
        );
      }
    });
  }
}

class BuildCardQuestionBank extends StatelessWidget {
  BuildCardQuestionBank({
    super.key,
    required this.Icon,
    required this.Uptext,
    required this.subtitle,
  });
  Widget Icon;
  String Uptext;
  String subtitle;

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
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 15.0,
            children: [
              Icon,
              Text(
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                Uptext,
                style: Get.theme.textTheme.titleMedium!.copyWith(fontSize: 14),
              ),
              Text(
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                subtitle,
                style: Get.theme.textTheme.titleMedium!
                    .copyWith(fontSize: 12, fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
