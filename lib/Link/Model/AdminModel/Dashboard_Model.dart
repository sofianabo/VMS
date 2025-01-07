class DashboardModel {
  String? percentageStudents;
  String? percentageTeachers;
  String? percentageEmployees;
  String? percentageStudentsAttendance;
  String? percentageTeachersAttendance;
  String? percentageEmployeeAttendance;
  int? allStudents;
  int? allNowStudents;
  int? allTeachers;
  int? allNowTeachers;
  int? allEmplooyes;
  int? allNowEmplooyes;
  int? visitor;
  int? divisin;
  int? elibraryCount;
  List<NumberOfStudentsThisYear>? numberOfStudentsThisYear;
  List<NumberOfStudentsPerYear>? numberOfStudentsPerYear;
  Session? session;

  DashboardModel(
      {this.percentageStudents,
      this.percentageTeachers,
      this.percentageEmployees,
      this.percentageStudentsAttendance,
      this.percentageTeachersAttendance,
      this.percentageEmployeeAttendance,
      this.allStudents,
      this.allNowStudents,
      this.allTeachers,
      this.allNowTeachers,
      this.allEmplooyes,
      this.allNowEmplooyes,
      this.visitor,
      this.divisin,
      this.elibraryCount,
      this.numberOfStudentsThisYear,
      this.numberOfStudentsPerYear,
      this.session});

  DashboardModel.fromJson(Map<String, dynamic> json) {
    percentageStudents = json['percentageStudents'];
    percentageTeachers = json['PercentageTeachers'];
    percentageEmployees = json['PercentageEmployees'];
    percentageStudentsAttendance = json['PercentageStudentsAttendance'];
    percentageTeachersAttendance = json['PercentageTeachersAttendance'];
    percentageEmployeeAttendance = json['PercentageEmployeeAttendance'];
    allStudents = json['AllStudents'];
    allNowStudents = json['AllNowStudents'];
    allTeachers = json['AllTeachers'];
    allNowTeachers = json['AllNowTeachers'];
    allEmplooyes = json['AllEmplooyes'];
    allNowEmplooyes = json['AllNowEmplooyes'];
    visitor = json['Visitor'];
    divisin = json['Divisin'];
    elibraryCount = json['ElibraryCount'];
    if (json['NumberOfStudentsThisYear'] != null) {
      numberOfStudentsThisYear = <NumberOfStudentsThisYear>[];
      json['NumberOfStudentsThisYear'].forEach((v) {
        numberOfStudentsThisYear!.add(new NumberOfStudentsThisYear.fromJson(v));
      });
    }
    if (json['NumberOfStudentsPerYear'] != null) {
      numberOfStudentsPerYear = <NumberOfStudentsPerYear>[];
      json['NumberOfStudentsPerYear'].forEach((v) {
        numberOfStudentsPerYear!.add(new NumberOfStudentsPerYear.fromJson(v));
      });
    }
    session =
        json['session'] != null ? new Session.fromJson(json['session']) : null;
  }
}

class NumberOfStudentsThisYear {
  String? countryName;
  double? percent;

  NumberOfStudentsThisYear({this.countryName, this.percent});

  NumberOfStudentsThisYear.fromJson(Map<String, dynamic> json) {
    countryName = json['countryName'];
    percent = json['percent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['countryName'] = this.countryName;
    data['percent'] = this.percent;
    return data;
  }
}

class NumberOfStudentsPerYear {
  String? countryName;
  double? percent;

  NumberOfStudentsPerYear({this.countryName, this.percent});

  NumberOfStudentsPerYear.fromJson(Map<String, dynamic> json) {
    countryName = json['countryName'];
    percent = json['percent'];
  }
}

class Session {
  List<Sessions>? sessions;
  Sessions? current;

  Session({this.sessions, this.current});

  Session.fromJson(Map<String, dynamic> json) {
    if (json['sessions'] != null) {
      sessions = <Sessions>[];
      json['sessions'].forEach((v) {
        sessions!.add(new Sessions.fromJson(v));
      });
    }
    current =
        json['current'] != null ? new Sessions.fromJson(json['current']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.sessions != null) {
      data['sessions'] = this.sessions!.map((v) => v.toJson()).toList();
    }
    if (this.current != null) {
      data['current'] = this.current!.toJson();
    }
    return data;
  }
}

class Sessions {
  int? id;
  String? year;
  String? status;
  String? startDate;
  String? endDate;
  int? hasStudent;

  Sessions(
      {this.id,
      this.year,
      this.status,
      this.startDate,
      this.endDate,
      this.hasStudent});

  Sessions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    year = json['year'];
    status = json['status'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    hasStudent = json['hasStudent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['year'] = this.year;
    data['status'] = this.status;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['hasStudent'] = this.hasStudent;
    return data;
  }
}
