import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/AllClassesModel.dart';
import 'package:vms_school/Link/Model/AdminModel/AllDivisionModel.dart';
import 'package:vms_school/Link/Model/AdminModel/AllStatusModel.dart';
import 'package:vms_school/Link/Model/AdminModel/RequestsModel.dart';
import 'package:vms_school/Link/Model/AuthModel/UserModel.dart';

class Requestscontroller extends GetxController {
  List<Registration> registration = [];
  List<Registration> filteredregistration = [];
  String statusindex = "";
  String classIndex = "";
  String divisionIndex = "";
  List<String> statusList = [];
  List<String> classlist = [];
  List<String> divisionlist = ["one"];
  bool IsLoading = true;
  void setAllRequests(AllRequestsModel req) {
    registration = req.registration!;
    filteredregistration = List.from(req.registration!);
    IsLoading = false;

    update();
  }

  void restor() {
    registration.clear();
    filteredregistration.clear();
    IsLoading = true;
    update();
  }

  void searchRequestByName(String query) {
    if (query.isEmpty) {
      filteredregistration = List.from(registration);
    } else {
      filteredregistration = registration.where((requests) {
        final studentName = requests.student?.name?.toLowerCase() ?? '';
        final guardianName = requests.guardian?.name?.toLowerCase() ?? '';
        return studentName.contains(query.toLowerCase()) ||
            guardianName.contains(query.toLowerCase());
      }).toList();
    }
    update();
  }

  void selectIndex(String type, String? index) {
    print("");

    switch (type) {
      case 'status':
        statusindex = index ?? "";
        break;
      case 'class':
        classIndex = index ?? "";
        break;
      case 'division':
        divisionIndex = index ?? "";
        break;
    }
    update();
  }

  void setAllStatus(AllStatusModel stat) async {
    statusList.clear();
    for (int i = 0; i < stat.type!.length; i++) {
      statusList.add(stat.type![i].toString());
    }
    update();
    updateList("status", statusList);
  }

  void setAllClassDialog(AllClassesModel clas) async {
    classlist.clear();
    for (int i = 0; i < clas.classes.length; i++) {
      classlist.add(clas.classes[i].enName.toString());
    }
    update();
    updateList("class", classlist);
  }

  void setAllDivisionDialog(AllDivisionModel division) async {
    divisionlist.clear();
    for (int i = 0; i < division.division!.length; i++) {
      divisionlist.add(division.division![i].enName.toString());
    }
    update();
    updateList("division", divisionlist);
  }

  void updateList(
    String type,
    List<String> options,
  ) {
    switch (type) {
      case 'status':
        statusList = options;
        break;

      case 'class':
        classlist = options;
        break;
      case 'division':
        divisionlist = options;
        break;
    }
    update();
  }

  Rx<DateTime?> requestDate = Rx<DateTime?>(null);

  void selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: requestDate.value ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      requestDate.value = picked;
    }
  }

  String get selectedStatusIndex => statusindex;
  String get selectedClassIndex => classIndex;
  String get selectedDivisionIndex => divisionIndex;
  Rx<DateTime?> get selectDateindex => requestDate;
}
