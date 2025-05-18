import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/GuardianController/Students_Marks_Gua_Controller.dart';
import 'package:vms_school/Link/Model/Guardian_Model/Students_Marks_Gua_Model.dart';

class GradesScreen extends StatefulWidget {
  @override
  _GradesScreenState createState() => _GradesScreenState();
}

class _GradesScreenState extends State<GradesScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final Students_Marks_Gua_Controller controller =
      Get.find<Students_Marks_Gua_Controller>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3, // 3 فصول دراسية
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('سجل الدرجات'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'The First Semester'.tr),
            Tab(text: 'The Second Semester'.tr),
            Tab(text: 'The Third Semester'.tr),
          ],
        ),
      ),
      body: GetBuilder<Students_Marks_Gua_Controller>(
        builder: (controller) {
          if (controller.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          return TabBarView(
            controller: _tabController,
            children: [
              _buildSemesterTab(controller.data?.theFirstSemester),
              _buildSemesterTab(controller.data?.theSecondSemester),
              _buildSemesterTab(controller.data?.theThirdSemester),
            ],
          );
        },
      ),
    );
  }

  Widget _buildSemesterTab(TheFirstSemester? semester) {
    if (semester == null ||
        semester.curriculum == null ||
        semester.curriculum!.isEmpty) {
      return Center(child: Text('لا توجد بيانات متاحة لهذا الفصل'));
    }

    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        children: semester.curriculum!.map((subject) {
          return SubjectCard(
            subject: subject,
          );
        }).toList(),
      ),
    );
  }
}

class SubjectCard extends StatelessWidget {
  final Curriculum subject;

  const SubjectCard({Key? key, required this.subject}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).cardColor,
      margin: EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // اسم المادة
            Text(
              subject.name ?? 'بدون اسم',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (subject.enName != null)
              Text(
                subject.enName!,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            SizedBox(height: 16),

            // جدول العلامات
            if (subject.mark != null && subject.mark!.isNotEmpty)
              SubjectMarksTable(marks: subject.mark!),
          ],
        ),
      ),
    );
  }
}

class SubjectMarksTable extends StatelessWidget {
  final List<Mark> marks;

  const SubjectMarksTable({Key? key, required this.marks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(
        color: Colors.grey[300]!,
        borderRadius: BorderRadius.circular(8),
      ),
      columnWidths: {
        0: FlexColumnWidth(1),
        1: FlexColumnWidth(1),
        2: FlexColumnWidth(1),
      },
      children: [
        // رأس الجدول
        TableRow(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColorLight,
          ),
          children: [
            _buildHeaderCell('Quiz Type'.tr),
            _buildHeaderCell('Degree'.tr),
            _buildHeaderCell('State'.tr),
          ],
        ),

        // محتوى الجدول
        ...marks.map((mark) {
          final markValue = mark.mark ?? 0;
          final passingMark = mark.passingMark ?? 0;
          final isRate = mark.isRate!;
          final isPassing = markValue >= passingMark && passingMark > 0;

          return TableRow(
            decoration: BoxDecoration(
              color: isRate
                  ? isPassing
                      ? Colors.green[50]
                      : Colors.red[50]
                  : Theme.of(context).cardColor,
            ),
            children: [
              _buildContentCell(mark.name ?? ''),
              _buildContentCell(isRate ? '$markValue' : "Not yet evaluated".tr),
              _buildStatusCell(isPassing, isRate),
            ],
          );
        }).toList(),
      ],
    );
  }

  Widget _buildHeaderCell(String text) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildContentCell(String text) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Center(
        child: Text(text),
      ),
    );
  }

  Widget _buildStatusCell(bool isPassing, bool isRate) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Center(
        child: isRate
            ? Text(
                isPassing ? 'ناجح' : 'راسب',
                style: TextStyle(
                  color: isPassing ? Colors.green : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              )
            : Text(
                "Not yet evaluated".tr,
              ),
      ),
    );
  }
}
