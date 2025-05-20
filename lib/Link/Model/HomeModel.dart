class HomeModel {
  int? student;
  int? teacher;
  int? visitors;
  String? enAddress;
  String? address;
  String? phonNumber;
  String? email;
  String? whatsAppNumber;
  String? urlYoutube;
  String? urlFaceBook;
  String? morningShiftStartHours;
  String? morningClosingHours;
  String? eveningShiftStartHours;
  String? eveningClosingHours;

  HomeModel(
      {this.student,
      this.teacher,
      this.visitors,
      this.enAddress,
      this.address,
      this.phonNumber,
      this.email,
      this.whatsAppNumber,
      this.urlYoutube,
      this.urlFaceBook,
      this.morningShiftStartHours,
      this.morningClosingHours,
      this.eveningShiftStartHours,
      this.eveningClosingHours});

  HomeModel.fromJson(Map<String, dynamic> json) {
    student = json['student'];
    teacher = json['teacher'];
    visitors = json['visitors'];
    enAddress = json['enAddress'];
    address = json['address'];
    phonNumber = json['phonNumber'];
    email = json['email'];
    whatsAppNumber = json['whatsAppNumber'];
    urlYoutube = json['urlYoutube'];
    urlFaceBook = json['urlFaceBook'];
    morningShiftStartHours = json['MorningShiftStartHours'];
    morningClosingHours = json['MorningClosingHours'];
    eveningShiftStartHours = json['EveningShiftStartHours'];
    eveningClosingHours = json['EveningClosingHours'];
  }
}
