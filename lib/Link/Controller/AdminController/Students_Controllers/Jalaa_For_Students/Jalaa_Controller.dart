import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/Students_Models/Jalaa_Model.dart';

class Jalaa_Controller extends GetxController {
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
//
// @override
// void onInit() {
//   super.onInit();
//   loadInitialData();
// }
//
// void loadInitialData() {
//   // البيانات بشكل Map لتتوافق مع fromJson
//   Map<String, dynamic> jsonData = {
//     "rebort": {
//       "studentsInfo": {
//         "tasalsol": 1,
//         "studentsFullName": "ليث عزام",
//         "fatherName": "هيثم",
//         "motherName": "ماجده",
//         "division": "ماجده",
//         "Birthdate": "13/1/2003",
//         "language": "الانكليزية",
//         "raqSejel": 150,
//         "seassion": "2023/2024"
//       },
//       "mainCurriculum": [
//         {
//           "curriculumName": "العربية لغتي",
//           "maxMark": 200,
//           "passingMark": 100,
//           "insideCurr": [
//             {
//               "cName": "المهارات الشفوية",
//               "cMark": 120,
//               "Marks": [111, 200, 200, 200]
//             },
//             {
//               "cName": "المهارات اللغوية",
//               "cMark": 120,
//               "Marks": [145, 200, 200, 200]
//             }
//           ]
//         },
//         {
//           "curriculumName": "التربية الدينية",
//           "maxMark": 200,
//           "passingMark": 100,
//           "insideCurr": [
//             {
//               "cName": "التربية الدينية",
//               "cMark": 150,
//               "Marks": [200, 200, 200, 200]
//             }
//           ]
//         }
//       ],
//       "downCurriculum": [
//         {
//           "curriculumName": "التربية الدينية",
//           "maxMark": 200,
//           "passingMark": 100,
//           "insideCurr": [
//             {
//               "cName": "التربية الدينية",
//               "cMark": 150,
//               "Marks": [200, 200, 200, 200]
//             }
//           ]
//         }
//       ],
//       "attendance": {
//         "firstSemester": {
//           "studentAttendance": 94,
//           "mobarar_Attendance": 0,
//           "not_Mobarar_Attendance": 0,
//           "dawam_Fiele": 94
//         },
//         "secondSemester": {
//           "studentAttendance": 94,
//           "mobarar_Attendance": 0,
//           "not_Mobarar_Attendance": 0,
//           "dawam_Fiele": 94
//         }
//       },
//       "solok": [200, 200],
//       "Molahdat": {
//         "firstSemester": null,
//         "secondSemester": null,
//         "manager": null,
//         "schoolmanager": null
//       }
//     }
//   };
//
//   // تحويل البيانات باستخدام fromJson
//   rebortCard = Rebort_Card.fromJson(jsonData);
//   update();
// }
