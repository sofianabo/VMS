import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/Students_Models/Jalaa_Model.dart';

class Jalaa_Controller extends GetxController {
  @override
  void onInit() {
    super.onInit();
    loadInitialData();
  }

  void loadInitialData() {
    // البيانات بشكل Map لتتوافق مع fromJson
    Map<String, dynamic> jsonData = {
      "rebort": {
        "studentsInfo": {
          "tasalsol": 12,
          "studentsFullName": "\u0644\u064a\u062b \u0639\u0632\u0627\u0645",
          "fatherName": "\u0647\u064a\u062b\u0645",
          "motherName": "\u0645\u0627\u062c\u062f\u0647",
          "division": "\u0645\u0627\u062c\u062f\u0647",
          "Birthdate": "13\/1\/2003",
          "language":
              "\u0627\u0644\u0627\u0646\u0643\u0644\u064a\u0632\u064a\u0629",
          "raqSejel": 150,
          "seassion": "2023\/2024"
        },
        "mainCurriculum": [
          {
            "curriculumName": "بببب",
            "insideCurr": [
              {
                "cName":
                    "\u0627\u0644\u0644\u063a\u0629 \u0627\u0644\u0627\u0646\u0643\u0644\u064a\u0632\u064a\u0629",
                "maxMark": 200,
                "passingMark": 100,
                "Marks": [120, 80, 120, 80]
              }
            ]
          },
          {
            "curriculumName":
                "\u0627\u0644\u0644\u063a\u0629 \u0627\u0644\u0627\u0646\u0643\u0644\u064a\u0632\u064a\u0629",
            "insideCurr": [
              {
                "cName":
                    "\u0627\u0644\u0644\u063a\u0629 \u0627\u0644\u0627\u0646\u0643\u0644\u064a\u0632\u064a\u0629",
                "maxMark": 200,
                "passingMark": 100,
                "Marks": [120, 80, 120, 80]
              }
            ]
          },
          {
            "curriculumName":
                "\u0627\u0644\u0644\u063a\u0629 \u0627\u0644\u0627\u0646\u0643\u0644\u064a\u0632\u064a\u0629",
            "insideCurr": [
              {
                "cName": "سييس",
                "maxMark": 200,
                "passingMark": 100,
                "Marks": [20, 20, 20, 5]
              }
            ]
          },
          {
            "curriculumName":
                "\u0627\u0644\u0644\u063a\u0629 \u0627\u0644\u0627\u0646\u0643\u0644\u064a\u0632\u064a\u0629",
            "insideCurr": [
              {
                "cName":
                    "\u0627\u0644\u0644\u063a\u0629 \u0627\u0644\u0627\u0646\u0643\u0644\u064a\u0632\u064a\u0629",
                "maxMark": 200,
                "passingMark": 100,
                "Marks": [120, 80, 120, 80]
              }
            ]
          },
          {
            "curriculumName":
                "\u0627\u0644\u0644\u063a\u0629 \u0627\u0644\u0627\u0646\u0643\u0644\u064a\u0632\u064a\u0629",
            "insideCurr": [
              {
                "cName":
                    "\u0627\u0644\u0644\u063a\u0629 \u0627\u0644\u0627\u0646\u0643\u0644\u064a\u0632\u064a\u0629",
                "maxMark": 200,
                "passingMark": 100,
                "Marks": [120, 80, 120, 80]
              }
            ]
          },
          {
            "curriculumName":
                "\u0627\u0644\u0644\u063a\u0629 \u0627\u0644\u0627\u0646\u0643\u0644\u064a\u0632\u064a\u0629",
            "insideCurr": [
              {
                "cName":
                    "\u0627\u0644\u0644\u063a\u0629 \u0627\u0644\u0627\u0646\u0643\u0644\u064a\u0632\u064a\u0629",
                "maxMark": 200,
                "passingMark": 100,
                "Marks": [120, 80, 120, 80]
              }
            ]
          },
          {
            "curriculumName":
                "\u0627\u0644\u0644\u063a\u0629 \u0627\u0644\u0627\u0646\u0643\u0644\u064a\u0632\u064a\u0629",
            "insideCurr": [
              {
                "cName":
                    "\u0627\u0644\u0644\u063a\u0629 \u0627\u0644\u0627\u0646\u0643\u0644\u064a\u0632\u064a\u0629",
                "maxMark": 200,
                "passingMark": 100,
                "Marks": [120, 80, 120, 80]
              }
            ]
          },
          {
            "curriculumName":
                "\u0627\u0644\u0644\u063a\u0629 \u0627\u0644\u0627\u0646\u0643\u0644\u064a\u0632\u064a\u0629",
            "insideCurr": [
              {
                "cName":
                    "\u0627\u0644\u0644\u063a\u0629 \u0627\u0644\u0627\u0646\u0643\u0644\u064a\u0632\u064a\u0629",
                "maxMark": 200,
                "passingMark": 100,
                "Marks": [120, 80, 120, 80]
              }
            ]
          },
          {
            "curriculumName":
                "\u0627\u0644\u0644\u063a\u0629 \u0627\u0644\u0627\u0646\u0643\u0644\u064a\u0632\u064a\u0629",
            "insideCurr": [
              {
                "cName":
                    "\u0627\u0644\u0644\u063a\u0629 \u0627\u0644\u0627\u0646\u0643\u0644\u064a\u0632\u064a\u0629",
                "maxMark": 200,
                "passingMark": 100,
                "Marks": [120, 80, 120, 80]
              }
            ]
          },
          {
            "curriculumName":
                "\u0627\u0644\u0644\u063a\u0629 \u0627\u0644\u0627\u0646\u0643\u0644\u064a\u0632\u064a\u0629",
            "insideCurr": [
              {
                "cName":
                    "\u0627\u0644\u0644\u063a\u0629 \u0627\u0644\u0627\u0646\u0643\u0644\u064a\u0632\u064a\u0629",
                "maxMark": 200,
                "passingMark": 100,
                "Marks": [120, 80, 120, 80]
              }
            ]
          },
        ],
        "downCurriculum": [],
        "attendance": {
          "firstSemester": {
            "studentAttendance": 0,
            "mobarar_Attendance": 0,
            "not_Mobarar_Attendance": 0,
            "dawam_File": 0
          },
          "secondSemester": {
            "studentAttendance": 0,
            "mobarar_Attendance": 0,
            "not_Mobarar_Attendance": 0,
            "dawam_File": 0
          }
        },
        "Molahdat": {
          "firstSemester": null,
          "secondSemester": null,
          "manager": null,
          "schoolmanager": "علاء حمزة"
        },
        "solok": [200, 200],
        "shId": 1
      }
    };

    // تحويل البيانات باستخدام fromJson
    rebortCard = Rebort_Card.fromJson(jsonData);
    update();
  }

  Rebort_Card? rebortCard;

  void setRebort(Rebort rebort) {
    if (rebortCard == null) {
      rebortCard = Rebort_Card(rebort: rebort);
    } else {
      rebortCard!.rebort = rebort;
    }
    update();
  }
}

//.........................................................

final units = [
  '',
  'وَاحِدٌ',
  'اِثْنَانِ',
  'ثَلَاثَةٌ',
  'أَرْبَعَةٌ',
  'خَمْسَةٌ',
  'سِتَّةٌ',
  'سَبْعَةٌ',
  'ثَمَانِيَةٌ',
  'تِسْعَةٌ'
];

final tens = [
  '',
  'عَشَرَةٌ',
  'عِشْرُونَ',
  'ثَلَاثُونَ',
  'أَرْبَعُونَ',
  'خَمْسُونَ',
  'سِتُّونَ',
  'سَبْعُونَ',
  'ثَمَانُونَ',
  'تِسْعُونَ'
];

final teens = [
  'أَحَدَ عَشَرَ',
  'اِثْنَا عَشَرَ',
  'ثَلَاثَةَ عَشَرَ',
  'أَرْبَعَةَ عَشَرَ',
  'خَمْسَةَ عَشَرَ',
  'سِتَّةَ عَشَرَ',
  'سَبْعَةَ عَشَرَ',
  'ثَمَانِيَةَ عَشَرَ',
  'تِسْعَةَ عَشَرَ'
];

final hundreds = [
  '',
  'مِئَةٌ',
  'مِئَتَانِ',
  'ثَلَاثُمِائَةٍ',
  'أَرْبَعُمِائَةٍ',
  'خَمْسُمِائَةٍ',
  'سِتُّمِائَةٍ',
  'سَبْعُمِائَةٍ',
  'ثَمَانُمِائَةٍ',
  'تِسْعُمِائَةٍ'
];

// يجب تعريف هذه أولًا
String part(int n) {
  if (n == 0) return '';
  if (n < 10) return units[n];
  if (n == 10) return tens[1];
  if (n < 20) return teens[n - 11];
  if (n < 100) {
    int u = n % 10;
    int t = n ~/ 10;
    return (u == 0) ? tens[t] : '${units[u]} و${tens[t]}';
  }
  if (n < 1000) {
    int h = n ~/ 100;
    int rest = n % 100;
    if (rest == 0) return hundreds[h];
    return '${hundreds[h]} و${part(rest)}';
  }
  if (n < 10000) {
    int th = n ~/ 1000;
    int rest = n % 1000;
    String thWord = getThousands(th);
    if (rest == 0) return thWord;
    return '$thWord و${part(rest)}';
  }
  if (n == 10000) return 'عَشَرَةُ آلَافٍ';
  return '';
}

// تُعرف بعد part لأنها تستخدمها
String getThousands(int n) {
  if (n == 1) return 'أَلْفٌ';
  if (n == 2) return 'أَلْفَانِ';
  if (n >= 3 && n <= 10) return '${units[n]} آلَافٍ';
  return '${part(n)} أَلْفٍ';
}

//.........................................................

String numberToArabicWords(String numbers) {
  int number = double.parse(numbers).ceil();

  if (number < 1 || number > 10000) {
    throw ArgumentError('الدالة تدعم الأرقام من 1 إلى 10000 فقط');
  }

  final raw = part(number);
  return raw; // أو استخدم stripOptionalTashkeel(raw) لو أردت إزالة التشكيل
}

String stripOptionalTashkeel(String input) {
  // نحذف كل التشكيل ما عدا التنوين (ٌ ً ٍ)
  final regex = RegExp(
    r'[\u064B\u064C\u064D]|[^\u064B\u064C\u064D]\p{M}',
    unicode: true,
  );

  return input.replaceAllMapped(
    RegExp(r'[\u0617-\u061A\u064B-\u0652]', unicode: true),
    (match) {
      // احتفظ فقط بالتنوين (ٌ ً ٍ)
      final keep = ['\u064B', '\u064C', '\u064D']; // تنوين فتح/ضم/كسر
      return keep.contains(match.group(0)) ? match.group(0)! : '';
    },
  );
}
