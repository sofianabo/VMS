import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Model/LMS_Model/Questions_Models/Quiz_Qustions_Model.dart';

class Quiz_Questions_Controller extends GetxController {
  List<AllQuestions>? allQuestions;
  int? quiz_Id;
  TextEditingController Blank = TextEditingController();
  TextEditingController Single_Choice = TextEditingController();
  TextEditingController Text_Question = TextEditingController();
  TextEditingController True_False = TextEditingController();

  bool IsLoading = true;
  Set_is_Loading(bool bool) {
    IsLoading = bool;
    update();
  }

  Fill_Data_On_Add({
    required String type,
    required String text,
  }) {
    if (type.toLowerCase() == "blank") {
      Blank.clear();
      Blank.text = text;
    } else if (type.toLowerCase() == "singlechoice") {
      Single_Choice.clear();
      Single_Choice.text = text;
    } else if (type.toLowerCase() == "text") {
      Text_Question.clear();
      Text_Question.text = text;
    } else if (type.toLowerCase() == "truefalse") {
      True_False.clear();
      True_False.text = text;
    }
    update();
  }

  void addSingleQuestionFromBank(QustionList bankQuestion) {
    // التأكد من وجود بيانات كافية
    if (bankQuestion.type == null || bankQuestion.description == null) {
      print('بيانات السؤال ناقصة');
      return;
    }

    // التحقق من وجود الـ ID مسبقاً
    bool idExists = allQuestions?.any(
          (allQ) =>
              allQ.question?.qustionList?.any(
                (q) => q.id == bankQuestion.id,
              ) ??
              false,
        ) ??
        false;

    if (idExists) {
      ErrorMessage("لا يمكن: السؤال موجود مسبقاً");
      return;
    }

    // البحث عن سؤال موجود من نفس النوع
    AllQuestions? existingQuestion = allQuestions?.firstWhere(
      (q) => q.question?.type == bankQuestion.type,
      orElse: () => AllQuestions(question: null),
    );

    if (existingQuestion?.question != null) {
      // إذا وُجد سؤال من نفس النوع
      existingQuestion!.question!.qustionList ??= [];
      existingQuestion.question!.qustionList!.add(
        QustionList(
          id: bankQuestion.id,
          fileId: bankQuestion.fileId,
          type: bankQuestion.type,
          description: bankQuestion.description,
          isEng: bankQuestion.isEng ?? 0,
          mark: bankQuestion.mark ?? 20,
          answer: bankQuestion.answer ?? [],
        ),
      );
    } else {
      // إذا لم يوجد سؤال من نفس النوع
      final newQuestion = Question(
        type: bankQuestion.type,
        name: _getQuestionNameByType(bankQuestion.type),
        fullMark: 20,
        qustionList: [
          QustionList(
            id: bankQuestion.id,
            fileId: bankQuestion.fileId,
            type: bankQuestion.type,
            description: bankQuestion.description,
            isEng: bankQuestion.isEng ?? 0,
            mark: bankQuestion.mark ?? 20,
            answer: bankQuestion.answer ?? [],
          ),
        ],
      );
      Fill_Data_On_Add(
          type: "${bankQuestion.type}",
          text: _getQuestionNameByType(bankQuestion.type));
      allQuestions ??= [];
      allQuestions!.add(AllQuestions(question: newQuestion));
    }
    update();
    print('تمت إضافة السؤال بنجاح');
  }

  String _getQuestionNameByType(String? type) {
    switch (type?.toLowerCase()) {
      case 'truefalse':
        return 'ضع اشارة صح أو خطأ لكل مما يأتي';
      case 'singlechoice':
        return 'اختر الإجابة الصحيحة في كل مما يأتي';
      case 'text':
        return 'اجب عن الأسئلة التالية';
      case 'blank':
        return 'املأ الفراغات التالية';
      default:
        return 'اكتب نص السؤال هنا';
    }
  }

  void Add_Question_From_Dialog({
    required String type,
    required String description,
    required bool isEng,
    List<Map<String, dynamic>>? answer,
  }) {
    AllQuestions? existingQuestion = allQuestions?.firstWhere(
      (q) => q.question?.type == type,
      orElse: () => AllQuestions(
          question: null), // إذا لم يوجد نرجع AllQuestions ب question فارغ
    );

    if (existingQuestion?.question != null) {
      // إذا وُجد سؤال من نفس النوع، نضيف السؤال الجديد إلى qustionList الخاص به
      existingQuestion!.question!.qustionList ??=
          []; // نتأكد أن qustionList ليس null
      existingQuestion.question!.qustionList!.add(
        QustionList(
          fileId: null,
          id: null,
          isEng: isEng == true ? 1 : 0,
          type: type,
          mark: 20,
          description: description,
          answer: answer?.map((a) => Answer.fromJson(a)).toList(),
        ),
      );
    } else {
      // إذا لم يوجد، ننشئ سؤالًا جديدًا ونضيفه إلى allQuestions
      final newQuestionList = QustionList(
        fileId: null,
        id: null,
        isEng: isEng == true ? 1 : 0,
        type: type,
        mark: 20,
        description: description,
        answer: answer?.map((a) => Answer.fromJson(a)).toList(),
      );

      final newQuestion = Question(
        type: type,
        name: _getQuestionNameByType(type),
        fullMark: 20,
        qustionList: [newQuestionList],
      );
      Fill_Data_On_Add(type: type, text: _getQuestionNameByType(type));
      allQuestions ??= []; // نتأكد أن allQuestions ليس null
      allQuestions!.add(AllQuestions(question: newQuestion));
    }
    update();
  }

  bool isEnglisPage = false;

  String getQuestionNumber(int index) {
    if (isEnglisPage) {
      return _toRomanNumeral(index + 1);
    } else {
      return _toArabicNumberText(index + 1);
    }
  }

  String _toArabicNumberText(int number) {
    switch (number) {
      case 1:
        return 'السؤال الأول';
      case 2:
        return 'السؤال الثاني';
      case 3:
        return 'السؤال الثالث';
      case 4:
        return 'السؤال الرابع';
      case 5:
        return 'السؤال الخامس';
      case 6:
        return 'السؤال السادس';
      case 7:
        return 'السؤال السابع';
      case 8:
        return 'السؤال الثامن';
      case 9:
        return 'السؤال التاسع';
      case 10:
        return 'السؤال العاشر';
      case 11:
        return 'السؤال الحادي عشر';
      case 12:
        return 'السؤال الثاني عشر';
      case 13:
        return 'السؤال الثالث عشر';
      case 14:
        return 'السؤال الرابع عشر';
      case 15:
        return 'السؤال الخامس عشر';
      case 16:
        return 'السؤال السادس عشر';
      case 17:
        return 'السؤال السابع عشر';
      case 18:
        return 'السؤال الثامن عشر';
      case 19:
        return 'السؤال التاسع عشر';
      case 20:
        return 'السؤال العشرون';
      case 21:
        return 'السؤال الحادي والعشرون';
      case 22:
        return 'السؤال الثاني والعشرون';
      case 23:
        return 'السؤال الثالث والعشرون';
      case 24:
        return 'السؤال الرابع والعشرون';
      case 25:
        return 'السؤال الخامس والعشرون';
      case 26:
        return 'السؤال السادس والعشرون';
      case 27:
        return 'السؤال السابع والعشرون';
      case 28:
        return 'السؤال الثامن والعشرون';
      case 29:
        return 'السؤال التاسع والعشرون';
      case 30:
        return 'السؤال الثلاثون';
      default:
        return 'السؤال $number';
    }
  }

  String _toRomanNumeral(int number) {
    if (number < 1 || number > 30) return '$number';

    const romanNumerals = [
      'I',
      'II',
      'III',
      'IV',
      'V',
      'VI',
      'VII',
      'VIII',
      'IX',
      'X',
      'XI',
      'XII',
      'XIII',
      'XIV',
      'XV',
      'XVI',
      'XVII',
      'XVIII',
      'XIX',
      'XX',
      'XXI',
      'XXII',
      'XXIII',
      'XXIV',
      'XXV',
      'XXVI',
      'XXVII',
      'XXVIII',
      'XXIX',
      'XXX'
    ];

    return romanNumerals[number - 1];
  }

  void SetData(Quiz_Qustions_Model model) {
    allQuestions = model.allQuestions;
    handleAllQuestions(model);
    Set_is_Loading(false);
  }

  void handleAllQuestions(Quiz_Qustions_Model model) {
    if (model.allQuestions == null || model.allQuestions!.isEmpty) {
      return;
    }

    for (var questionItem in model.allQuestions!) {
      if (questionItem.question == null) {
        continue;
      }

      final question = questionItem.question!;

      switch (question.type) {
        case "Blank":
          Blank.text = question.name ?? '';
          break;
        case "SingleChoice":
          Single_Choice.text = question.name ?? '';
          break;
        case "Text":
          Text_Question.text = question.name ?? '';
          break;
        case "TrueFalse":
          True_False.text = question.name ?? '';
          break;
        default:
          print('نوع السؤال غير معروف: ${question.type}');
      }
    }
  }
}
