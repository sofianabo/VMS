import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/Location_API/Locations_API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_DropDown/DropdownClassesAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_DropDown/DropdownDivisionAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/Students/Students_APIs/Update_Student_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/AllEmpolyeeController.dart';
import 'package:vms_school/Link/Controller/AdminController/Location_controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Add_Students_Controller.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownClassesController.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownDivisionController.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/main.dart';
import 'package:vms_school/view/Admin/Students_Manager/Edite_Students_Drop_Files.dart';
import 'package:vms_school/widgets/Admin_Students/DropDown_Add_Students.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/Calender.dart';
import 'package:vms_school/widgets/LargeTextField.dart';
import 'package:vms_school/widgets/TextFildWithUpper.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';
import '../../../Link/Controller/AdminController/Students_Controllers/AllStudentsController.dart';

EditStudentDialog(int idx, BuildContext context) async {
  final Controller = Get.find<Allstudentscontroller>();
  final add_controller = Get.find<Add_Students_Controller>();
  final Allempolyeecontrollers = Get.find<Allempolyeecontroller>();
  final isArabic =
      Get.find<LocalizationController>().currentLocale.value.languageCode ==
          'ar';
  add_controller.Initial();
  Controller.SetIDX(idx);
  TextEditingController First_Name =
      TextEditingController(text: Controller.student!.firstName);
  TextEditingController Last_Name =
      TextEditingController(text: Controller.student!.lastName);
  TextEditingController Place_Of_Birth =
      TextEditingController(text: Controller.student!.placeOfBirth);
  TextEditingController Mobile_Number = TextEditingController(
      text: Controller.filteredStudents[idx].mobileNumber);
  TextEditingController Current_Address =
      TextEditingController(text: Controller.student!.currentAdress);
  TextEditingController National_ID =
      TextEditingController(text: Controller.student!.nationalNumber);
  TextEditingController Password = TextEditingController();
  TextEditingController Father_Name =
      TextEditingController(text: Controller.student!.fatherName);
  TextEditingController Mother_Name =
      TextEditingController(text: Controller.student!.motherName);
  TextEditingController Father_Phone =
      TextEditingController(text: Controller.student!.fatherPhone);
  TextEditingController Father_Work =
      TextEditingController(text: Controller.student!.fatherWork);
  TextEditingController Mother_Phone =
      TextEditingController(text: Controller.student!.motherPhone);
  TextEditingController Mother_Work =
      TextEditingController(text: Controller.student!.motherWork);
  TextEditingController Last_School_Detail =
      TextEditingController(text: Controller.student!.lastSchoolDetail);
  TextEditingController LocalID =
      TextEditingController(text: Controller.student!.localID);
  TextEditingController Note =
      TextEditingController(text: Controller.student!.note);
  TextEditingController Fee_Discount =
      TextEditingController(text: Controller.student!.feeDiscount);
  TextEditingController username =
      TextEditingController(text: Controller.filteredStudents[idx].userName);

  add_controller.selectedImage.value = null;
  add_controller.set_Edite_Data(
      DivisionIndexs: Controller.student!.division!.enName,
      isPendStudents: Controller.student!.isPended,
      BloodTypeindex: Controller.student!.bloodType,
      Classindex: isArabic
          ? Controller.student!.classes!.name
          : Controller.student!.classes!.enName ?? "",
      FamilyStateindex: Controller.student!.familystatus ?? "",
      Genderindex: Controller.student!.gender ?? "",
      Locationindex: isArabic
          ? Controller.student!.location!.name
          : Controller.student!.location!.enName ?? "",
      Specialneed: Controller.student!.specialNeeds == 1 ? true : false,
      Martyson: Controller.student!.martyrSon == 1 ? true : false,
      Realagonindex: Controller.student!.religion ?? "");
  Allempolyeecontrollers.Birthdate.value =
      DateTime.parse(Controller.student!.birthDate.toString());

  Get.dialog(VMSAlertDialog(
      action: [
        ButtonDialog(
            text: "Update Student".tr,
            onPressed: () async {
              bool isgenderEmpty = Get.find<Add_Students_Controller>()
                      .selectedGenderIndex
                      .isEmpty ||
                  Get.find<Add_Students_Controller>().selectedGenderIndex == "";

              bool isreligionEmpty = Get.find<Add_Students_Controller>()
                      .selectedRealagonIndex
                      .isEmpty ||
                  Get.find<Add_Students_Controller>().selectedRealagonIndex ==
                      "";
              bool isbloodEmpty = Get.find<Add_Students_Controller>()
                      .selectedBloodTypeIndex
                      .isEmpty ||
                  Get.find<Add_Students_Controller>().selectedBloodTypeIndex ==
                      "";
              bool iscountryEmpty = Get.find<Add_Students_Controller>()
                      .selectedLocationIndex
                      .isEmpty ||
                  Get.find<Add_Students_Controller>().selectedLocationIndex ==
                      "Syria".tr;
              bool isclassEmpty = Get.find<Add_Students_Controller>()
                      .selectedClassIndex
                      .isEmpty ||
                  Get.find<Add_Students_Controller>().selectedClassIndex == "";
              bool isDivisionEmpty = Get.find<Add_Students_Controller>()
                      .selectedDivisionIndex
                      .isEmpty ||
                  Get.find<Add_Students_Controller>().selectedDivisionIndex ==
                      "";

              bool isFirstNameEmpty = First_Name.text.trim().isEmpty;
              bool isLastNameEmpty = Last_Name.text.trim().isEmpty;
              bool isPlaceofBirthEmpty = Place_Of_Birth.text.trim().isEmpty;
              bool isphoneEmpty = Mobile_Number.text.trim().isEmpty;
              bool isLocalIDEmpty = LocalID.text.trim().isEmpty;
              bool isAddressEmpty = Current_Address.text.trim().isEmpty;
              bool isusernameEmpty =
                  add_controller.textController.text.trim().isEmpty;
              bool ispasswordEmpty = Password.text.trim().isEmpty;
              bool isfathernameEmpty = Father_Name.text.trim().isEmpty;
              bool isFatherPhoneEmpty = Father_Phone.text.trim().isEmpty;
              bool isMotherNameEmpty = Mother_Name.text.trim().isEmpty;
              bool ismotehrPhoneEmpty = Mother_Phone.text.trim().isEmpty;
              bool isbirthdateEmpty =
                  Get.find<Allempolyeecontroller>().Birthdate.value == null;
              RegExp passwordRegex = RegExp(r"^[a-zA-Z0-9]{8,}$");
              bool isPasswordValid = passwordRegex.hasMatch(Password.text);

              add_controller.updateFieldError("first", isFirstNameEmpty);
              add_controller.updateFieldError("last", isLastNameEmpty);
              add_controller.updateFieldError("birthdate", isbirthdateEmpty);
              add_controller.updateFieldError(
                  "placeofbirth", isPlaceofBirthEmpty);
              add_controller.updateFieldError("gender", isgenderEmpty);
              add_controller.updateFieldError("religion", isreligionEmpty);
              add_controller.updateFieldError("blood", isbloodEmpty);
              add_controller.updateFieldError("country", iscountryEmpty);
              add_controller.updateFieldError("phone", isphoneEmpty);
              add_controller.updateFieldError("localnational", isLocalIDEmpty);
              add_controller.updateFieldError("class", isclassEmpty);

              add_controller.updateFieldError("localaddress", isAddressEmpty);
              add_controller.updateFieldError("username", isusernameEmpty);
              add_controller.updateFieldError("division", isDivisionEmpty);
              add_controller.updateFieldError("password", ispasswordEmpty);
              add_controller.updateFieldError("fathername", isfathernameEmpty);
              add_controller.updateFieldError(
                  "fatherphone", isFatherPhoneEmpty);
              add_controller.updateFieldError("mothername", isMotherNameEmpty);
              add_controller.updateFieldError(
                  "motherphone", ismotehrPhoneEmpty);
              if (!(isFirstNameEmpty ||
                  isLastNameEmpty ||
                  isbirthdateEmpty ||
                  isPlaceofBirthEmpty ||
                  isgenderEmpty ||
                  isreligionEmpty ||
                  isbloodEmpty ||
                  iscountryEmpty ||
                  isphoneEmpty ||
                  isLocalIDEmpty ||
                  isclassEmpty ||
                  isAddressEmpty ||
                  isusernameEmpty ||
                  isDivisionEmpty ||
                  ispasswordEmpty ||
                  isfathernameEmpty ||
                  isFatherPhoneEmpty ||
                  isMotherNameEmpty ||
                  ismotehrPhoneEmpty)) {
                await Update_Student_API.Update_Student(
                    Academic_sequence_FileID:
                        Controller.student!.documantes!.academicSequence?.id,
                    Certefecate_FileID:
                        Controller.student!.documantes!.certificate?.id,
                    FamilyNotbook_FileID:
                        Controller.student!.documantes!.familyNotebook?.id,
                    FatherPassport_FileID:
                        Controller.student!.documantes!.fatherPassport?.id,
                    MotherPassport_FileID:
                        Controller.student!.documantes!.motherPassport?.id,
                    SonPassport_FileID:
                        Controller.student!.documantes!.sonPassport?.id,
                    studentID: Controller.filteredStudents[idx].id,
                    UserID_FileID: Controller.student!.documantes!.userID?.id,
                    locationId: Get.find<Location_controller>()
                        .location![add_controller.Locationlist.indexOf(
                            add_controller.LocationIndex)]
                        .id,
                    firstName: First_Name.text,
                    lastName: Last_Name.text,
                    gender: add_controller.GenderIndex,
                    birthDate:
                        Get.find<Allempolyeecontroller>().Birthdate.value,
                    placeOfBirth: Place_Of_Birth.text,
                    religion: add_controller.RealagonIndex,
                    mobileNumber: Mobile_Number.text,
                    bloodType: add_controller.BloodTypeIndex,
                    fatherName: Father_Name.text,
                    fatherPhone: Father_Phone.text,
                    motherName: Mother_Name.text,
                    currentAdress: Current_Address.text,
                    familystatus: add_controller.FamilyStateIndex,
                    password: Password.text,
                    classid: Get.find<Dropdownclassescontroller>()
                        .Allclass[
                            add_controller.Classlist.indexOf(add_controller.ClassIndex)]
                        .id,
                    divisionId: Get.find<Dropdowndivisioncontroller>().allDivision[add_controller.Divisionlist.indexOf(add_controller.DivisionIndex)].id,
                    fatherWork: Father_Work.text,
                    motherPhone: Mother_Phone.text,
                    motherWork: Mother_Work.text,
                    nationalNumber: National_ID.text,
                    localID: LocalID.text,
                    lastSchoolDetail: Last_School_Detail.text,
                    note: Note.text,
                    Fee_Discount: Fee_Discount.text,
                    specialNeeds: add_controller.isSpecialNeed.value,
                    martyrSon: add_controller.isMartySon.value,
                    FatherPassport: add_controller.selectedFatherPassport.value,
                    MotherPassport: add_controller.selectedMotherPassport.value,
                    SonPassport: add_controller.selectedSonPassport.value,
                    UserID: add_controller.selectedId.value,
                    Certefecate: add_controller.selectedCertificate.value,
                    Ispend: add_controller.isPendStudent.value,
                    Academic_sequence: add_controller.selectedtsalsol.value,
                    FamilyNotbook: add_controller.selectedFamilyBook.value,
                    file: add_controller.selectedImage.value);
              }
            },
            color: Get.theme.primaryColor,
            width: 120)
      ],
      contents: Edite_Students_page(
        First_Name: First_Name,
        Last_Name: Last_Name,
        Place_Of_Birth: Place_Of_Birth,
        Mobile_Number: Mobile_Number,
        Current_Address: Current_Address,
        National_ID: National_ID,
        Password: Password,
        Father_Name: Father_Name,
        Mother_Name: Mother_Name,
        Father_Phone: Father_Phone,
        Father_Work: Father_Work,
        Mother_Phone: Mother_Phone,
        Mother_Work: Mother_Work,
        Last_School_Detail: Last_School_Detail,
        Note: Note,
        LocalID: LocalID,
        Fee_Discount: Fee_Discount,
        username: username,
      ),
      apptitle: "Edit Student".tr,
      subtitle: "Edite".tr +
          " ${Controller.filteredStudents[idx].fullName}" +
          "Info".tr));

  await Getallclassapi.getAllClasses();
  await Get_Location_API.Get_Locations();
  add_controller.initialdata();
  add_controller.SetIsLoadingDivision(true);
  await Dropdowndivisionapi(context).Dropdowndivision(
      add_controller.Classlist.indexOf(isArabic
          ? Controller.student!.classes!.name.toString()
          : Controller.student!.classes!.enName.toString()),
      idx);
  add_controller.SetDivision(
      division: isArabic
          ? Controller.filteredStudents[idx].division!.name.toString()
          : Controller.filteredStudents[idx].division!.enName.toString());
}

class Edite_Students_page extends StatefulWidget {
  Edite_Students_page({
    super.key,
    required this.First_Name,
    required this.Last_Name,
    required this.Place_Of_Birth,
    required this.Mobile_Number,
    required this.Current_Address,
    required this.National_ID,
    required this.Password,
    required this.Father_Name,
    required this.Mother_Name,
    required this.Father_Phone,
    required this.Father_Work,
    required this.Mother_Phone,
    required this.Mother_Work,
    required this.LocalID,
    required this.Last_School_Detail,
    required this.Note,
    required this.Fee_Discount,
    required this.username,
  });

  TextEditingController First_Name;
  TextEditingController Last_Name;
  TextEditingController Place_Of_Birth;
  TextEditingController Mobile_Number;
  TextEditingController LocalID;
  TextEditingController Current_Address;
  TextEditingController National_ID;
  TextEditingController Password;
  TextEditingController Father_Name;
  TextEditingController Mother_Name;
  TextEditingController Father_Phone;
  TextEditingController Father_Work;
  TextEditingController Mother_Phone;
  TextEditingController Mother_Work;
  TextEditingController Last_School_Detail;
  TextEditingController Note;
  TextEditingController Fee_Discount;
  TextEditingController username;

  @override
  State<Edite_Students_page> createState() => _Edite_Students_pageState();
}

class _Edite_Students_pageState extends State<Edite_Students_page> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<Add_Students_Controller>(builder: (controller) {
          return Expanded(
            child: SizedBox(
              width: 620,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Obx(
                              () => GestureDetector(
                                onTap: () async {
                                  await controller.pickImage(context);
                                },
                                child: CircleAvatar(
                                  maxRadius: 100,
                                  backgroundColor: const Color(0xffC4C4C4),
                                  backgroundImage: controller
                                              .selectedImage.value !=
                                          null
                                      ? MemoryImage(
                                          controller.selectedImage.value!)
                                      : Get.find<Allstudentscontroller>()
                                                  .filteredStudents[Get.find<
                                                          Allstudentscontroller>()
                                                      .idx]
                                                  .fileId !=
                                              null
                                          ? NetworkImage(getimage +
                                              "${Get.find<Allstudentscontroller>().filteredStudents[Get.find<Allstudentscontroller>().idx].fileId}")
                                          : null,
                                  child: controller.selectedImage.value ==
                                              null &&
                                          Get.find<Allstudentscontroller>()
                                                  .filteredStudents[Get.find<
                                                          Allstudentscontroller>()
                                                      .idx]
                                                  .fileId ==
                                              null
                                      ? Text(
                                          Get.find<Allstudentscontroller>()
                                              .filteredStudents[Get.find<
                                                      Allstudentscontroller>()
                                                  .idx]
                                              .fullName!
                                              .substring(0, 1)
                                              .toUpperCase(),
                                          style: Get.textTheme.titleLarge!
                                              .copyWith(
                                            fontSize: 42,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      : null,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Textfildwithupper(
                              isRequired: true,
                              width: 300,
                              controller: widget.First_Name,
                              isError: controller.ISfirstNameError,
                              Uptext: "First Name".tr,
                              hinttext: "First Name".tr,
                              onChanged: (value) {
                                controller.updateFirstName(value);
                                controller.updateFieldError("first", false);
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 22.0),
                              child: Textfildwithupper(
                                isRequired: true,
                                width: 300,
                                controller: widget.Last_Name,
                                Uptext: "Last Name",
                                hinttext: "Last Name",
                                onChanged: (value) {
                                  controller.updateLastName(value);
                                  controller.updateFieldError("last", false);
                                },
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 22.0),
                      child: Row(
                        children: [
                          Textfildwithupper(
                              isRequired: true,
                              width: 300,
                              controller: widget.Place_Of_Birth,
                              isError: controller.IsPlaceOfBirthError,
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  controller.updateFieldError(
                                      "placeofbirth", false);
                                }
                              },
                              Uptext: "Place Of Birth".tr,
                              hinttext: "Place Of Birth".tr),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: prefs!.getString(languageKey) == 'ar'
                                      ? 0
                                      : 20.0,
                                  right: prefs!.getString(languageKey) == 'ar'
                                      ? 20.0
                                      : 0),
                              child: BirthDate(
                                isRequired: true,
                                isError: controller.IsBirthdateError,
                                Uptext: "Birthdate".tr,
                                width: 300,
                              ))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 22.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          DropdownAddStudents(
                              isLoading: false,
                              isError: controller.IsGenderError,
                              title: "Gender".tr,
                              width: 300,
                              type: "Gender"),
                          Padding(
                            padding: EdgeInsets.only(
                                left: prefs!.getString(languageKey) == 'ar'
                                    ? 0
                                    : 20.0,
                                right: prefs!.getString(languageKey) == 'ar'
                                    ? 20.0
                                    : 0),
                            child: DropdownAddStudents(
                                isLoading: false,
                                isError: controller.IsReligionError,
                                title: "Realagon".tr,
                                width: 300,
                                type: "Realagon"),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 22.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          DropdownAddStudents(
                              isLoading: false,
                              isError: controller.IsBloodError,
                              title: "Blood Type".tr,
                              width: 300,
                              type: "BloodType"),
                          Padding(
                            padding: EdgeInsets.only(
                                left: prefs!.getString(languageKey) == 'ar'
                                    ? 0
                                    : 20.0,
                                right: prefs!.getString(languageKey) == 'ar'
                                    ? 20.0
                                    : 0),
                            child: DropdownAddStudents(
                                isLoading: controller.isLoadingLocation,
                                title: "Location".tr,
                                isError: controller.IsCountryError,
                                width: 300,
                                type: "Location"),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 22.0),
                      child: Row(
                        children: [
                          Textfildwithupper(
                              isRequired: true,
                              width: 300,
                              fieldType: "phone",
                              isError: controller.ISphoneError,
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  controller.updateFieldError("phone", false);
                                }
                              },
                              controller: widget.Mobile_Number,
                              Uptext: "Mobile Number".tr,
                              hinttext: "Mobile Number".tr),
                          Padding(
                            padding: EdgeInsets.only(
                                left: prefs!.getString(languageKey) == 'ar'
                                    ? 0
                                    : 20.0,
                                right: prefs!.getString(languageKey) == 'ar'
                                    ? 20.0
                                    : 0),
                            child: Textfildwithupper(
                                isRequired: true,
                                width: 300,
                                isError: controller.ISLocalNationalIDError,
                                onChanged: (value) {
                                  if (value.isNotEmpty) {
                                    controller.updateFieldError(
                                        "localnational", false);
                                  }
                                },
                                controller: widget.LocalID,
                                Uptext: "Local ID".tr,
                                hinttext: "Local ID".tr),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 22.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          DropdownAddStudents(
                              isLoading: false,
                              title: "Family State".tr,
                              width: 620,
                              type: "FamilyState"),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 22.0),
                      child: Row(
                        children: [
                          Textfildwithupper(
                              isRequired: false,
                              width: 300,
                              controller: widget.National_ID,
                              Uptext: "National Id".tr,
                              hinttext: "National Id".tr),
                          Padding(
                            padding: EdgeInsets.only(
                                left: prefs!.getString(languageKey) == 'ar'
                                    ? 0
                                    : 20.0,
                                right: prefs!.getString(languageKey) == 'ar'
                                    ? 20.0
                                    : 0),
                            child: Textfildwithupper(
                                isRequired: true,
                                width: 300,
                                isError: controller.ISLocalAddressError,
                                onChanged: (value) {
                                  if (value.isNotEmpty) {
                                    controller.updateFieldError(
                                        "localaddress", false);
                                  }
                                },
                                controller: widget.Current_Address,
                                Uptext: "Current Address".tr,
                                hinttext: "Current Address".tr),
                          )
                        ],
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 22.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Obx(() => Checkbox(
                                            value:
                                                controller.isSpecialNeed.value,
                                            onChanged: (value) {
                                              controller
                                                  .toggleSpecialNeed(value!);
                                            },
                                          )),
                                      Text("Special need".tr,
                                          style: Get.theme.textTheme.bodyMedium!
                                              .copyWith(fontSize: 16)),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Obx(() => Checkbox(
                                            value: controller.isMartySon.value,
                                            onChanged: (value) {
                                              controller.toggleMartySon(value!);
                                            },
                                          )),
                                      Text("Marty son".tr,
                                          style: Get.theme.textTheme.bodyMedium!
                                              .copyWith(fontSize: 16)),
                                    ],
                                  ),
                                ]),
                            Row(
                              children: [
                                Obx(() => Row(
                                      children: [
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5))),
                                              backgroundColor: controller
                                                      .isPendStudent.value
                                                  ? Get.theme.primaryColor
                                                  : Get.theme.disabledColor),
                                          onPressed: () {
                                            if (!controller
                                                .isPendStudent.value) {
                                              Get.defaultDialog(
                                                radius: 5,
                                                contentPadding:
                                                    EdgeInsets.all(20.0),
                                                title: "Pend Student".tr,
                                                middleText: "Do You Want To Pend "
                                                        .tr +
                                                    "(${widget.First_Name.text} ${widget.Last_Name.text})" +
                                                    "Student?".tr,
                                                confirm: ElevatedButton(
                                                  onPressed: () {
                                                    controller
                                                        .togglePindStudent(
                                                            true);
                                                    Get.back();
                                                  },
                                                  child: Text("Yes".tr),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                              Color(0xffB03D3D),
                                                          foregroundColor:
                                                              Colors.white),
                                                ),
                                                cancel: ElevatedButton(
                                                  onPressed: () {
                                                    Get.back();
                                                  },
                                                  child: Text("No".tr),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                              Get.theme
                                                                  .primaryColor,
                                                          foregroundColor:
                                                              Colors.white),
                                                ),
                                              );
                                            } else {
                                              Get.defaultDialog(
                                                title: "UnPend Student".tr,
                                                radius: 5,
                                                contentPadding:
                                                    EdgeInsets.all(20.0),
                                                middleText: "Do You Want To UnPend"
                                                        .tr +
                                                    " ( ${widget.First_Name.text} ${widget.Last_Name.text} )" +
                                                    "Student?",
                                                confirm: ElevatedButton(
                                                  onPressed: () {
                                                    controller
                                                        .togglePindStudent(
                                                            false);
                                                    Get.back();
                                                  },
                                                  child: Text("Yes".tr),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                              Color(0xffB03D3D),
                                                          foregroundColor:
                                                              Colors.white),
                                                ),
                                                cancel: ElevatedButton(
                                                  onPressed: () {
                                                    Get.back();
                                                  },
                                                  child: Text("No".tr),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                              Get.theme
                                                                  .primaryColor,
                                                          foregroundColor:
                                                              Colors.white),
                                                ),
                                              );
                                            }
                                          },
                                          child: Row(
                                            children: [
                                              Icon(
                                                  color: Colors.white,
                                                  controller.isPendStudent.value
                                                      ? Icons.lock_open_outlined
                                                      : Icons.lock),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0, right: 8.0),
                                                child: Text(
                                                  controller.isPendStudent.value
                                                      ? "UnPend This Student".tr
                                                      : "Pend Student".tr,
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )),
                              ],
                            )
                          ],
                        )),
                    Padding(
                        padding: const EdgeInsets.only(top: 22.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: Get.theme.primaryColor,
                                height: 1,
                              ),
                            ),
                            Text(
                              "   Student School Info   ".tr,
                              style: Get.theme.textTheme.titleMedium!
                                  .copyWith(fontSize: 18),
                            ),
                            Expanded(
                              child: Divider(
                                color: Get.theme.primaryColor,
                                height: 1,
                              ),
                            ),
                          ],
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 22.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          DropdownAddStudents(
                              isLoading: controller.isLoadingClass,
                              isError: controller.ISclassError,
                              title: "Class".tr,
                              width: 300,
                              type: "Class"),
                          Padding(
                            padding: EdgeInsets.only(
                                left: prefs!.getString(languageKey) == 'ar'
                                    ? 0
                                    : 20.0,
                                right: prefs!.getString(languageKey) == 'ar'
                                    ? 20.0
                                    : 0),
                            child: DropdownAddStudents(
                                isLoading: controller.isLoadingDivision,
                                isDisabled:
                                    controller.ClassIndex == "" ? true : false,
                                isError: controller.ISDivisionError,
                                title: "Division".tr,
                                width: 300,
                                type: "Division"),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 22.0),
                      child: Row(
                        children: [
                          Textfildwithupper(
                            readOnly: true,
                            isRequired: true,
                            width: 300,
                            controller: widget.username,
                            Uptext: "Username".tr,
                            hinttext: "Username".tr,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: prefs!.getString(languageKey) == 'ar'
                                    ? 0
                                    : 20.0,
                                right: prefs!.getString(languageKey) == 'ar'
                                    ? 20.0
                                    : 0),
                            child: Textfildwithupper(
                                isRequired: true,
                                width: 300,
                                isError: controller.ISpasswordError,
                                onChanged: (value) {
                                  if (value.isNotEmpty) {
                                    controller.updateFieldError(
                                        "password", false);
                                  }
                                },
                                controller: widget.Password,
                                Uptext: "Password".tr,
                                hinttext: "Password".tr),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 22.0),
                      child: Row(
                        children: [
                          Textfildwithupper(
                              isRequired: false,
                              width: 300,
                              controller: widget.Fee_Discount,
                              Uptext: "Fee Discount".tr,
                              hinttext: "Fee Discount".tr)
                        ],
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 22.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: Get.theme.primaryColor,
                                height: 1,
                              ),
                            ),
                            Text(
                              "   Father Info   ".tr,
                              style: Get.theme.textTheme.titleMedium!
                                  .copyWith(fontSize: 18),
                            ),
                            Expanded(
                              child: Divider(
                                color: Get.theme.primaryColor,
                                height: 1,
                              ),
                            ),
                          ],
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        children: [
                          Textfildwithupper(
                              isRequired: true,
                              width: 300,
                              isError: controller.ISFatherNameError,
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  controller.updateFieldError(
                                      "fathername", false);
                                }
                              },
                              controller: widget.Father_Name,
                              Uptext: "Father Name".tr,
                              hinttext: "Father Name".tr),
                          Padding(
                            padding: EdgeInsets.only(
                                left: prefs!.getString(languageKey) == 'ar'
                                    ? 0
                                    : 20.0,
                                right: prefs!.getString(languageKey) == 'ar'
                                    ? 20.0
                                    : 0),
                            child: Textfildwithupper(
                                isRequired: true,
                                width: 300,
                                isError: controller.ISFatherphoneError,
                                onChanged: (value) {
                                  if (value.isNotEmpty) {
                                    controller.updateFieldError(
                                        "fatherphone", false);
                                  }
                                },
                                fieldType: "phone",
                                controller: widget.Father_Phone,
                                Uptext: "Father Phone".tr,
                                hinttext: "Father Phone".tr),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 22.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Textfildwithupper(
                              width: 300,
                              controller: widget.Father_Work,
                              Uptext: "Father Work".tr,
                              hinttext: "Father Work".tr),
                        ],
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 22.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: Get.theme.primaryColor,
                                height: 1,
                              ),
                            ),
                            Text(
                              "   Mother Info   ".tr,
                              style: Get.theme.textTheme.titleMedium!
                                  .copyWith(fontSize: 18),
                            ),
                            Expanded(
                              child: Divider(
                                color: Get.theme.primaryColor,
                                height: 1,
                              ),
                            ),
                          ],
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        children: [
                          Textfildwithupper(
                              isRequired: true,
                              width: 300,
                              controller: widget.Mother_Name,
                              isError: controller.ISMotherNameError,
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  controller.updateFieldError(
                                      "mothername", false);
                                }
                              },
                              Uptext: "Mother Name".tr,
                              hinttext: "Mother Name".tr),
                          Padding(
                            padding: EdgeInsets.only(
                                left: prefs!.getString(languageKey) == 'ar'
                                    ? 0
                                    : 20.0,
                                right: prefs!.getString(languageKey) == 'ar'
                                    ? 20.0
                                    : 0),
                            child: Textfildwithupper(
                                isRequired: false,
                                width: 300,
                                fieldType: "phone",
                                isError: controller.ISMotherPhoneError,
                                onChanged: (value) {
                                  if (value.isNotEmpty) {
                                    controller.updateFieldError(
                                        "motherphone", false);
                                  }
                                },
                                controller: widget.Mother_Phone,
                                Uptext: "Mother Phone".tr,
                                hinttext: "Mother Phone".tr),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 22.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Textfildwithupper(
                              width: 300,
                              controller: widget.Mother_Work,
                              Uptext: "Mother Work".tr,
                              hinttext: "Mother Work".tr),
                        ],
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 22.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: Get.theme.primaryColor,
                                height: 1,
                              ),
                            ),
                            Text(
                              "   More Info   ".tr,
                              style: Get.theme.textTheme.titleMedium!
                                  .copyWith(fontSize: 18),
                            ),
                            Expanded(
                              child: Divider(
                                color: Get.theme.primaryColor,
                                height: 1,
                              ),
                            ),
                          ],
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 22.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          LargeTextField(
                              width: 620,
                              controller: widget.Last_School_Detail,
                              hinttext: "Last School Detail".tr),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 22.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          LargeTextField(
                              width: 620,
                              controller: widget.Note,
                              hinttext: "Note".tr),
                        ],
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 22.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: Get.theme.primaryColor,
                                height: 1,
                              ),
                            ),
                            Text(
                              "   File Data   ".tr,
                              style: Get.theme.textTheme.titleMedium!
                                  .copyWith(fontSize: 18),
                            ),
                            Expanded(
                              child: Divider(
                                color: Get.theme.primaryColor,
                                height: 1,
                              ),
                            ),
                          ],
                        )),
                    Drop_Edite_students()
                  ],
                ),
              ),
            ),
          );
        }),
      ],
    );
  }
}
