class DashboardModel {
  DashboardModel({
    required this.percentageStudents,
    required this.percentageTeachers,
    required this.percentageEmployees,
    required this.percentageStudentsAttendance,
    required this.percentageTeachersAttendance,
    required this.percentageEmployeeAttendance,
    required this.allStudents,
    required this.allNowStudents,
    required this.allTeachers,
    required this.allNowTeachers,
    required this.allEmplooyes,
    required this.allNowEmplooyes,
    required this.visitor,
    required this.divisin,
    required this.elibraryCount,
    required this.numberOfStudentsThisYear,
    required this.numberOfStudentsPerYear,
  });

  final String? percentageStudents;
  final String? percentageTeachers;
  final String? percentageEmployees;
  final String? percentageStudentsAttendance;
  final String? percentageTeachersAttendance;
  final String? percentageEmployeeAttendance;
  final int? allStudents;
  final int? allNowStudents;
  final int? allTeachers;
  final int? allNowTeachers;
  final int? allEmplooyes;
  final int? allNowEmplooyes;
  final int? visitor;
  final int? divisin;
  final int? elibraryCount;
  final NumberOfStudentsYear? numberOfStudentsThisYear;
  final NumberOfStudentsYear? numberOfStudentsPerYear;

  factory DashboardModel.fromJson(Map<String, dynamic> json) {
    return DashboardModel(
      percentageStudents: json["percentageStudents"],
      percentageTeachers: json["PercentageTeachers"],
      percentageEmployees: json["PercentageEmployees"],
      percentageStudentsAttendance: json["PercentageStudentsAttendance"],
      percentageTeachersAttendance: json["PercentageTeachersAttendance"],
      percentageEmployeeAttendance: json["PercentageEmployeeAttendance"],
      allStudents: json["AllStudents"],
      allNowStudents: json["AllNowStudents"],
      allTeachers: json["AllTeachers"],
      allNowTeachers: json["AllNowTeachers"],
      allEmplooyes: json["AllEmplooyes"],
      allNowEmplooyes: json["AllNowEmplooyes"],
      visitor: json["Visitor"],
      divisin: json["Divisin"],
      elibraryCount: json["ElibraryCount"],
      numberOfStudentsThisYear: json["NumberOfStudentsThisYear"] == null
          ? null
          : NumberOfStudentsYear.fromJson(json["NumberOfStudentsThisYear"]),
      numberOfStudentsPerYear: json["NumberOfStudentsPerYear"] == null
          ? null
          : NumberOfStudentsYear.fromJson(json["NumberOfStudentsPerYear"]),
    );
  }
}

class NumberOfStudentsYear {
  NumberOfStudentsYear({
    required this.countryName,
    required this.percent,
  });

  final String? countryName;
  final int? percent;

  factory NumberOfStudentsYear.fromJson(Map<String, dynamic> json) {
    return NumberOfStudentsYear(
      countryName: json["countryName"],
      percent: json["percent"],
    );
  }
}
