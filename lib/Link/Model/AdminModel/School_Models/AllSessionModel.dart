class AllSessionModel {
  List<Sessions>? sessions;
  Sessions? current;

  AllSessionModel({this.sessions, this.current});

  AllSessionModel.fromJson(Map<String, dynamic> json) {
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
  String? firstSemesterStart;
  String? firstSemesterEnd;
  int? firstSemesterCount;
  String? secondSemesterStart;
  String? secondSemesterEnd;
  int? secondSemesterCount;

  Sessions({
    this.id,
    this.year,
    this.status,
    this.startDate,
    this.endDate,
    this.hasStudent,
    this.firstSemesterStart,
    this.firstSemesterEnd,
    this.firstSemesterCount,
    this.secondSemesterStart,
    this.secondSemesterEnd,
    this.secondSemesterCount,
  });

  Sessions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    year = json['year'];
    status = json['status'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    hasStudent = json['hasStudent'];
    firstSemesterStart = json['FirstSemesterStart'];
    firstSemesterEnd = json['FirstSemesterEnd'];
    firstSemesterCount = json['FirstSemesterCount'];
    secondSemesterStart = json['SecondSemesterStart'];
    secondSemesterEnd = json['SecondSemesterEnd'];
    secondSemesterCount = json['SecondSemesterCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['year'] = this.year;
    data['status'] = this.status;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['hasStudent'] = this.hasStudent;
    data['FirstSemesterStart'] = this.firstSemesterStart;
    data['FirstSemesterEnd'] = this.firstSemesterEnd;
    data['FirstSemesterCount'] = this.firstSemesterCount;
    data['SecondSemesterStart'] = this.secondSemesterStart;
    data['SecondSemesterEnd'] = this.secondSemesterEnd;
    data['SecondSemesterCount'] = this.secondSemesterCount;

    return data;
  }
}
