class All_Jalaas_Model {
  List<JalaaSettings>? jalaaSettings;

  All_Jalaas_Model({this.jalaaSettings});

  All_Jalaas_Model.fromJson(Map<String, dynamic> json) {
    if (json['jalaaSettings'] != null) {
      jalaaSettings = <JalaaSettings>[];
      json['jalaaSettings'].forEach((v) {
        jalaaSettings!.add(new JalaaSettings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.jalaaSettings != null) {
      data['jalaaSettings'] =
          this.jalaaSettings!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class JalaaSettings {
  int? id;
  int? shId;
  List<MainCurriculum>? mainCurriculum;
  List<MainCurriculum>? downCurriculum;
  List<MainCurriculum>? quizTypes;
  Classes? classes;
  Molahdat? molahdat;

  JalaaSettings(
      {this.id,
      this.shId,
      this.mainCurriculum,
      this.downCurriculum,
      this.quizTypes,
      this.classes,
      this.molahdat});

  JalaaSettings.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    shId = json['shId'];
    if (json['mainCurriculum'] != null) {
      mainCurriculum = <MainCurriculum>[];
      json['mainCurriculum'].forEach((v) {
        mainCurriculum!.add(new MainCurriculum.fromJson(v));
      });
    }
    if (json['downCurriculum'] != null) {
      downCurriculum = <MainCurriculum>[];
      json['downCurriculum'].forEach((v) {
        downCurriculum!.add(new MainCurriculum.fromJson(v));
      });
    }
    if (json['quizTypes'] != null) {
      quizTypes = <MainCurriculum>[];
      json['quizTypes'].forEach((v) {
        quizTypes!.add(new MainCurriculum.fromJson(v));
      });
    }
    classes =
        json['classes'] != null ? new Classes.fromJson(json['classes']) : null;
    molahdat = json['Molahdat'] != null
        ? new Molahdat.fromJson(json['Molahdat'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['shId'] = this.shId;
    if (this.mainCurriculum != null) {
      data['mainCurriculum'] =
          this.mainCurriculum!.map((v) => v.toJson()).toList();
    }
    if (this.downCurriculum != null) {
      data['downCurriculum'] =
          this.downCurriculum!.map((v) => v.toJson()).toList();
    }
    if (this.quizTypes != null) {
      data['quizTypes'] = this.quizTypes!.map((v) => v.toJson()).toList();
    }
    if (this.classes != null) {
      data['classes'] = this.classes!.toJson();
    }
    if (this.molahdat != null) {
      data['Molahdat'] = this.molahdat!.toJson();
    }
    return data;
  }
}

class MainCurriculum {
  String? name;
  int? id;

  MainCurriculum({this.name, this.id});

  MainCurriculum.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    return data;
  }
}

class Classes {
  int? id;
  String? name;
  String? enName;

  Classes({this.id, this.name, this.enName});

  Classes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    enName = json['enName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['enName'] = this.enName;
    return data;
  }
}

class Molahdat {
  String? firstSemester;
  String? secondSemester;
  String? manager;
  String? schoolmanager;

  Molahdat(
      {this.firstSemester,
      this.secondSemester,
      this.manager,
      this.schoolmanager});

  Molahdat.fromJson(Map<String, dynamic> json) {
    firstSemester = json['firstSemester'];
    secondSemester = json['secondSemester'];
    manager = json['manager'];
    schoolmanager = json['schoolmanager'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstSemester'] = this.firstSemester;
    data['secondSemester'] = this.secondSemester;
    data['manager'] = this.manager;
    data['schoolmanager'] = this.schoolmanager;
    return data;
  }
}
