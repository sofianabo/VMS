import 'package:get/get.dart';
import 'package:vms_school/Translate/local_controller.dart';

class StudyShareTeacherModel {
  StudySharee? studySharee;

  StudyShareTeacherModel({this.studySharee});

  StudyShareTeacherModel.fromJson(Map<String, dynamic> json) {
    studySharee = json['studySharee'] != null
        ? new StudySharee.fromJson(json['studySharee'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.studySharee != null) {
      data['studySharee'] = this.studySharee!.toJson();
    }
    return data;
  }
}

class StudySharee {
  List<StudyShareTecherEvening>? studyShareTecherEvening;
  List<StudyShareTecherMorning>? studyShareTecherMorning;

  StudySharee({this.studyShareTecherEvening, this.studyShareTecherMorning});

  StudySharee.fromJson(Map<String, dynamic> json) {
    if (json['studyShareTecherEvening'] != null) {
      studyShareTecherEvening = <StudyShareTecherEvening>[];
      json['studyShareTecherEvening'].forEach((v) {
        studyShareTecherEvening!.add(new StudyShareTecherEvening.fromJson(v));
      });
    }
    if (json['studyShareTecherMorning'] != null) {
      studyShareTecherMorning = <StudyShareTecherMorning>[];
      json['studyShareTecherMorning'].forEach((v) {
        studyShareTecherMorning!.add(new StudyShareTecherMorning.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.studyShareTecherEvening != null) {
      data['studyShareTecherEvening'] =
          this.studyShareTecherEvening!.map((v) => v.toJson()).toList();
    }
    if (this.studyShareTecherMorning != null) {
      data['studyShareTecherMorning'] =
          this.studyShareTecherMorning!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StudyShareTecherEvening {
  String? curriculmName;
  String? curriculmEnName;
  String? divisionName;
  String? divisionEnName;
  String? classesName;
  String? classesEnName;
  String? day;
  int? id;
  String? permanentType;
  int? lessonId;

  StudyShareTecherEvening(
      {this.curriculmName,
      this.curriculmEnName,
      this.divisionName,
      this.divisionEnName,
      this.classesName,
      this.classesEnName,
      this.day,
      this.id,
      this.permanentType,
      this.lessonId});

  StudyShareTecherEvening.fromJson(Map<String, dynamic> json) {
    curriculmName = json['curriculmName'];
    curriculmEnName = json['curriculmEnName'];
    divisionName = json['divisionName'];
    divisionEnName = json['divisionEnName'];
    classesName = json['classesName'];
    classesEnName = json['classesEnName'];
    day = json['day'];
    id = json['id'];
    permanentType = json['permanentType'];
    lessonId = json['lessonId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['curriculmName'] = this.curriculmName;
    data['curriculmEnName'] = this.curriculmEnName;
    data['divisionName'] = this.divisionName;
    data['divisionEnName'] = this.divisionEnName;
    data['classesName'] = this.classesName;
    data['classesEnName'] = this.classesEnName;
    data['day'] = this.day;
    data['id'] = this.id;
    data['permanentType'] = this.permanentType;
    data['lessonId'] = this.lessonId;
    return data;
  }

  @override
  String toString() {
    String s = "";
    if (Get.find<LocalizationController>().currentLocale.value.languageCode ==
        'ar') {
      //language
      s += "${curriculmName} \n";
      s += "${classesName} \n";
      s += "${divisionName} \n";
    } else {
      //arbic
      s += "${curriculmEnName} \n";
      s += "${classesEnName} \n";
      s += "${divisionEnName} \n";
    }
    return s;
  }
}

class StudyShareTecherMorning {
  String? curriculmName;
  String? curriculmEnName;
  String? divisionName;
  String? divisionEnName;
  String? classesName;
  String? classesEnName;
  String? day;
  int? id;
  String? permanentType;
  int? lessonId;

  StudyShareTecherMorning(
      {this.curriculmName,
      this.curriculmEnName,
      this.divisionName,
      this.divisionEnName,
      this.classesName,
      this.classesEnName,
      this.day,
      this.id,
      this.permanentType,
      this.lessonId});

  StudyShareTecherMorning.fromJson(Map<String, dynamic> json) {
    curriculmName = json['curriculmName'];
    curriculmEnName = json['curriculmEnName'];
    divisionName = json['divisionName'];
    divisionEnName = json['divisionEnName'];
    classesName = json['classesName'];
    classesEnName = json['classesEnName'];
    day = json['day'];
    id = json['id'];
    permanentType = json['permanentType'];
    lessonId = json['lessonId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['curriculmName'] = this.curriculmName;
    data['curriculmEnName'] = this.curriculmEnName;
    data['divisionName'] = this.divisionName;
    data['divisionEnName'] = this.divisionEnName;
    data['classesName'] = this.classesName;
    data['classesEnName'] = this.classesEnName;
    data['day'] = this.day;
    data['id'] = this.id;
    data['permanentType'] = this.permanentType;
    data['lessonId'] = this.lessonId;
    return data;
  }

  @override
  String toString() {
    String s = "";
    if (Get.find<LocalizationController>().currentLocale.value.languageCode ==
        'ar') {
      //language
      s += "${curriculmName} \n";
      s += "${classesName} \n";
      s += "${divisionName} \n";
    } else {
      //arbic
      s += "${curriculmEnName} \n";
      s += "${classesEnName} \n";
      s += "${divisionEnName} \n";
    }
    return s;
  }
}
