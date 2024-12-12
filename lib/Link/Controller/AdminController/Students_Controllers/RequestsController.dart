import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/AllClassesModel.dart';
import 'package:vms_school/Link/Model/AdminModel/AllDivisionModel.dart';
import 'package:vms_school/Link/Model/AdminModel/RequestsModel.dart';

class Requestscontroller extends GetxController {
  List<Registration> registration = [];
  List<Registration> filteredregistration = [];
  String statusindex = "";
  String classIndex = "";
  String divisionIndex = "";
  List<String> statusList = [
    'acceptable',
    'unacceptable',
    'Partially acceptable',
    'hanging'
  ];
  List<String> classlist = [];
  List<Classes> allClass = [];
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

  void applyFilters() {
    filteredregistration = registration.where((requests) {
      final studentName = requests.student?.name?.toLowerCase() ?? '';
      final guardianName = requests.guardian?.name?.toLowerCase() ?? '';
      final status = requests.type?.toLowerCase() ?? '';
      final date = requests.date;

      final matchesName = searchQuery.isEmpty ||
          studentName.contains(searchQuery) ||
          guardianName.contains(searchQuery);
      final matchesStatus =
          statusindex.isEmpty || status == statusindex.toLowerCase();
      final matchesDate = requestDate.value == null ||
          date ==
              "${requestDate.value!.year}-${requestDate.value!.month}-${requestDate.value!.day}";

      return matchesName && matchesStatus && matchesDate;
    }).toList();

    update();
  }

  String searchQuery = "";

  void searchRequestByName(String query) {
    searchQuery = query.toLowerCase();
    applyFilters();
  }

  void searchRequestByStatus(String status) {
    statusindex = status.toLowerCase();
    applyFilters();
  }

  void setRequestDate(DateTime? date) {
    requestDate.value = date;
    applyFilters();
    update();
  }

  void resetFilters() {
    searchQuery = "";
    statusindex = "";
    requestDate.value = null;
    filteredregistration = List.from(registration);
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

    if (type == "status") {
      searchRequestByStatus(index!);
    }
    update();
  }

  void setAllClassDialog(AllClassModel clas) async {
    classlist.clear();
    allClass = clas.classes!;
    for (int i = 0; i < clas.classes!.length; i++) {
      classlist.add(clas.classes![i].enName.toString());
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
    setRequestDate(picked);
    update();
  }

  removedate() {
    requestDate.value = null;
    setRequestDate(null);
    update();
  }

  String get selectedStatusIndex => statusindex;
  String get selectedClassIndex => classIndex;
  String get selectedDivisionIndex => divisionIndex;
  Rx<DateTime?> get selectDateindex => requestDate;
}
