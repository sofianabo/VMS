class Rebort_Card {
  Rebort? rebort;

  Rebort_Card({this.rebort});

  Rebort_Card.fromJson(Map<String, dynamic> json) {
    rebort =
        json['rebort'] != null ? new Rebort.fromJson(json['rebort']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.rebort != null) {
      data['rebort'] = this.rebort!.toJson();
    }
    return data;
  }
}

class Rebort {
  StudentsInfo? studentsInfo;
  List<MainCurriculum>? mainCurriculum;
  List<MainCurriculum>? downCurriculum;
  Attendance? attendance;
  List<int>? solok;
  Molahdat? molahdat;

  Rebort(
      {this.studentsInfo,
      this.mainCurriculum,
      this.downCurriculum,
      this.attendance,
      this.solok,
      this.molahdat});

  Rebort.fromJson(Map<String, dynamic> json) {
    studentsInfo = json['studentsInfo'] != null
        ? new StudentsInfo.fromJson(json['studentsInfo'])
        : null;
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
    attendance = json['attendance'] != null
        ? new Attendance.fromJson(json['attendance'])
        : null;
    solok = json['solok'].cast<int>();
    molahdat = json['Molahdat'] != null
        ? new Molahdat.fromJson(json['Molahdat'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.studentsInfo != null) {
      data['studentsInfo'] = this.studentsInfo!.toJson();
    }
    if (this.mainCurriculum != null) {
      data['mainCurriculum'] =
          this.mainCurriculum!.map((v) => v.toJson()).toList();
    }
    if (this.downCurriculum != null) {
      data['downCurriculum'] =
          this.downCurriculum!.map((v) => v.toJson()).toList();
    }
    if (this.attendance != null) {
      data['attendance'] = this.attendance!.toJson();
    }
    data['solok'] = this.solok;
    if (this.molahdat != null) {
      data['Molahdat'] = this.molahdat!.toJson();
    }
    return data;
  }
}

class StudentsInfo {
  int? tasalsol;
  String? studentsFullName;
  String? fatherName;
  String? motherName;
  String? division;
  String? birthdate;
  String? language;
  int? raqSejel;
  String? seassion;

  StudentsInfo(
      {this.tasalsol,
      this.studentsFullName,
      this.fatherName,
      this.motherName,
      this.division,
      this.birthdate,
      this.language,
      this.raqSejel,
      this.seassion});

  StudentsInfo.fromJson(Map<String, dynamic> json) {
    tasalsol = json['tasalsol'];
    studentsFullName = json['studentsFullName'];
    fatherName = json['fatherName'];
    motherName = json['motherName'];
    division = json['division'];
    birthdate = json['Birthdate'];
    language = json['language'];
    raqSejel = json['raqSejel'];
    seassion = json['seassion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tasalsol'] = this.tasalsol;
    data['studentsFullName'] = this.studentsFullName;
    data['fatherName'] = this.fatherName;
    data['motherName'] = this.motherName;
    data['division'] = this.division;
    data['Birthdate'] = this.birthdate;
    data['language'] = this.language;
    data['raqSejel'] = this.raqSejel;
    data['seassion'] = this.seassion;
    return data;
  }
}

class MainCurriculum {
  String? curriculumName;
  int? maxMark;
  int? passingMark;
  List<InsideCurr>? insideCurr;

  MainCurriculum(
      {this.curriculumName, this.maxMark, this.passingMark, this.insideCurr});

  MainCurriculum.fromJson(Map<String, dynamic> json) {
    curriculumName = json['curriculumName'];
    maxMark = json['maxMark'];
    passingMark = json['passingMark'];
    if (json['insideCurr'] != null) {
      insideCurr = <InsideCurr>[];
      json['insideCurr'].forEach((v) {
        insideCurr!.add(new InsideCurr.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['curriculumName'] = this.curriculumName;
    data['maxMark'] = this.maxMark;
    data['passingMark'] = this.passingMark;
    if (this.insideCurr != null) {
      data['insideCurr'] = this.insideCurr!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class InsideCurr {
  String? cName;
  int? cMark;
  List<int>? marks;

  InsideCurr({this.cName, this.cMark, this.marks});

  InsideCurr.fromJson(Map<String, dynamic> json) {
    cName = json['cName'];
    cMark = json['cMark'];
    marks = json['Marks'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cName'] = this.cName;
    data['cMark'] = this.cMark;
    data['Marks'] = this.marks;
    return data;
  }
}

class Attendance {
  FirstSemester? firstSemester;
  FirstSemester? secondSemester;

  Attendance({this.firstSemester, this.secondSemester});

  Attendance.fromJson(Map<String, dynamic> json) {
    firstSemester = json['firstSemester'] != null
        ? new FirstSemester.fromJson(json['firstSemester'])
        : null;
    secondSemester = json['secondSemester'] != null
        ? new FirstSemester.fromJson(json['secondSemester'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.firstSemester != null) {
      data['firstSemester'] = this.firstSemester!.toJson();
    }
    if (this.secondSemester != null) {
      data['secondSemester'] = this.secondSemester!.toJson();
    }
    return data;
  }
}

class FirstSemester {
  int? studentAttendance;
  int? mobararAttendance;
  int? notMobararAttendance;
  int? dawamFiele;

  FirstSemester(
      {this.studentAttendance,
      this.mobararAttendance,
      this.notMobararAttendance,
      this.dawamFiele});

  FirstSemester.fromJson(Map<String, dynamic> json) {
    studentAttendance = json['studentAttendance'];
    mobararAttendance = json['mobarar_Attendance'];
    notMobararAttendance = json['not_Mobarar_Attendance'];
    dawamFiele = json['dawam_Fiele'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['studentAttendance'] = this.studentAttendance;
    data['mobarar_Attendance'] = this.mobararAttendance;
    data['not_Mobarar_Attendance'] = this.notMobararAttendance;
    data['dawam_Fiele'] = this.dawamFiele;
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
