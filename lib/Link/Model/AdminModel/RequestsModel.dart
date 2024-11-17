class AllRequestsModel {
	List<Registration>? registration;

	AllRequestsModel({this.registration});

	AllRequestsModel.fromJson(Map<String, dynamic> json) {
		if (json['registration'] != null) {
			registration = <Registration>[];
			json['registration'].forEach((v) { registration!.add(new Registration.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.registration != null) {
      data['registration'] = this.registration!.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class Registration {
	Guardian? guardian;
	Student? student;
	String? data;

	Registration({this.guardian, this.student, this.data});

	Registration.fromJson(Map<String, dynamic> json) {
		guardian = json['guardian'] != null ? new Guardian.fromJson(json['guardian']) : null;
		student = json['student'] != null ? new Student.fromJson(json['student']) : null;
		data = json['data'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.guardian != null) {
      data['guardian'] = this.guardian!.toJson();
    }
		if (this.student != null) {
      data['student'] = this.student!.toJson();
    }
		data['data'] = this.data;
		return data;
	}
}

class Guardian {
	String? name;
	Null? mobile;
	String? email;
	String? nationalId;

	Guardian({this.name, this.mobile, this.email, this.nationalId});

	Guardian.fromJson(Map<String, dynamic> json) {
		name = json['name'];
		mobile = json['mobile'];
		email = json['email'];
		nationalId = json['nationalId'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['name'] = this.name;
		data['mobile'] = this.mobile;
		data['email'] = this.email;
		data['nationalId'] = this.nationalId;
		return data;
	}
}

class Student {
	String? name;
	String? clas;
	Null? previousClass;

	Student({this.name, this.clas, this.previousClass});

	Student.fromJson(Map<String, dynamic> json) {
		name = json['name'];
		clas = json['class'];
		previousClass = json['previousClass'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['name'] = this.name;
		data['class'] = this.clas;
		data['previousClass'] = this.previousClass;
		return data;
	}
}
