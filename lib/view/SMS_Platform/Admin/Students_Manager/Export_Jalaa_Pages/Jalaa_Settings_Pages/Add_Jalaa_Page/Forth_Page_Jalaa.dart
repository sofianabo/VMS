import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Jalaa_For_Students/Jalaa_Page_Controller.dart';

class QuizTypeSorter extends StatelessWidget {
  const QuizTypeSorter({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Jalaa_Page_Controller>(
      builder: (controller) {
        if (controller.isQtLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        final firstSemesterList = controller.selectedFirst;
        final secondSemesterList = controller.selectedSecond;

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                // ------------------- الفصل الأول -------------------
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Flexible(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("ترتيب اختبارات الفصل الأول"),
                                if (controller.selectedFirst.isNotEmpty)
                                  IconButton(
                                    icon: const Icon(Icons.edit),
                                    onPressed: () => controller
                                        .showSelectDialog(context, 'first'),
                                  ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              if (controller.selectedFirst.isEmpty) {
                                controller.showSelectDialog(context, 'first');
                              }
                            },
                            child: Container(
                              height: 200,
                              margin: const EdgeInsets.only(top: 8),
                              decoration: _boxDecoration(context),
                              child: controller.selectedFirst.isEmpty
                                  ? Center(
                                      child: Text(
                                          "اضغط هنا لتحديد انواع الاختبارات",
                                          style:
                                              TextStyle(color: Colors.white)))
                                  : ReorderableListView.builder(
                                      buildDefaultDragHandles: false,
                                      proxyDecorator: _proxyDecorator(context),
                                      itemCount: firstSemesterList.length,
                                      itemBuilder: (context, index) {
                                        final item = firstSemesterList[index];
                                        return ListTile(
                                            key: ValueKey(item.id),
                                            title: Text(item.name ?? '',
                                                style: TextStyle(
                                                    color: Colors.white)),
                                            trailing:
                                                ReorderableDragStartListener(
                                              index: index,
                                              child: const Icon(
                                                Icons.drag_handle,
                                                color: Colors
                                                    .white, // لون زر التحريك الذي تريده
                                              ),
                                            ));
                                      },
                                      onReorder: (oldIndex, newIndex) =>
                                          controller.onReorderSemester(
                                              oldIndex, newIndex, 'first'),
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 15),
                    Flexible(
                      child: _noteBox(context, "ملاحظات الفصل الأول"),
                    ),
                  ],
                ),
                const SizedBox(height: 15),

                // ------------------- الفصل الثاني -------------------
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Flexible(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("ترتيب اختبارات الفصل الأول"),
                                  if (controller.selectedSecond.isNotEmpty)
                                    IconButton(
                                      icon: const Icon(Icons.edit),
                                      onPressed: () => controller
                                          .showSelectDialog(context, 'second'),
                                    ),
                                ],
                              )),
                          GestureDetector(
                            onTap: () {
                              if (controller.selectedSecond.isEmpty) {
                                controller.showSelectDialog(context, 'second');
                              }
                            },
                            child: Container(
                              height: 200,
                              margin: const EdgeInsets.only(top: 8),
                              decoration: _boxDecoration(context),
                              child: controller.selectedSecond.isEmpty
                                  ? Center(
                                      child: Text(
                                          "اضغط هنا لتحديد انواع الاختبارات",
                                          style:
                                              TextStyle(color: Colors.white)))
                                  : ReorderableListView.builder(
                                      proxyDecorator: _proxyDecorator(context),
                                      itemCount: secondSemesterList.length,
                                      itemBuilder: (context, index) {
                                        final item = secondSemesterList[index];
                                        return ListTile(
                                            key: ValueKey(item.id),
                                            title: Text(
                                              item.name ?? '',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            trailing:
                                                ReorderableDragStartListener(
                                              index: index,
                                              child: const Icon(
                                                Icons.drag_handle,
                                                color: Colors
                                                    .white, // لون زر التحريك الذي تريده
                                              ),
                                            ));
                                      },
                                      onReorder: (oldIndex, newIndex) =>
                                          controller.onReorderSemester(
                                              oldIndex, newIndex, 'second'),
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 15),
                    Flexible(
                      child: _noteBox(context, "ملاحظات الفصل الثاني"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  BoxDecoration _boxDecoration(BuildContext context) => BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Theme.of(context).textTheme.titleMedium!.color!,
          width: 0.5,
        ),
        color: Theme.of(context).canvasColor,
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 0.5),
            blurRadius: 0.3,
          ),
        ],
      );

  Widget Function(Widget, int, Animation<double>) _proxyDecorator(
    BuildContext context,
  ) =>
      (child, index, animation) {
        return Material(
          surfaceTintColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          color: Theme.of(context).canvasColor,
          elevation: 6,
          shadowColor: Colors.black,
          child: child,
        );
      };

  Widget _noteBox(BuildContext context, String title) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Text(
              title,
              overflow: TextOverflow.fade,
              maxLines: 1,
            ),
          ),
          Container(
            height: 200,
            margin: const EdgeInsets.only(top: 8),
            decoration: _boxDecoration(context),
          ),
        ],
      );
}
