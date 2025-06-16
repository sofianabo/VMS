import 'package:get/get.dart';
import 'package:vms_school/Link/Model/LMS_Model/Questions_Models/Quiz_Qustions_Model.dart';

class Quiz_Questions_Controller extends GetxController {
  List<AllQuestions>? allQuestions;

  @override
  void onInit() {
    super.onInit();

    // بيانات JSON التي تريد إضافتها
    Map<String, dynamic> jsonData = {
      "allQuestions": [
        {
          "Question": {
            "name": "اختر الإجابة الصحيحة في العلوم",
            "fullMark": 20,
            "qustionList": [
              {
                "id": 1,
                "isEng": false,
                "type": "MultiChoice",
                "mark": 5,
                "description": "ما هي عاصمة فرنسا؟",
                "answer": [
                  {"id": 1, "choise": "لندن", "trueAcss": 0},
                  {"id": 2, "choise": "باريس", "trueAcss": 1},
                  {"id": 3, "choise": "برلين", "trueAcss": 0}
                ]
              },
              {
                "id": 2,
                "isEng": false,
                "type": "MultiChoice",
                "mark": 5,
                "description": "أي من هذه الكواكب أقرب إلى الشمس؟",
                "answer": [
                  {"id": 1, "choise": "الزهرة", "trueAcss": 0},
                  {"id": 2, "choise": "عطارد", "trueAcss": 1},
                  {"id": 3, "choise": "المريخ", "trueAcss": 0}
                ]
              }
            ]
          }
        },
        {
          "Question": {
            "name": "صح أم خطأ في التاريخ",
            "fullMark": 20,
            "qustionList": [
              {
                "id": 3,
                "isEng": false,
                "type": "TrueFalse",
                "mark": 10,
                "description": "سور الصين العظيم يمكن رؤيته من القمر",
                "answer": [
                  {"id": 1, "choise": "صح", "trueAcss": 0},
                  {"id": 2, "choise": "خطأ", "trueAcss": 1}
                ]
              },
              {
                "id": 4,
                "isEng": false,
                "type": "TrueFalse",
                "mark": 10,
                "description": "توماس إديسون اخترع المصباح الكهربائي",
                "answer": [
                  {"id": 1, "choise": "صح", "trueAcss": 1},
                  {"id": 2, "choise": "خطأ", "trueAcss": 0}
                ]
              }
            ]
          }
        },
        {
          "Question": {
            "name": "املأ الفراغات في القواعد النحوية",
            "fullMark": 20,
            "qustionList": [
              {
                "id": 5,
                "isEng": false,
                "type": "Blank",
                "mark": 10,
                "description":
                    "الفاعل في الجملة 'ذهب الولد إلى المدرسة' هو [...]",
                "answer": null
              },
              {
                "id": 6,
                "isEng": false,
                "type": "Blank",
                "mark": 10,
                "description": "جمع كلمة 'كتاب' هو [...]",
                "answer": null
              }
            ]
          }
        },
        {
          "Question": {
            "name": "الأسئلة المقالية",
            "fullMark": 30,
            "qustionList": [
              {
                "id": 7,
                "isEng": false,
                "type": "fill",
                "mark": 30,
                "description": "اكتب فقرة من 5 جمل عن أهمية التعليم",
                "answer": null
              }
            ]
          }
        }
      ]
    };

    // تحويل JSON إلى نموذج البيانات
    Quiz_Qustions_Model quizModel = Quiz_Qustions_Model.fromJson(jsonData);

    // تهيئة المصفوفة إذا كانت فارغة
    allQuestions ??= [];

    // إضافة جميع الأسئلة الجديدة إلى المصفوفة
    allQuestions!.addAll(quizModel.allQuestions ?? []);
  }

  Add_Question(AllQuestions question) {
    allQuestions?.add(question);
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
}
