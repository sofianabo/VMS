class Rebort_Card {
  Rebort? rebort;

  Rebort_Card({this.rebort});

  Rebort_Card.fromJson(Map<String, dynamic> json) {
    rebort =
        json['rebort'] != null ? new Rebort.fromJson(json['rebort']) : null;
  }
}

class Rebort {
  StudentsInfo? studentsInfo;
  List<MainCurriculum>? mainCurriculum;
  List<MainCurriculum>? downCurriculum;
  Attendance? attendance;
  Molahdat? molahdat;
  List<int>? solok;
  int? shId;

  Rebort(
      {this.studentsInfo,
      this.mainCurriculum,
      this.downCurriculum,
      this.attendance,
      this.molahdat,
      this.solok,
      this.shId});

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
    molahdat = json['Molahdat'] != null
        ? new Molahdat.fromJson(json['Molahdat'])
        : null;
    solok = json['solok'].cast<int>();
    shId = json['shId'];
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
}

class MainCurriculum {
  String? curriculumName;
  List<InsideCurr>? insideCurr;

  MainCurriculum({this.curriculumName, this.insideCurr});

  MainCurriculum.fromJson(Map<String, dynamic> json) {
    curriculumName = json['curriculumName'];
    if (json['insideCurr'] != null) {
      insideCurr = <InsideCurr>[];
      json['insideCurr'].forEach((v) {
        insideCurr!.add(new InsideCurr.fromJson(v));
      });
    }
  }
}

class InsideCurr {
  String? cName;
  int? maxMark;
  int? passingMark;
  List<int>? marks;

  InsideCurr({this.cName, this.maxMark, this.passingMark, this.marks});

  InsideCurr.fromJson(Map<String, dynamic> json) {
    cName = json['cName'];
    maxMark = json['maxMark'];
    passingMark = json['passingMark'];
    marks = json['Marks'].cast<int>();
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
}

class FirstSemester {
  int? studentAttendance;
  int? mobararAttendance;
  int? notMobararAttendance;
  int? dawamFile;

  FirstSemester(
      {this.studentAttendance,
      this.mobararAttendance,
      this.notMobararAttendance,
      this.dawamFile});

  FirstSemester.fromJson(Map<String, dynamic> json) {
    studentAttendance = json['studentAttendance'];
    mobararAttendance = json['mobarar_Attendance'];
    notMobararAttendance = json['not_Mobarar_Attendance'];
    dawamFile = json['dawam_File'];
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
}
