import 'package:dio/dio.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Illness_APIs/Get_All_Illness_API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Vaccines_APIs/Get_All_Vaccines_API.dart';
import 'package:vms_school/Link/API/AdminAPI/Students/Students_APIs/Add_Students_API.dart';
import 'package:vms_school/Link/API/AdminAPI/Location_API/Locations_API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_DropDown/DropdownClassesAPI.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/AllEmpolyeeController.dart';
import 'package:vms_school/Link/Controller/AdminController/Location_controller.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Illness_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Vaccines_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Add_Students_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/allGaurdianController.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownClassesController.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownDivisionController.dart';
import 'package:vms_school/Link/Functions/Students_Illness_Funcation.dart';
import 'package:vms_school/Link/Functions/Students_Vaccines_Funcation.dart';
import 'package:vms_school/Link/Model/AdminModel/Students_Models/allGuardianModel.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/view/Both_Platform/widgets/Admin/Admin_Students/DropDown_Add_Students.dart';
import 'package:vms_school/view/Both_Platform/widgets/ButtonsDialog.dart';
import 'package:vms_school/view/Both_Platform/widgets/Calender.dart';
import 'package:vms_school/view/Both_Platform/widgets/GridAnimation.dart';
import 'package:vms_school/view/Both_Platform/widgets/LargeTextField.dart';
import 'package:vms_school/view/Both_Platform/widgets/Loading_Dialog.dart';
import 'package:vms_school/view/Both_Platform/widgets/TextFildWithUpper.dart';
import 'package:vms_school/view/Both_Platform/widgets/TextFormSearch.dart';
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';

Add_Students_Dialog_Functions() async {
  final Allgaurdiancontroller c = Get.find<Allgaurdiancontroller>();
  Dio dio = Dio();
  try {
    CancelToken cancelToken = CancelToken();
    Loading_Dialog(cancelToken: cancelToken);
    c.setIsLoading(true);
    String myurl = "${hostPort}${getguardians}";
    var response = await dio.get(
        cancelToken: cancelToken, myurl, options: getDioOptions());
    if (response.statusCode == 200) {
      AllGuardianModel Gardians = AllGuardianModel.fromJson(response.data);
      c.setallGaurdian(Gardians);
      Get.back();
      Get_Location_API.Get_Locations();
      Getallclassapi.getAllClasses();
      Get.dialog(AllGuardiansDialog(), barrierDismissible: false);
    } else {
      ErrorHandler.handleDioError(DioError(
        requestOptions: response.requestOptions,
        response: response,
        type: DioErrorType.badResponse,
      ));
    }
  } catch (e) {
    if (e is DioError) {
      ErrorHandler.handleDioError(e);
    } else if (e is Exception) {
      ErrorHandler.handleException(e);
    } else {
      ErrorHandler.handleException(Exception(e.toString()));
    }
  }
}

class AllGuardiansDialog extends StatefulWidget {
  const AllGuardiansDialog({Key? key}) : super(key: key);

  @override
  _AllGuardiansDialogState createState() => _AllGuardiansDialogState();
}

class _AllGuardiansDialogState extends State<AllGuardiansDialog> {
  // Controllers
  late TextEditingController _searchController;
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _placeOfBirthController;
  late TextEditingController _mobileNumberController;
  late TextEditingController _currentAddressController;
  late TextEditingController _nationalIdController;
  late TextEditingController _passwordController;
  late TextEditingController _fatherNameController;
  late TextEditingController _motherNameController;
  late TextEditingController _fatherPhoneController;
  late TextEditingController _fatherWorkController;
  late TextEditingController _motherPhoneController;
  late TextEditingController _motherWorkController;
  late TextEditingController _lastSchoolDetailController;
  late TextEditingController _localIdController;
  late TextEditingController _noteController;
  late TextEditingController _feeDiscountController;
  late TextEditingController _idHistController;

  // Other variables
  final _addStudentsController = Get.put(Add_Students_Controller());
  late Dropdownclassescontroller _classController;
  late Allgaurdiancontroller _guardianController;
  late Allempolyeecontroller _employeeController;
  late Location_controller _locationController;
  late Dropdowndivisioncontroller _divisionController;
  late Illness_Controller _illnessController;
  late Vaccines_Controller _vaccinesController;

  @override
  void initState() {
    super.initState();
    _initializeControllers();
    _resetData();
  }

  void _initializeControllers() {
    _searchController = TextEditingController();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _placeOfBirthController = TextEditingController();
    _mobileNumberController = TextEditingController();
    _currentAddressController = TextEditingController();
    _nationalIdController = TextEditingController();
    _passwordController = TextEditingController();
    _fatherNameController = TextEditingController();
    _motherNameController = TextEditingController();
    _fatherPhoneController = TextEditingController();
    _fatherWorkController = TextEditingController();
    _motherPhoneController = TextEditingController();
    _motherWorkController = TextEditingController();
    _lastSchoolDetailController = TextEditingController();
    _localIdController = TextEditingController();
    _noteController = TextEditingController();
    _feeDiscountController = TextEditingController();
    _idHistController = TextEditingController();

    _classController = Get.find<Dropdownclassescontroller>();
    _guardianController = Get.find<Allgaurdiancontroller>();
    _employeeController = Get.find<Allempolyeecontroller>();
    _locationController = Get.find<Location_controller>();
    _divisionController = Get.find<Dropdowndivisioncontroller>();
    _illnessController = Get.find<Illness_Controller>();
    _vaccinesController = Get.find<Vaccines_Controller>();
  }

  void _resetData() {
    _addStudentsController.resetData();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _placeOfBirthController.dispose();
    _mobileNumberController.dispose();
    _currentAddressController.dispose();
    _nationalIdController.dispose();
    _passwordController.dispose();
    _fatherNameController.dispose();
    _motherNameController.dispose();
    _fatherPhoneController.dispose();
    _fatherWorkController.dispose();
    _motherPhoneController.dispose();
    _motherWorkController.dispose();
    _lastSchoolDetailController.dispose();
    _localIdController.dispose();
    _noteController.dispose();
    _feeDiscountController.dispose();
    _idHistController.dispose();
    super.dispose();
  }

  // Helper methods for grid configuration
  int _getCrossAxisCount(double screenWidth) {
    if (screenWidth >= 759) return 2;
    return 1;
  }

  double _getChildAspectRatio(double screenWidth) {
    if (screenWidth >= 759) return 1.8;
    if (screenWidth >= 573) return 3.8;
    return 3.0;
  }

  Future<void> _addStudent() async {
    bool isGenderEmpty = _addStudentsController.selectedGenderIndex.isEmpty ||
        _addStudentsController.selectedGenderIndex == "";

    bool isReligionEmpty =
        _addStudentsController.selectedRealagonIndex.isEmpty ||
            _addStudentsController.selectedRealagonIndex == "";

    bool isBloodEmpty = _addStudentsController.selectedBloodTypeIndex.isEmpty ||
        _addStudentsController.selectedBloodTypeIndex == "";

    bool isCountryEmpty =
        _addStudentsController.selectedLocationIndex.isEmpty ||
            _addStudentsController.selectedLocationIndex == "";

    bool isClassEmpty = _addStudentsController.selectedClassIndex.isEmpty ||
        _addStudentsController.selectedClassIndex == "";

    bool isDivisionEmpty =
        _addStudentsController.selectedDivisionIndex.isEmpty ||
            _addStudentsController.selectedDivisionIndex == "";

    bool isFirstNameEmpty = _firstNameController.text.trim().isEmpty;
    bool isLastNameEmpty = _lastNameController.text.trim().isEmpty;
    bool isPlaceofBirthEmpty = _placeOfBirthController.text.trim().isEmpty;
    bool isPhoneEmpty = _mobileNumberController.text.trim().isEmpty;
    bool isLocalIDEmpty = _localIdController.text.trim().isEmpty;
    bool isAddressEmpty = _currentAddressController.text.trim().isEmpty;
    bool isUsernameEmpty =
        _addStudentsController.textController.text.trim().isEmpty;
    bool isPasswordEmpty = _passwordController.text.trim().isEmpty;
    bool isFatherNameEmpty = _fatherNameController.text.trim().isEmpty;
    bool isFatherPhoneEmpty = _fatherPhoneController.text.trim().isEmpty;
    bool isMotherNameEmpty = _motherNameController.text.trim().isEmpty;
    bool isMotherPhoneEmpty = _motherPhoneController.text.trim().isEmpty;
    bool isBirthdateEmpty = _employeeController.Birthdate.value == null;
    bool isFatherPassport =
        _addStudentsController.selectedFatherPassport.value == null;
    bool isFamilyPassport =
        _addStudentsController.selectedFamilyBook.value == null;

    RegExp passwordRegex = RegExp(r"^[a-zA-Z0-9]{8,}$");
    bool isPasswordValid = passwordRegex.hasMatch(_passwordController.text);

    // Update error states
    _addStudentsController.updateFieldError("first", isFirstNameEmpty);
    _addStudentsController.updateFieldError("fatherpass", isFatherPassport);
    _addStudentsController.updateFieldError("familypass", isFamilyPassport);
    _addStudentsController.updateFieldError("last", isLastNameEmpty);
    _addStudentsController.updateFieldError("birthdate", isBirthdateEmpty);
    _addStudentsController.updateFieldError(
        "placeofbirth", isPlaceofBirthEmpty);
    _addStudentsController.updateFieldError("gender", isGenderEmpty);
    _addStudentsController.updateFieldError("religion", isReligionEmpty);
    _addStudentsController.updateFieldError("blood", isBloodEmpty);
    _addStudentsController.updateFieldError("country", isCountryEmpty);
    _addStudentsController.updateFieldError("phone", isPhoneEmpty);
    _addStudentsController.updateFieldError("localnational", isLocalIDEmpty);
    _addStudentsController.updateFieldError("class", isClassEmpty);
    _addStudentsController.updateFieldError("localaddress", isAddressEmpty);
    _addStudentsController.updateFieldError("username", isUsernameEmpty);
    _addStudentsController.updateFieldError("division", isDivisionEmpty);
    _addStudentsController.updateFieldError(
        "password", isPasswordEmpty || !isPasswordValid);
    _addStudentsController.updateFieldError("fathername", isFatherNameEmpty);
    _addStudentsController.updateFieldError("fatherphone", isFatherPhoneEmpty);
    _addStudentsController.updateFieldError("mothername", isMotherNameEmpty);
    _addStudentsController.updateFieldError("motherphone", isMotherPhoneEmpty);

    if (!(isFirstNameEmpty ||
        isLastNameEmpty ||
        isBirthdateEmpty ||
        isPlaceofBirthEmpty ||
        isGenderEmpty ||
        isReligionEmpty ||
        isBloodEmpty ||
        isCountryEmpty ||
        isPhoneEmpty ||
        isLocalIDEmpty ||
        isClassEmpty ||
        isFatherPassport ||
        isFamilyPassport ||
        isAddressEmpty ||
        isUsernameEmpty ||
        isDivisionEmpty ||
        isPasswordEmpty ||
        !isPasswordValid ||
        isFatherNameEmpty ||
        isFatherPhoneEmpty ||
        isMotherNameEmpty ||
        isMotherPhoneEmpty)) {
      await Add_Student_API.Add_Student(
        locationId: _locationController
            .location![_addStudentsController.Locationlist.indexOf(
                _addStudentsController.LocationIndex)]
            .id,
        firstName: _firstNameController.text,
        lastName: _lastNameController.text,
        gender: _addStudentsController.GenderIndex,
        birthDate: _employeeController.Birthdate.value,
        placeOfBirth: _placeOfBirthController.text,
        religion: _addStudentsController.RealagonIndex,
        mobileNumber: _mobileNumberController.text,
        bloodType: _addStudentsController.BloodTypeIndex,
        fatherName: _fatherNameController.text,
        fatherPhone: _fatherPhoneController.text,
        motherName: _motherNameController.text,
        currentAdress: _currentAddressController.text,
        familystatus: _addStudentsController.FamilyStateIndex,
        guardianId: _guardianController.garduansid,
        userName: _addStudentsController.textController.text,
        password: _passwordController.text,
        classid: _classController
            .Allclass[_addStudentsController.Classlist.indexOf(
                _addStudentsController.ClassIndex)]
            .id,
        divisionId: _divisionController
            .allDivision[_addStudentsController.Divisionlist.indexOf(
                _addStudentsController.DivisionIndex)]
            .id,
        fatherWork: _fatherWorkController.text,
        motherPhone: _motherPhoneController.text,
        motherWork: _motherWorkController.text,
        nationalNumber: _nationalIdController.text,
        localID: _localIdController.text,
        lastSchoolDetail: _lastSchoolDetailController.text,
        note: _noteController.text,
        Fee_Discount: _feeDiscountController.text,
        specialNeeds: _addStudentsController.isSpecialNeed.value,
        martyrSon: _addStudentsController.isMartySon.value,
        FatherPassport: _addStudentsController.selectedFatherPassport.value,
        MotherPassport: _addStudentsController.selectedMotherPassport.value,
        SonPassport: _addStudentsController.selectedSonPassport.value,
        UserID: _addStudentsController.selectedId.value,
        Certefecate: _addStudentsController.selectedCertificate.value,
        Academic_sequence: _addStudentsController.selectedtsalsol.value,
        FamilyNotbook: _addStudentsController.selectedFamilyBook.value,
        illness: _illnessController.files,
        vaccine: _vaccinesController.files,
        idHist: _idHistController.text,
        file: _addStudentsController.selectedImage.value,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    print(widthScreen);
    return VMSAlertDialog(
      action: [
        Obx(() {
          return _addStudentsController.currentPage.value == 1
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ButtonDialog(
                      text: "Back".tr,
                      onPressed: () {
                        _addStudentsController.goToPage(0);
                      },
                      color: Get.theme.primaryColor,
                      width: 100,
                    ),
                    ButtonDialog(
                      text: "Add Students".tr,
                      onPressed: _addStudent,
                      color: Get.theme.primaryColor,
                      width: 100,
                    ),
                  ],
                )
              : const SizedBox();
        }),
      ],
      contents: Padding(
        padding: const EdgeInsets.only(top: 25.0, bottom: 25.0),
        child: SizedBox(
          width: 700,
          child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            allowImplicitScrolling: false,
            scrollDirection: Axis.horizontal,
            controller: _addStudentsController.pageController,
            onPageChanged: (index) {
              _addStudentsController.currentPage.value = index;
            },
            children: [
              GetBuilder<Allgaurdiancontroller>(
                builder: (controller) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, right: 8.0),
                            child: TextFormSearch(
                              click: () {
                                controller.clearFilter();
                              },
                              onchange: (value) {
                                controller.searchGaurdian(value);
                              },
                              width:
                                  widthScreen >= 775 ? 684 : widthScreen * 0.8,
                              radius: 5,
                              controller: _searchController,
                              suffixIcon: _searchController.text.isNotEmpty
                                  ? Icons.close
                                  : Icons.search,
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: GridView.builder(
                          padding: const EdgeInsets.only(
                              top: 10, left: 10, right: 10),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: _getCrossAxisCount(widthScreen),
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 10.0,
                            childAspectRatio: _getChildAspectRatio(widthScreen),
                          ),
                          itemCount: controller.filteredregaurdians!.length,
                          itemBuilder: (context, index) {
                            return HoverScaleCard(
                              child: GestureDetector(
                                onTap: () {
                                  controller.garduansid = controller
                                      .filteredregaurdians![index].id
                                      .toString();
                                  _addStudentsController.goToPage(1);
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: Colors.grey, width: 0.5),
                                    color: Theme.of(context).cardColor,
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black26,
                                        offset: Offset(0, 2),
                                        blurRadius: 1,
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              "${controller.filteredregaurdians![index].name}",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          ),
                                          Text(
                                            "${controller.filteredregaurdians![index].userName}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge!,
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "Email:".tr +
                                            " ${controller.filteredregaurdians![index].email}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!,
                                      ),
                                      Text(
                                        "Mobile Number :".tr +
                                            " ${controller.filteredregaurdians![index].phone}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
              Add_Students_page(
                First_Name: _firstNameController,
                Last_Name: _lastNameController,
                Place_Of_Birth: _placeOfBirthController,
                Mobile_Number: _mobileNumberController,
                Current_Address: _currentAddressController,
                National_ID: _nationalIdController,
                Password: _passwordController,
                Father_Name: _fatherNameController,
                Mother_Name: _motherNameController,
                Father_Phone: _fatherPhoneController,
                Father_Work: _fatherWorkController,
                Mother_Phone: _motherPhoneController,
                Mother_Work: _motherWorkController,
                Last_School_Detail: _lastSchoolDetailController,
                Note: _noteController,
                LocalID: _localIdController,
                Fee_Discount: _feeDiscountController,
                idHist: _idHistController,
              ),
            ],
          ),
        ),
      ),
      apptitle: "Add Students".tr,
      subtitle: "Select Garduans To Add Students".tr,
    );
  }
}

class Add_Students_page extends StatefulWidget {
  Add_Students_page({
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
    required this.idHist,
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
  TextEditingController idHist;

  @override
  State<Add_Students_page> createState() => _Add_Students_pageState();
}

class _Add_Students_pageState extends State<Add_Students_page> {
  final countryPicker = const FlCountryCodePicker();
  DropzoneViewController? ctrl;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double smallwidth = width >= 720 ? (width) - 20 : 300;
    print(smallwidth);
    return Column(
      children: [
        GetBuilder<Add_Students_Controller>(builder: (controller) {
          return Expanded(
            child: SizedBox(
              width: 620,
              child: SingleChildScrollView(
                child: Directionality(
                  textDirection: Get.find<LocalizationController>()
                              .currentLocale
                              .value
                              .languageCode ==
                          'ar'
                      ? TextDirection.rtl
                      : TextDirection.ltr,
                  child: Column(
                    spacing: 10.0,
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
                                Obx(
                                  () => GestureDetector(
                                    onTap: () async {
                                      await controller.pickImage(context);
                                    },
                                    child: CircleAvatar(
                                      backgroundColor: const Color(0xffC4C4C4),
                                      maxRadius: 100,
                                      backgroundImage: controller
                                                  .selectedImage.value !=
                                              null
                                          ? MemoryImage(
                                              controller.selectedImage.value!)
                                          : null,
                                      child:
                                          controller.selectedImage.value == null
                                              ? const Icon(
                                                  Icons.image_outlined,
                                                  color: Colors.white,
                                                  size: 40,
                                                )
                                              : null,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Textfildwithupper(
                                  isRequired: true,
                                  width: 300,
                                  controller: widget.First_Name,
                                  Uptext: "First Name".tr,
                                  hinttext: "First Name".tr,
                                  isError: controller.ISfirstNameError,
                                  onChanged: (value) {
                                    controller.updateFirstName(value);
                                    if (value.isNotEmpty) {
                                      controller.updateFieldError(
                                          "first", false);
                                    }
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 2.0),
                                  child: Textfildwithupper(
                                    isRequired: true,
                                    isError: controller.ISlastNameError,
                                    width: 300,
                                    Uptext: "Last Name".tr,
                                    hinttext: "Last Name".tr,
                                    controller: widget.Last_Name,
                                    onChanged: (value) {
                                      controller.updateLastName(value);
                                      if (value.isNotEmpty) {
                                        controller.updateFieldError(
                                            "last", false);
                                      }
                                    },
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Wrap(
                        spacing: 20.0,
                        runSpacing: 2.0,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Textfildwithupper(
                              isRequired: true,
                              isError: controller.IsPlaceOfBirthError,
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  controller.updateFieldError(
                                      "placeofbirth", false);
                                }
                              },
                              controller: widget.Place_Of_Birth,
                              width: 300,
                              Uptext: "Place Of Birth".tr,
                              hinttext: "Place Of Birth".tr),
                          BirthDate(
                            isError: controller.IsBirthdateError,
                            isRequired: true,
                            Uptext: "Birthdate".tr,
                            width: 300,
                          )
                        ],
                      ),
                      Wrap(
                        spacing: 20.0,
                        runSpacing: 2.0,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          DropdownAddStudents(
                              isLoading: false,
                              isError: controller.IsGenderError,
                              title: "Gender".tr,
                              width: 300,
                              type: "Gender"),
                          DropdownAddStudents(
                              isLoading: false,
                              isError: controller.IsReligionError,
                              title: "Religion".tr,
                              width: 300,
                              type: "Realagon")
                        ],
                      ),
                      Wrap(
                        spacing: 20.0,
                        runSpacing: 2.0,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          DropdownAddStudents(
                              isLoading: false,
                              isError: controller.IsBloodError,
                              title: "Blood Type".tr,
                              width: 300,
                              type: "BloodType"),
                          DropdownAddStudents(
                              isLoading: controller.isLoadingLocation,
                              title: "Location".tr,
                              isError: controller.IsCountryError,
                              width: 300,
                              type: "Location")
                        ],
                      ),
                      Wrap(
                        spacing: 20.0,
                        runSpacing: 2.0,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Textfildwithupper(
                              isRequired: true,
                              fieldType: "phone",
                              isError: controller.ISphoneError,
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  controller.updateFieldError("phone", false);
                                }
                              },
                              width: 300,
                              controller: widget.Mobile_Number,
                              Uptext: "Mobile Number".tr,
                              hinttext: "Mobile Number".tr),
                          Textfildwithupper(
                              isRequired: true,
                              isError: controller.ISLocalNationalIDError,
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  controller.updateFieldError(
                                      "localnational", false);
                                }
                              },
                              width: 300,
                              controller: widget.LocalID,
                              Uptext: "Local ID".tr,
                              hinttext: "Local ID".tr)
                        ],
                      ),
                      Wrap(
                        spacing: 20.0,
                        runSpacing: 2.0,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 22.0),
                            child: DropdownAddStudents(
                                isLoading: false,
                                title: "Family State".tr,
                                width: width <= 690 ? smallwidth : 620,
                                type: "FamilyState"),
                          ),
                        ],
                      ),
                      Wrap(
                        spacing: 20.0,
                        runSpacing: 2.0,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Textfildwithupper(
                              isRequired: false,
                              width: 300,
                              controller: widget.National_ID,
                              Uptext: "National Id".tr,
                              hinttext: "National Id".tr),
                          Textfildwithupper(
                              isRequired: true,
                              isError: controller.ISLocalAddressError,
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  controller.updateFieldError(
                                      "localaddress", false);
                                }
                              },
                              width: 300,
                              controller: widget.Current_Address,
                              Uptext: "Current Address".tr,
                              hinttext: "Current Address".tr)
                        ],
                      ),
                      Container(
                        width: 620,
                        child: Wrap(
                          spacing: 20.0,
                          runSpacing: 2.0,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          alignment: WrapAlignment.spaceBetween,
                          runAlignment: WrapAlignment.spaceBetween,
                          children: [
                            Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
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
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(fontSize: 16)),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Obx(() => Checkbox(
                                            value: controller.isMartySon.value,
                                            onChanged: (value) {
                                              controller.toggleMartySon(value!);
                                            },
                                          )),
                                      Text("Martyr son".tr,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(fontSize: 16)),
                                    ],
                                  ),
                                ]),
                            Row(
                                spacing: 10,
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GetBuilder<Illness_Controller>(
                                      builder: (Ill_Controller) {
                                    return ButtonDialog(
                                        height: 60,
                                        text: "Student Illness".tr +
                                            " (${Ill_Controller.selectedIllnesses.length})",
                                        onPressed: () async {
                                          try {
                                            CancelToken cancelToken =
                                                CancelToken();
                                            Loading_Dialog(
                                                cancelToken: cancelToken);
                                            if (await Get_Illness_API(context)
                                                    .Get_Illness(
                                                        cancelToken:
                                                            cancelToken) ==
                                                200) {
                                              Get.back();
                                              await Get.dialog(
                                                  const StudentsIllnessDialog(),
                                                  barrierDismissible: false);
                                            }
                                          } catch (e) {
                                            print(e);
                                          }
                                        },
                                        color: Theme.of(context).primaryColor,
                                        width: 145);
                                  }),
                                  GetBuilder<Vaccines_Controller>(
                                      builder: (vac_Controller) {
                                    return ButtonDialog(
                                        height: 60,
                                        text: "Student Vaccines".tr +
                                            " (${vac_Controller.selectedIllnesses.length})",
                                        onPressed: () async {
                                          try {
                                            CancelToken cancelToken =
                                                CancelToken();
                                            Loading_Dialog(
                                                cancelToken: cancelToken);
                                            if (await Get_Vaccines_API(
                                                        Get.context!)
                                                    .Get_Vaccines(
                                                        cancelToken:
                                                            cancelToken) ==
                                                200) {
                                              Get.back();
                                              Get.dialog(
                                                  StudentsVaccinesDialog(),
                                                  barrierDismissible: false);
                                            }
                                          } catch (e) {
                                            print(e);
                                          }
                                        },
                                        color: Theme.of(context).primaryColor,
                                        width: 145);
                                  }),
                                ]),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: Theme.of(context).primaryColor,
                              height: 1,
                            ),
                          ),
                          Text(
                            "   Student School Info   ".tr,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontSize: 18),
                          ),
                          Expanded(
                            child: Divider(
                              color: Theme.of(context).primaryColor,
                              height: 1,
                            ),
                          ),
                        ],
                      ),
                      Wrap(
                        spacing: 20.0,
                        runSpacing: 2.0,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          DropdownAddStudents(
                              isError: controller.ISclassError,
                              isLoading: controller.isLoadingClass,
                              title: "Class".tr,
                              width: 300,
                              type: "Class"),
                          DropdownAddStudents(
                              isError: controller.ISDivisionError,
                              isLoading: controller.isLoadingDivision,
                              isDisabled:
                                  controller.ClassIndex == "" ? true : false,
                              title: "Division".tr,
                              width: 300,
                              type: "Division")
                        ],
                      ),
                      Wrap(
                        spacing: 20.0,
                        runSpacing: 2.0,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Textfildwithupper(
                              isRequired: false,
                              width: 300,
                              controller: widget.Fee_Discount,
                              Uptext: "Fee Discount".tr,
                              hinttext: "Fee Discount".tr),
                          Textfildwithupper(
                              fieldType: "number",
                              isRequired: false,
                              width: 300,
                              controller: widget.idHist,
                              Uptext: "Public Register Number".tr,
                              hinttext: "Public Register Number".tr)
                        ],
                      ),
                      Wrap(
                        spacing: 20.0,
                        runSpacing: 2.0,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Textfildwithupper(
                            isRequired: true,
                            width: 300,
                            isError: controller.ISusernameError,
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                controller.updateFieldError("username", false);
                              }
                            },
                            controller: controller.textController,
                            Uptext: "Username".tr,
                            hinttext: "Username".tr,
                          ),
                          Textfildwithupper(
                              isRequired: true,
                              width: 300,
                              isError: controller.ISpasswordError,
                              fieldType: "password",
                              IconButton: IconButton(
                                  onPressed: () {
                                    controller.ChangeShowPassword(
                                        !controller.ShowPassword);
                                  },
                                  icon: Icon(
                                    controller.ShowPassword
                                        ? Icons.visibility_off
                                        : Icons.remove_red_eye_outlined,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .color,
                                  )),
                              hidePassword: controller.ShowPassword,
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  controller.updateFieldError(
                                      "password", false);
                                }
                              },
                              controller: widget.Password,
                              Uptext: "Password".tr,
                              hinttext: "Password".tr)
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: Theme.of(context).primaryColor,
                              height: 1,
                            ),
                          ),
                          Text(
                            "   Father Info   ".tr,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontSize: 18),
                          ),
                          Expanded(
                            child: Divider(
                              color: Theme.of(context).primaryColor,
                              height: 1,
                            ),
                          ),
                        ],
                      ),
                      Wrap(
                        spacing: 20.0,
                        runSpacing: 2.0,
                        crossAxisAlignment: WrapCrossAlignment.center,
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
                          Textfildwithupper(
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
                              hinttext: "Father Phone".tr)
                        ],
                      ),
                      Wrap(
                        spacing: 20.0,
                        runSpacing: 2.0,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Textfildwithupper(
                              width: 300,
                              controller: widget.Father_Work,
                              Uptext: "Father Work".tr,
                              hinttext: "Father Work".tr),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: Theme.of(context).primaryColor,
                              height: 1,
                            ),
                          ),
                          Text(
                            "   Mother Info   ".tr,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontSize: 18),
                          ),
                          Expanded(
                            child: Divider(
                              color: Theme.of(context).primaryColor,
                              height: 1,
                            ),
                          ),
                        ],
                      ),
                      Wrap(
                        spacing: 20.0,
                        runSpacing: 2.0,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Textfildwithupper(
                              isRequired: true,
                              width: 300,
                              isError: controller.ISMotherNameError,
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  controller.updateFieldError(
                                      "mothername", false);
                                }
                              },
                              controller: widget.Mother_Name,
                              Uptext: "Mother Name".tr,
                              hinttext: "Mother Name".tr),
                          Textfildwithupper(
                              isRequired: true,
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
                              hinttext: "Mother Phone".tr)
                        ],
                      ),
                      Wrap(
                        spacing: 20.0,
                        runSpacing: 2.0,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Textfildwithupper(
                              width: 300,
                              controller: widget.Mother_Work,
                              Uptext: "Mother Work".tr,
                              hinttext: "Mother Work".tr),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: Theme.of(context).primaryColor,
                              height: 1,
                            ),
                          ),
                          Text(
                            "   More Info   ".tr,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontSize: 18),
                          ),
                          Expanded(
                            child: Divider(
                              color: Theme.of(context).primaryColor,
                              height: 1,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          LargeTextField(
                              width: width >= 720 ? 590 : (width) - 70,
                              controller: widget.Last_School_Detail,
                              hinttext: "Last School Details".tr),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          LargeTextField(
                              width: width >= 720 ? 590 : (width) - 70,
                              controller: widget.Note,
                              hinttext: "Note".tr),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: Theme.of(context).primaryColor,
                              height: 1,
                            ),
                          ),
                          Text(
                            "   File Data   ".tr,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontSize: 18),
                          ),
                          Expanded(
                            child: Divider(
                              color: Theme.of(context).primaryColor,
                              height: 1,
                            ),
                          ),
                        ],
                      ),
                      Wrap(
                        spacing: 20.0,
                        runSpacing: 2.0,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Add Father Passport".tr),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: GestureDetector(
                                  onTap: () {
                                    controller.pickFatherPassport();
                                  },
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 500),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      border: controller.ISisfatherpassportError
                                          ? Border.all(color: Colors.red)
                                          : Border.all(
                                              color: Color(0xffD9D9D9)),
                                      color: controller
                                                  .isHoveringFatherPassport ||
                                              controller.selectedFatherPassport
                                                      .value !=
                                                  null
                                          ? Theme.of(context).primaryColor
                                          : Colors.white,
                                    ),
                                    alignment: Alignment.center,
                                    width: 300,
                                    height: 100,
                                    child: Stack(
                                      children: [
                                        DropzoneView(
                                          operation: DragOperation.copy,
                                          cursor: CursorType.Default,
                                          onCreated: (DropzoneViewController
                                              controller) {
                                            ctrl = controller;
                                          },
                                          onHover: () {
                                            controller.updateHoverFather(true);
                                          },
                                          onLeave: () {
                                            controller.updateHoverFather(false);
                                          },
                                          onDropFiles:
                                              (List<DropzoneFileInterface>?
                                                  files) async {
                                            if (files != null &&
                                                files.length == 1) {
                                              final file = files.first;
                                              final fileName =
                                                  await ctrl?.getFilename(file);
                                              final fileBytes =
                                                  await ctrl?.getFileData(file);

                                              controller.selectedFatherPassport
                                                  .value = fileBytes;
                                              controller.FatherPassportName
                                                  .value = fileName!;
                                              controller.updateTextFather(
                                                  "File Father Passport Dropped!"
                                                      .tr);
                                            }
                                          },
                                        ),
                                        Center(
                                          child: controller
                                                      .selectedFatherPassport
                                                      .value !=
                                                  null
                                              ? IconButton(
                                                  onPressed: () {
                                                    controller
                                                        .ClearselectedFatherPassport();
                                                  },
                                                  icon: Icon(
                                                    Icons
                                                        .delete_outline_outlined,
                                                    color: Colors.white,
                                                  ))
                                              : Text(
                                                  textAlign: TextAlign.center,
                                                  controller
                                                      .FatherPassportStatus,
                                                  style: TextStyle(
                                                    color: controller
                                                            .isHoveringFatherPassport
                                                        ? Colors.white
                                                        : Color(0xffCBBFBF),
                                                  ),
                                                ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Add Mother Passport".tr),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: GestureDetector(
                                  onTap: () {
                                    controller.pickMotherPassport();
                                  },
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 500),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      border:
                                          Border.all(color: Color(0xffD9D9D9)),
                                      color: controller
                                                  .isHoveringMotherPassport ||
                                              controller.selectedMotherPassport
                                                      .value !=
                                                  null
                                          ? Theme.of(context).primaryColor
                                          : Colors.white,
                                    ),
                                    alignment: Alignment.center,
                                    width: 300,
                                    height: 100,
                                    child: Stack(
                                      children: [
                                        DropzoneView(
                                          operation: DragOperation.copy,
                                          cursor: CursorType.Default,
                                          onCreated: (DropzoneViewController
                                              controller) {
                                            ctrl = controller;
                                          },
                                          onHover: () {
                                            controller.updateHoverMother(true);
                                          },
                                          onLeave: () {
                                            controller.updateHoverMother(false);
                                          },
                                          onDropFiles:
                                              (List<DropzoneFileInterface>?
                                                  files) async {
                                            if (files != null &&
                                                files.length == 1) {
                                              final file = files.first;
                                              final fileName =
                                                  await ctrl?.getFilename(file);
                                              final fileBytes =
                                                  await ctrl?.getFileData(file);

                                              controller.selectedMotherPassport
                                                  .value = fileBytes;
                                              controller.MotherPassportName
                                                  .value = fileName!;
                                              controller.updateTextMother(
                                                  "File Mother Passport Dropped!"
                                                      .tr);
                                            }
                                          },
                                        ),
                                        Center(
                                          child: controller
                                                      .selectedMotherPassport
                                                      .value !=
                                                  null
                                              ? IconButton(
                                                  onPressed: () {
                                                    controller
                                                        .ClearselectedMotherPassport();
                                                  },
                                                  icon: Icon(
                                                    Icons
                                                        .delete_outline_outlined,
                                                    color: Colors.white,
                                                  ))
                                              : Text(
                                                  textAlign: TextAlign.center,
                                                  controller
                                                      .MotherPassportStatus,
                                                  style: TextStyle(
                                                    color: controller
                                                            .isHoveringMotherPassport
                                                        ? Colors.white
                                                        : Color(0xffCBBFBF),
                                                  ),
                                                ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Wrap(
                        spacing: 20.0,
                        runSpacing: 2.0,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Add Son Passport".tr),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: GestureDetector(
                                  onTap: () {
                                    controller.pickSonPassport();
                                  },
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 500),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      border:
                                          Border.all(color: Color(0xffD9D9D9)),
                                      color: controller.isHoveringSonPassport ||
                                              controller.selectedSonPassport
                                                      .value !=
                                                  null
                                          ? Theme.of(context).primaryColor
                                          : Colors.white,
                                    ),
                                    alignment: Alignment.center,
                                    width: 300,
                                    height: 100,
                                    child: Stack(
                                      children: [
                                        DropzoneView(
                                          operation: DragOperation.copy,
                                          cursor: CursorType.Default,
                                          onCreated: (DropzoneViewController
                                              controller) {
                                            ctrl = controller;
                                          },
                                          onHover: () {
                                            controller.updateHoverSon(true);
                                          },
                                          onLeave: () {
                                            controller.updateHoverSon(false);
                                          },
                                          onDropFiles:
                                              (List<DropzoneFileInterface>?
                                                  files) async {
                                            if (files != null &&
                                                files.length == 1) {
                                              final file = files.first;
                                              final fileName =
                                                  await ctrl?.getFilename(file);
                                              final fileBytes =
                                                  await ctrl?.getFileData(file);

                                              controller.selectedSonPassport
                                                  .value = fileBytes;
                                              controller.SonPassportName.value =
                                                  fileName!;
                                              controller.updateTextSon(
                                                  "File Son Passport Dropped!"
                                                      .tr);
                                            }
                                          },
                                        ),
                                        Center(
                                          child: controller.selectedSonPassport
                                                      .value !=
                                                  null
                                              ? IconButton(
                                                  onPressed: () {
                                                    controller.Clear_Son();
                                                  },
                                                  icon: Icon(
                                                    Icons
                                                        .delete_outline_outlined,
                                                    color: Colors.white,
                                                  ))
                                              : Text(
                                                  textAlign: TextAlign.center,
                                                  controller.SonPassportStatus,
                                                  style: TextStyle(
                                                    color: controller
                                                            .isHoveringSonPassport
                                                        ? Colors.white
                                                        : Color(0xffCBBFBF),
                                                  ),
                                                ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Add ID File".tr),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: GestureDetector(
                                  onTap: () {
                                    controller.pickId();
                                  },
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 500),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      border:
                                          Border.all(color: Color(0xffD9D9D9)),
                                      color: controller.isHoveringId ||
                                              controller.selectedId.value !=
                                                  null
                                          ? Theme.of(context).primaryColor
                                          : Colors.white,
                                    ),
                                    alignment: Alignment.center,
                                    width: 300,
                                    height: 100,
                                    child: Stack(
                                      children: [
                                        DropzoneView(
                                          operation: DragOperation.copy,
                                          cursor: CursorType.Default,
                                          onCreated: (DropzoneViewController
                                              controller) {
                                            ctrl = controller;
                                          },
                                          onHover: () {
                                            controller.updateHoverId(true);
                                          },
                                          onLeave: () {
                                            controller.updateHoverId(false);
                                          },
                                          onDropFiles:
                                              (List<DropzoneFileInterface>?
                                                  files) async {
                                            if (files != null &&
                                                files.length == 1) {
                                              final file = files.first;
                                              final fileName =
                                                  await ctrl?.getFilename(file);
                                              final fileBytes =
                                                  await ctrl?.getFileData(file);

                                              controller.selectedId.value =
                                                  fileBytes;
                                              controller.IdName.value =
                                                  fileName!;
                                              controller.updateTextId(
                                                  "File Id Dropped!".tr);
                                            }
                                          },
                                        ),
                                        Center(
                                          child: controller.selectedId.value !=
                                                  null
                                              ? IconButton(
                                                  onPressed: () {
                                                    controller.Clear_id();
                                                  },
                                                  icon: Icon(
                                                    Icons
                                                        .delete_outline_outlined,
                                                    color: Colors.white,
                                                  ))
                                              : Text(
                                                  textAlign: TextAlign.center,
                                                  controller.IdStatus,
                                                  style: TextStyle(
                                                    color:
                                                        controller.isHoveringId
                                                            ? Colors.white
                                                            : Color(0xffCBBFBF),
                                                  ),
                                                ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Wrap(
                        spacing: 20.0,
                        runSpacing: 2.0,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Add Certificate".tr),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: GestureDetector(
                                  onTap: () {
                                    controller.pickCertificate();
                                  },
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 500),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      border:
                                          Border.all(color: Color(0xffD9D9D9)),
                                      color: controller.isHoveringCertificate ||
                                              controller.selectedCertificate
                                                      .value !=
                                                  null
                                          ? Theme.of(context).primaryColor
                                          : Colors.white,
                                    ),
                                    alignment: Alignment.center,
                                    width: 300,
                                    height: 100,
                                    child: Stack(
                                      children: [
                                        DropzoneView(
                                          operation: DragOperation.copy,
                                          cursor: CursorType.Default,
                                          onCreated: (DropzoneViewController
                                              controller) {
                                            ctrl = controller;
                                          },
                                          onHover: () {
                                            controller
                                                .updateHoverCertificate(true);
                                          },
                                          onLeave: () {
                                            controller
                                                .updateHoverCertificate(false);
                                          },
                                          onDropFiles:
                                              (List<DropzoneFileInterface>?
                                                  files) async {
                                            if (files != null &&
                                                files.length == 1) {
                                              final file = files.first;
                                              final fileName =
                                                  await ctrl?.getFilename(file);
                                              final fileBytes =
                                                  await ctrl?.getFileData(file);

                                              controller.selectedCertificate
                                                  .value = fileBytes;
                                              controller.CertificateName.value =
                                                  fileName!;
                                              controller.updateTextCertificate(
                                                  "File Certificate Dropped!"
                                                      .tr);
                                            }
                                          },
                                        ),
                                        Center(
                                          child: controller.selectedCertificate
                                                      .value !=
                                                  null
                                              ? IconButton(
                                                  onPressed: () {
                                                    controller
                                                        .Clear_Certificate();
                                                  },
                                                  icon: Icon(
                                                    Icons
                                                        .delete_outline_outlined,
                                                    color: Colors.white,
                                                  ))
                                              : Text(
                                                  textAlign: TextAlign.center,
                                                  controller.CertificateStatus,
                                                  style: TextStyle(
                                                    color: controller
                                                            .isHoveringCertificate
                                                        ? Colors.white
                                                        : Color(0xffCBBFBF),
                                                  ),
                                                ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Add Academic sequence".tr),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: GestureDetector(
                                  onTap: () {
                                    controller.picktsalsol();
                                  },
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 500),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      border:
                                          Border.all(color: Color(0xffD9D9D9)),
                                      color: controller.isHoveringtsalsol ||
                                              controller
                                                      .selectedtsalsol.value !=
                                                  null
                                          ? Theme.of(context).primaryColor
                                          : Colors.white,
                                    ),
                                    alignment: Alignment.center,
                                    width: 300,
                                    height: 100,
                                    child: Stack(
                                      children: [
                                        DropzoneView(
                                          operation: DragOperation.copy,
                                          cursor: CursorType.Default,
                                          onCreated: (DropzoneViewController
                                              controller) {
                                            ctrl = controller;
                                          },
                                          onHover: () {
                                            controller.updateHovertsalsol(true);
                                          },
                                          onLeave: () {
                                            controller
                                                .updateHovertsalsol(false);
                                          },
                                          onDropFiles:
                                              (List<DropzoneFileInterface>?
                                                  files) async {
                                            if (files != null &&
                                                files.length == 1) {
                                              final file = files.first;
                                              final fileName =
                                                  await ctrl?.getFilename(file);
                                              final fileBytes =
                                                  await ctrl?.getFileData(file);

                                              controller.selectedtsalsol.value =
                                                  fileBytes;
                                              controller.tsalsolName.value =
                                                  fileName!;
                                              controller.updateTexttsalsol(
                                                  "File Academic sequence Dropped!"
                                                      .tr);
                                            }
                                          },
                                        ),
                                        Center(
                                          child: controller
                                                      .selectedtsalsol.value !=
                                                  null
                                              ? IconButton(
                                                  onPressed: () {
                                                    controller.Clear_tasalsol();
                                                  },
                                                  icon: Icon(
                                                    Icons
                                                        .delete_outline_outlined,
                                                    color: Colors.white,
                                                  ))
                                              : Text(
                                                  textAlign: TextAlign.center,
                                                  controller.tsalsolStatus,
                                                  style: TextStyle(
                                                    color: controller
                                                            .isHoveringtsalsol
                                                        ? Colors.white
                                                        : Color(0xffCBBFBF),
                                                  ),
                                                ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Wrap(
                        spacing: 20.0,
                        runSpacing: 2.0,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Add Family notebook".tr),
                                GestureDetector(
                                  onTap: () {
                                    controller.pickFamilyBook();
                                  },
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 500),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      border: controller.ISisFamilyPassportError
                                          ? Border.all(color: Colors.red)
                                          : Border.all(
                                              color: Color(0xffD9D9D9)),
                                      color: controller.isHoveringFamilyBook ||
                                              controller.selectedFamilyBook
                                                      .value !=
                                                  null
                                          ? Theme.of(context).primaryColor
                                          : Colors.white,
                                    ),
                                    alignment: Alignment.center,
                                    width: 300,
                                    height: 100,
                                    child: Stack(
                                      children: [
                                        DropzoneView(
                                          operation: DragOperation.copy,
                                          cursor: CursorType.Default,
                                          onCreated: (DropzoneViewController
                                              controller) {
                                            ctrl = controller;
                                          },
                                          onHover: () {
                                            controller
                                                .updateHoverFamilyBook(true);
                                          },
                                          onLeave: () {
                                            controller
                                                .updateHoverFamilyBook(false);
                                          },
                                          onDropFiles:
                                              (List<DropzoneFileInterface>?
                                                  files) async {
                                            if (files != null &&
                                                files.length == 1) {
                                              final file = files.first;
                                              final fileName =
                                                  await ctrl?.getFilename(file);
                                              final fileBytes =
                                                  await ctrl?.getFileData(file);

                                              controller.selectedFamilyBook
                                                  .value = fileBytes;
                                              controller.FamilyBookName.value =
                                                  fileName!;
                                              controller.updateTextFamilyBook(
                                                  "File Family notebook Dropped!"
                                                      .tr);
                                            }
                                          },
                                        ),
                                        Center(
                                          child: controller.selectedFamilyBook
                                                      .value !=
                                                  null
                                              ? IconButton(
                                                  onPressed: () {
                                                    controller
                                                        .Clear_FamilyBook();
                                                  },
                                                  icon: Icon(
                                                    Icons
                                                        .delete_outline_outlined,
                                                    color: Colors.white,
                                                  ))
                                              : Text(
                                                  textAlign: TextAlign.center,
                                                  controller.FamilyBookStatus,
                                                  style: TextStyle(
                                                    color: controller
                                                            .isHoveringFamilyBook
                                                        ? Colors.white
                                                        : Color(0xffCBBFBF),
                                                  ),
                                                ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ],
    );
  }
}
