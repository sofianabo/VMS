import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/AllEmpolyeeController.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Add_Students_Controller.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/view/Admin/Students_Manager/Edite_Students_Drop_Files.dart';
import 'package:vms_school/widgets/LargeTextField.dart';
import 'package:vms_school/widgets/TextFildWithUpper.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';
import '../../../Link/Controller/AdminController/Students_Controllers/AllStudentsController.dart';

EditStudentDialogForGua(
    BuildContext context, bool canEdit, bool isRequest) async {
  final Controller = Get.find<Allstudentscontroller>();
  final add_controller = Get.find<Add_Students_Controller>();
  final Allempolyeecontrollers = Get.find<Allempolyeecontroller>();
  final isArabic =
      Get.find<LocalizationController>().currentLocale.value.languageCode ==
          'ar';
  add_controller.Initial();
  TextEditingController First_Name =
      TextEditingController(text: Controller.student!.firstName);
  TextEditingController Last_Name =
      TextEditingController(text: Controller.student!.lastName);
  TextEditingController Place_Of_Birth =
      TextEditingController(text: Controller.student!.placeOfBirth);
  TextEditingController Mobile_Number =
      TextEditingController(text: Controller.student!.mobileNumber);
  TextEditingController Current_Address =
      TextEditingController(text: Controller.student!.currentAdress);
  TextEditingController National_ID =
      TextEditingController(text: Controller.student!.nationalNumber);
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

  TextEditingController Birthdate =
      TextEditingController(text: Controller.student!.birthDate);
  TextEditingController Class = TextEditingController(
      text: isArabic
          ? Controller.student?.classes?.name ?? ""
          : Controller.student?.classes?.enName ?? "");
  TextEditingController Division = TextEditingController(
      text: isArabic
          ? Controller.student?.division?.name ?? ""
          : Controller.student?.division?.enName ?? "");

  TextEditingController Gender =
      TextEditingController(text: Controller.student!.gender!.tr);

  TextEditingController Realagon =
      TextEditingController(text: Controller.student!.religion!.tr);

  TextEditingController Blood_Type =
      TextEditingController(text: Controller.student!.bloodType);

  TextEditingController Location = TextEditingController(
      text: isArabic
          ? Controller.student!.location?.name
          : Controller.student!.location?.enName);

  TextEditingController Family_State =
      TextEditingController(text: Controller.student!.familystatus!.tr);

  TextEditingController username =
      TextEditingController(text: Controller.student!.userName);

  add_controller.selectedImage.value = null;
  add_controller.set_Edite_Data(
      isPendStudents: false,
      DivisionIndexs: !canEdit
          ? isArabic
              ? Controller.student!.division?.name ?? ""
              : Controller.student!.division?.enName ?? ""
          : "",
      BloodTypeindex: Controller.student!.bloodType,
      Classindex: !canEdit
          ? isArabic
              ? Controller.student!.classes?.name ?? ""
              : Controller.student!.classes?.enName ?? ""
          : "",
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
        // ButtonDialog(
        //     text: "Update Student".tr,
        //     onPressed: () async {
        //       bool isgenderEmpty = Get.find<Add_Students_Controller>()
        //               .selectedGenderIndex
        //               .isEmpty ||
        //           Get.find<Add_Students_Controller>().selectedGenderIndex == "";
        //
        //       bool isreligionEmpty = Get.find<Add_Students_Controller>()
        //               .selectedRealagonIndex
        //               .isEmpty ||
        //           Get.find<Add_Students_Controller>().selectedRealagonIndex ==
        //               "";
        //       bool isbloodEmpty = Get.find<Add_Students_Controller>()
        //               .selectedBloodTypeIndex
        //               .isEmpty ||
        //           Get.find<Add_Students_Controller>().selectedBloodTypeIndex ==
        //               "";
        //       bool iscountryEmpty = Get.find<Add_Students_Controller>()
        //               .selectedLocationIndex
        //               .isEmpty ||
        //           Get.find<Add_Students_Controller>().selectedLocationIndex ==
        //               "";
        //
        //       bool isFirstNameEmpty = First_Name.text.trim().isEmpty;
        //       bool isLastNameEmpty = Last_Name.text.trim().isEmpty;
        //       bool isPlaceofBirthEmpty = Place_Of_Birth.text.trim().isEmpty;
        //       bool isphoneEmpty = Mobile_Number.text.trim().isEmpty;
        //       bool isLocalIDEmpty = LocalID.text.trim().isEmpty;
        //       bool isAddressEmpty = Current_Address.text.trim().isEmpty;
        //       bool isusernameEmpty =
        //           add_controller.textController.text.trim().isEmpty;
        //       bool isfathernameEmpty = Father_Name.text.trim().isEmpty;
        //       bool isFatherPhoneEmpty = Father_Phone.text.trim().isEmpty;
        //       bool isMotherNameEmpty = Mother_Name.text.trim().isEmpty;
        //       bool ismotehrPhoneEmpty = Mother_Phone.text.trim().isEmpty;
        //
        //       bool isbirthdateEmpty =
        //           Get.find<Allempolyeecontroller>().Birthdate.value == null;
        //
        //       add_controller.updateFieldError("first", isFirstNameEmpty);
        //       add_controller.updateFieldError("last", isLastNameEmpty);
        //       add_controller.updateFieldError("birthdate", isbirthdateEmpty);
        //       add_controller.updateFieldError(
        //           "placeofbirth", isPlaceofBirthEmpty);
        //       add_controller.updateFieldError("gender", isgenderEmpty);
        //       add_controller.updateFieldError("religion", isreligionEmpty);
        //       add_controller.updateFieldError("blood", isbloodEmpty);
        //       add_controller.updateFieldError("country", iscountryEmpty);
        //       add_controller.updateFieldError("phone", isphoneEmpty);
        //       add_controller.updateFieldError("localnational", isLocalIDEmpty);
        //
        //       add_controller.updateFieldError("localaddress", isAddressEmpty);
        //       add_controller.updateFieldError("username", isusernameEmpty);
        //       add_controller.updateFieldError("fathername", isfathernameEmpty);
        //       add_controller.updateFieldError(
        //           "fatherphone", isFatherPhoneEmpty);
        //       add_controller.updateFieldError("mothername", isMotherNameEmpty);
        //       add_controller.updateFieldError(
        //           "motherphone", ismotehrPhoneEmpty);
        //       if ((isFirstNameEmpty ||
        //           isLastNameEmpty ||
        //           isbirthdateEmpty ||
        //           isPlaceofBirthEmpty ||
        //           isgenderEmpty ||
        //           isreligionEmpty ||
        //           isbloodEmpty ||
        //           iscountryEmpty ||
        //           isphoneEmpty ||
        //           isLocalIDEmpty ||
        //           isAddressEmpty ||
        //           isusernameEmpty ||
        //           isfathernameEmpty ||
        //           isFatherPhoneEmpty ||
        //           isMotherNameEmpty ||
        //           ismotehrPhoneEmpty)) {
        //         await Update_Student_API.Update_Student(
        //             Academic_sequence_FileID:
        //                 Controller.student!.documantes!.academicSequence?.id,
        //             Certefecate_FileID:
        //                 Controller.student!.documantes!.certificate?.id,
        //             FamilyNotbook_FileID:
        //                 Controller.student!.documantes!.familyNotebook?.id,
        //             FatherPassport_FileID:
        //                 Controller.student!.documantes!.fatherPassport?.id,
        //             MotherPassport_FileID:
        //                 Controller.student!.documantes!.motherPassport?.id,
        //             SonPassport_FileID:
        //                 Controller.student!.documantes!.sonPassport?.id,
        //             studentID: Controller.student!.id,
        //             UserID_FileID: Controller.student!.documantes!.userID?.id,
        //             locationId: Get.find<Location_controller>()
        //                 .location![add_controller.Locationlist.indexOf(
        //                     add_controller.LocationIndex)]
        //                 .id,
        //             firstName: First_Name.text,
        //             lastName: Last_Name.text,
        //             gender: add_controller.GenderIndex,
        //             birthDate:
        //                 Get.find<Allempolyeecontroller>().Birthdate.value,
        //             placeOfBirth: Place_Of_Birth.text,
        //             religion: add_controller.RealagonIndex,
        //             mobileNumber: Mobile_Number.text,
        //             bloodType: add_controller.BloodTypeIndex,
        //             fatherName: Father_Name.text,
        //             fatherPhone: Father_Phone.text,
        //             motherName: Mother_Name.text,
        //             currentAdress: Current_Address.text,
        //             familystatus: add_controller.FamilyStateIndex,
        //             fatherWork: Father_Work.text,
        //             motherPhone: Mother_Phone.text,
        //             motherWork: Mother_Work.text,
        //             nationalNumber: National_ID.text,
        //             localID: LocalID.text,
        //             lastSchoolDetail: Last_School_Detail.text,
        //             note: Note.text,
        //             Fee_Discount: Fee_Discount.text,
        //             specialNeeds: add_controller.isSpecialNeed.value,
        //             martyrSon: add_controller.isMartySon.value,
        //             FatherPassport: add_controller.selectedFatherPassport.value,
        //             MotherPassport: add_controller.selectedMotherPassport.value,
        //             SonPassport: add_controller.selectedSonPassport.value,
        //             UserID: add_controller.selectedId.value,
        //             Certefecate: add_controller.selectedCertificate.value,
        //             Ispend: add_controller.isPendStudent.value,
        //             Academic_sequence: add_controller.selectedtsalsol.value,
        //             FamilyNotbook: add_controller.selectedFamilyBook.value,
        //             file: add_controller.selectedImage.value);
        //       }
        //     },
        //     color: Get.theme.primaryColor,
        //     width: 120)
      ],
      contents: Edite_Students_page(
        canEdit: canEdit,
        First_Name: First_Name,
        Last_Name: Last_Name,
        Place_Of_Birth: Place_Of_Birth,
        Mobile_Number: Mobile_Number,
        Current_Address: Current_Address,
        National_ID: National_ID,
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
        Birthdate: Birthdate,
        Class: Class,
        Division: Division,
        Gender: Gender,
        Realagon: Realagon,
        Blood_Type: Blood_Type,
        Location: Location,
        Family_State: Family_State,
      ),
      apptitle: isRequest ? "Request Information".tr : "Student Information".tr,
      subtitle:
          "${Controller.student!.firstName} ${Controller.student!.lastName}" +
              "Info".tr));

  add_controller.initialdata();
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
    required this.Birthdate,
    required this.Class,
    required this.Division,
    required this.Gender,
    required this.Realagon,
    required this.Blood_Type,
    required this.Location,
    required this.Family_State,
    required this.canEdit,
  });

  bool canEdit;
  TextEditingController First_Name;
  TextEditingController Last_Name;
  TextEditingController Place_Of_Birth;
  TextEditingController Mobile_Number;
  TextEditingController LocalID;
  TextEditingController Current_Address;
  TextEditingController National_ID;
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

  TextEditingController Birthdate;
  TextEditingController Class;
  TextEditingController Division;

  TextEditingController Gender;
  TextEditingController Realagon;
  TextEditingController Blood_Type;
  TextEditingController Location;
  TextEditingController Family_State;

  @override
  State<Edite_Students_page> createState() => _Edite_Students_pageState();
}

class _Edite_Students_pageState extends State<Edite_Students_page> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    double smallwidth = width >= 720 ? 300 : (width) - 20;
    return Column(
      children: [
        GetBuilder<Add_Students_Controller>(builder: (controller) {
          return Expanded(
            child: SizedBox(
              width: width.clamp(width * 0.3, 620),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 620,
                      child: Wrap(
                        alignment: width <= 690
                            ? WrapAlignment.center
                            : WrapAlignment.spaceBetween,
                        runAlignment: width <= 690
                            ? WrapAlignment.center
                            : WrapAlignment.spaceBetween,
                        spacing: 22.0,
                        runSpacing: 22.0,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  if (widget.canEdit) {
                                    await controller.pickImage(context);
                                  }
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
                                                  .student!
                                                  .fileId !=
                                              null
                                          ? NetworkImage(getimage +
                                              "${Get.find<Allstudentscontroller>().student!.fileId}")
                                          : null,
                                  child:
                                      controller.selectedImage.value == null &&
                                              Get.find<Allstudentscontroller>()
                                                      .student!
                                                      .fileId ==
                                                  null
                                          ? Text(
                                              Get.find<Allstudentscontroller>()
                                                  .student!
                                                  .firstName!
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
                              )
                            ],
                          ),
                          Column(
                            spacing: 5.0,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Textfildwithupper(
                                enabled: widget.canEdit,
                                width: smallwidth,
                                controller: widget.First_Name,
                                isError: controller.ISfirstNameError,
                                Uptext: "First Name".tr,
                                hinttext: "First Name".tr,
                                onChanged: (value) {
                                  controller.updateFirstName(value);
                                  controller.updateFieldError("first", false);
                                },
                              ),
                              Textfildwithupper(
                                enabled: widget.canEdit,
                                width: smallwidth,
                                controller: widget.Last_Name,
                                Uptext: "Last Name".tr,
                                hinttext: "Last Name".tr,
                                onChanged: (value) {
                                  controller.updateLastName(value);
                                  controller.updateFieldError("last", false);
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Wrap(
                        spacing: 20.0,
                        runSpacing: 20.0,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Textfildwithupper(
                              enabled: widget.canEdit,
                              width: smallwidth,
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
                          Textfildwithupper(
                              enabled: widget.canEdit,
                              width: smallwidth,
                              controller: widget.Birthdate,
                              Uptext: "Place Of Birth".tr,
                              hinttext: "Place Of Birth".tr),
                        ],
                      ),
                    ),
                    Wrap(
                      spacing: 20.0,
                      runSpacing: 20.0,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Textfildwithupper(
                            enabled: widget.canEdit,
                            width: smallwidth,
                            controller: widget.Gender,
                            Uptext: "Gender".tr,
                            hinttext: "Gender".tr),
                        Textfildwithupper(
                            enabled: widget.canEdit,
                            width: smallwidth,
                            controller: widget.Realagon,
                            Uptext: "Realagon".tr,
                            hinttext: "Realagon".tr),
                      ],
                    ),
                    Wrap(
                      spacing: 20.0,
                      runSpacing: 20.0,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Textfildwithupper(
                            enabled: widget.canEdit,
                            width: smallwidth,
                            controller: widget.Blood_Type,
                            Uptext: "Blood Type".tr,
                            hinttext: "Blood Type".tr),
                        Textfildwithupper(
                            enabled: widget.canEdit,
                            width: smallwidth,
                            controller: widget.Location,
                            Uptext: "Location".tr,
                            hinttext: "Location".tr)
                      ],
                    ),
                    Wrap(
                      spacing: 20.0,
                      runSpacing: 20.0,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Textfildwithupper(
                            enabled: widget.canEdit,
                            width: smallwidth,
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
                        Textfildwithupper(
                            enabled: widget.canEdit,
                            width: smallwidth,
                            controller: widget.LocalID,
                            Uptext: "Local ID".tr,
                            hinttext: "Local ID".tr)
                      ],
                    ),
                    Wrap(
                      spacing: 20.0,
                      runSpacing: 20.0,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Textfildwithupper(
                            enabled: widget.canEdit,
                            width: width <= 690 ? smallwidth : 620,
                            controller: widget.Family_State,
                            Uptext: "Family State".tr,
                            hinttext: "Family State".tr),
                      ],
                    ),
                    Wrap(
                      spacing: 20.0,
                      runSpacing: 20.0,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Textfildwithupper(
                            enabled: widget.canEdit,
                            isRequired: false,
                            width: smallwidth,
                            controller: widget.National_ID,
                            Uptext: "National Id".tr,
                            hinttext: "National Id".tr),
                        Textfildwithupper(
                            enabled: widget.canEdit,
                            width: smallwidth,
                            isError: controller.ISLocalAddressError,
                            controller: widget.Current_Address,
                            Uptext: "Current Address".tr,
                            hinttext: "Current Address".tr)
                      ],
                    ),
                    Wrap(
                      spacing: 20.0,
                      runSpacing: 20.0,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      alignment: WrapAlignment.spaceBetween,
                      runAlignment: WrapAlignment.spaceBetween,
                      children: [
                        Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                    value: controller.isSpecialNeed.value,
                                    onChanged: (value) {},
                                  ),
                                  Text("Special need".tr,
                                      style: Get.theme.textTheme.bodyMedium!
                                          .copyWith(fontSize: 16)),
                                ],
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    value: controller.isMartySon.value,
                                    onChanged: (value) {},
                                  ),
                                  Text("Marty son".tr,
                                      style: Get.theme.textTheme.bodyMedium!
                                          .copyWith(fontSize: 16)),
                                ],
                              ),
                            ]),
                      ],
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 10.0),
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
                    Wrap(
                      spacing: 20.0,
                      runSpacing: 20.0,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Textfildwithupper(
                            enabled: widget.canEdit,
                            isRequired: false,
                            width: smallwidth,
                            controller: widget.Class,
                            Uptext: "Class".tr,
                            hinttext: "Class".tr),
                        Textfildwithupper(
                            enabled: widget.canEdit,
                            width: smallwidth,
                            controller: widget.Division,
                            Uptext: "Division".tr,
                            hinttext: "Division".tr)
                      ],
                    ),
                    Wrap(
                      spacing: 20.0,
                      runSpacing: 20.0,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Textfildwithupper(
                          enabled: widget.canEdit,
                          width: smallwidth,
                          controller: widget.username,
                          Uptext: "Username".tr,
                          hinttext: "Username".tr,
                        ),
                        Textfildwithupper(
                            enabled: widget.canEdit,
                            isRequired: false,
                            width: smallwidth,
                            controller: widget.Fee_Discount,
                            Uptext: "Fee Discount".tr,
                            hinttext: "Fee Discount".tr)
                      ],
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 10.0),
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
                    Wrap(
                      spacing: 20.0,
                      runSpacing: 20.0,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Textfildwithupper(
                            enabled: widget.canEdit,
                            width: smallwidth,
                            isError: controller.ISFatherNameError,
                            controller: widget.Father_Name,
                            Uptext: "Father Name".tr,
                            hinttext: "Father Name".tr),
                        Textfildwithupper(
                            enabled: widget.canEdit,
                            width: smallwidth,
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
                            hinttext: "Father Phone".tr)
                      ],
                    ),
                    Wrap(
                      spacing: 20.0,
                      runSpacing: 20.0,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Textfildwithupper(
                            enabled: widget.canEdit,
                            width: smallwidth,
                            controller: widget.Father_Work,
                            Uptext: "Father Work".tr,
                            hinttext: "Father Work".tr),
                      ],
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
                    Wrap(
                      spacing: 20.0,
                      runSpacing: 20.0,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Textfildwithupper(
                            enabled: widget.canEdit,
                            width: smallwidth,
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
                        Textfildwithupper(
                            enabled: widget.canEdit,
                            isRequired: false,
                            width: smallwidth,
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
                            hinttext: "Mother Phone".tr)
                      ],
                    ),
                    Wrap(
                      spacing: 20.0,
                      runSpacing: 20.0,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Textfildwithupper(
                            enabled: widget.canEdit,
                            width: smallwidth,
                            controller: widget.Mother_Work,
                            Uptext: "Mother Work".tr,
                            hinttext: "Mother Work".tr),
                      ],
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
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        LargeTextField(
                            readOnly: !widget.canEdit,
                            width: width >= 720 ? 620 : (width) - 70,
                            controller: widget.Last_School_Detail,
                            hinttext: "Last School Detail".tr),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        LargeTextField(
                            readOnly: !widget.canEdit,
                            width: width >= 720 ? 620 : (width) - 70,
                            controller: widget.Note,
                            hinttext: "Note".tr),
                      ],
                    ),
                    Row(
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
                    ),
                    Drop_Edite_students(
                      isAdmin: widget.canEdit,
                    )
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
