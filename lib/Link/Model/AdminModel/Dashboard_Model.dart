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
  NumberOfStudentsThisYear? numberOfStudentsThisYear;
  NumberOfStudentsThisYear? numberOfStudentsPerYear;
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
    numberOfStudentsThisYear = json['NumberOfStudentsThisYear'] != null
        ? new NumberOfStudentsThisYear.fromJson(
            json['NumberOfStudentsThisYear'])
        : null;
    numberOfStudentsPerYear = json['NumberOfStudentsPerYear'] != null
        ? new NumberOfStudentsThisYear.fromJson(json['NumberOfStudentsPerYear'])
        : null;
    session =
        json['session'] != null ? new Session.fromJson(json['session']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['percentageStudents'] = this.percentageStudents;
    data['PercentageTeachers'] = this.percentageTeachers;
    data['PercentageEmployees'] = this.percentageEmployees;
    data['PercentageStudentsAttendance'] = this.percentageStudentsAttendance;
    data['PercentageTeachersAttendance'] = this.percentageTeachersAttendance;
    data['PercentageEmployeeAttendance'] = this.percentageEmployeeAttendance;
    data['AllStudents'] = this.allStudents;
    data['AllNowStudents'] = this.allNowStudents;
    data['AllTeachers'] = this.allTeachers;
    data['AllNowTeachers'] = this.allNowTeachers;
    data['AllEmplooyes'] = this.allEmplooyes;
    data['AllNowEmplooyes'] = this.allNowEmplooyes;
    data['Visitor'] = this.visitor;
    data['Divisin'] = this.divisin;
    data['ElibraryCount'] = this.elibraryCount;
    if (this.numberOfStudentsThisYear != null) {
      data['NumberOfStudentsThisYear'] =
          this.numberOfStudentsThisYear!.toJson();
    }
    if (this.numberOfStudentsPerYear != null) {
      data['NumberOfStudentsPerYear'] = this.numberOfStudentsPerYear!.toJson();
    }
    if (this.session != null) {
      data['session'] = this.session!.toJson();
    }
    return data;
  }
}

class NumberOfStudentsThisYear {
  String? countryName;
  int? percent;

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
