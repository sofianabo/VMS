class AllRequestsModel {
	List<Registration>? registration;

	AllRequestsModel({this.registration});

	AllRequestsModel.fromJson(Map<String, dynamic> json) {
		if (json['registration'] != null) {
			registration = <Registration>[];
			json['registration'].forEach((v) { registration!.add(new Registration.fromJson(v)); });
		}
	}

}

class Registration {
	Guardian? guardian;
	Student? student;
	String? data;
	int? id;
	String? type;

	Registration({this.guardian, this.student, this.data, this.id, this.type});

	Registration.fromJson(Map<String, dynamic> json) {
		guardian = json['guardian'] != null ? new Guardian.fromJson(json['guardian']) : null;
		student = json['student'] != null ? new Student.fromJson(json['student']) : null;
		data = json['data'];
		id = json['id'];
		type = json['type'];
	}

}

class Guardian {
	String? name;
  dynamic mobile;
  String? email;
	String? nationalId;

	Guardian({this.name, this.mobile, this.email, this.nationalId});

	Guardian.fromJson(Map<String, dynamic> json) {
		name = json['name'];
		mobile = json['mobile'];
		email = json['email'];
		nationalId = json['nationalId'];
	}

}

class Student {
	String? name;
	String? clas;
  dynamic previousClass;
  int ?id;

	Student({required this.name,required this.clas, this.previousClass,required this.id});

	Student.fromJson(Map<String, dynamic> json) {
		name = json['name'];
		clas = json['class'];
		previousClass = json['previousClass'];
		id = json['id'];
	}

}
