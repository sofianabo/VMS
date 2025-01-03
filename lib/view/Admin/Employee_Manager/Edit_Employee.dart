import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/Employees_APIs/Edit_Employee_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Full_Employee_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/AllEmpolyeeController.dart';
import 'package:vms_school/Link/Controller/AdminController/Illness_Controller.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/Calender.dart';
import 'package:vms_school/widgets/LargeTextField.dart';
import 'package:vms_school/widgets/TextFildWithUpper.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';
import 'package:vms_school/widgets/Admin_employee/DropDownAllEmployee.dart';

EditEmployee(BuildContext context , int idx , String employeeID) {

   final empolyeecontroller = Get.find<Allempolyeecontroller>();
   TextEditingController First_Name = TextEditingController(text: empolyeecontroller.employee!.firstName);
   TextEditingController Last_Name = TextEditingController(text: empolyeecontroller.employee!.lastName);
   TextEditingController Father_Name = TextEditingController(text: empolyeecontroller.employee!.fatherName);
   TextEditingController Mother_Name = TextEditingController(text: empolyeecontroller.employee!.motherName);
   TextEditingController Phone_Numper = TextEditingController(text: empolyeecontroller.employee!.phone);
   TextEditingController Emergency_Number = TextEditingController(text: empolyeecontroller.employee!.emergencyNumber);
   TextEditingController Address = TextEditingController(text: empolyeecontroller.employee!.address);
   TextEditingController Current_Address = TextEditingController(text: empolyeecontroller.employee!.currentAddress);
   TextEditingController Salary = TextEditingController(text: empolyeecontroller.employee!.salary.toString());
   TextEditingController Email = TextEditingController(text: empolyeecontroller.employee!.email);
   TextEditingController Username = TextEditingController(text: empolyeecontroller.employee!.userName);
   TextEditingController Joptitle = TextEditingController(text: empolyeecontroller.employee!.jobTitle);
   TextEditingController roll = TextEditingController(text: empolyeecontroller.employee!.roll);
   TextEditingController Facebook_URL = TextEditingController(text: empolyeecontroller.employee!.facebookUrl);
   TextEditingController X_Platform_URL = TextEditingController(text: empolyeecontroller.employee!.twitterUrl);
   TextEditingController Linkedin_URL = TextEditingController(text: empolyeecontroller.employee!.lenkedinUrl);
   TextEditingController Instagram_URL = TextEditingController(text: empolyeecontroller.employee!.instagramUrl);
   TextEditingController Bank_Account_Title = TextEditingController(text: empolyeecontroller.employee!.bankAccountTitle);
   TextEditingController Bank_Name = TextEditingController(text: empolyeecontroller.employee!.bankName);
   TextEditingController Bank_Branch_Name = TextEditingController(text: empolyeecontroller.employee!.bankBranchName);
   TextEditingController Bank_Account_Number = TextEditingController(text: empolyeecontroller.employee!.bankAccountNumber);
   TextEditingController IFSC_Code = TextEditingController(text: empolyeecontroller.employee!.iFSCCode);
   TextEditingController Career_History = TextEditingController(text: empolyeecontroller.employee!.careerHistory);
   TextEditingController Qualification = TextEditingController(text: empolyeecontroller.employee!.qualification);
   TextEditingController Experience = TextEditingController(text: empolyeecontroller.employee!.experience);
   TextEditingController Note = TextEditingController(text: empolyeecontroller.employee!.note);

   Get.dialog(
       GetBuilder<Allempolyeecontroller>(
           builder: (controller) {
             controller.Birthdate.value = DateTime.parse(Get.find<Allempolyeecontroller>().employee!.birthDate.toString());
             controller.Joindate.value = DateTime.parse(Get.find<Allempolyeecontroller>().employee!.joinDate.toString());

             return VMSAlertDialog(
                 action: [
                 ButtonDialog(
                       text: "Edit Employee",
                       onPressed: () async {
                         print(controller.Birthdate.value);
                         await EditEmployeeApi.EditEmployee(
                           employeeId: employeeID,
                           First_Name:First_Name.text,
                           Last_Name:Last_Name.text,
                           Father_Name:Father_Name.text,
                           Mother_Name:Mother_Name.text,
                           Phone_Numper:Phone_Numper.text,
                           Emergency_Number:Emergency_Number.text,
                           Address:Address.text,
                           Current_Address:Current_Address.text,
                           Birth_Date:controller.Birthdate.value.toString(),
                           Join_Date:controller.Joindate.value.toString(),
                           Gender: controller.GenderListIndex,
                           Family_State:controller.Family_StatusIndex,
                           Salary:Salary.text,
                           selectedImage: Get.find<AddFullEmployeeController>().selectedImage.value,
                           Facebook_URL:Facebook_URL.text,
                           X_Platform_URL:X_Platform_URL.text,
                           Linkedin_URL:Linkedin_URL.text,
                           Instagram_URL:Instagram_URL.text,
                           Bank_Account_Title:Bank_Account_Title.text,
                           Bank_Name:Bank_Name.text,
                           Bank_Branch_Name:Bank_Branch_Name.text,
                           Bank_Account_Number:Bank_Account_Number.text,
                           IFSC_Code:IFSC_Code.text,
                           Career_History:Career_History.text,
                           Qualification:Qualification.text,
                           Experience:Experience.text,
                           Note:Note.text,
                         );
                       },
                       color: Get.theme.primaryColor,
                       width: 140)
                 ],
                 contents: GetBuilder<AddFullEmployeeController>(
                     builder: (controller) {

                       return Container(
                         width: 520,
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
                                             () =>
                                             GestureDetector(
                                               onTap: () async {
                                                 await controller.pickImage(
                                                     context);
                                               },
                                               child: CircleAvatar(
                                                 maxRadius: 100,
                                                 backgroundColor: const Color(0xffC4C4C4),
                                                 backgroundImage: controller.selectedImage
                                                     .value != null
                                                     ? MemoryImage(
                                                     controller.selectedImage.value!)
                                                     :
                                                 empolyeecontroller.filteredreemployees[idx].imageId !=null ?
                                                 NetworkImage("$getimage"+"${empolyeecontroller.filteredreemployees[idx].imageId}"):
                                                 null,
                                                 child: controller.selectedImage.value ==
                                                     null &&    empolyeecontroller.filteredreemployees[idx].imageId ==null
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
                                           width: 250,
                                           controller: First_Name,
                                           Uptext: "First Name",
                                           hinttext: "First Name"),
                                       Padding(
                                         padding: const EdgeInsets.only(top: 22.0),
                                         child: Textfildwithupper(

                                             width: 250,
                                             controller: Last_Name,
                                             Uptext: "Last Name",
                                             hinttext: "Last Name"),
                                       ),
                                     ],
                                   )
                                 ],
                               ),
                               Padding(
                                 padding: const EdgeInsets.only(top: 10.0),
                                 child: Row(
                                   children: [
                                     Textfildwithupper(

                                         width: 250,
                                         controller: Father_Name,
                                         Uptext: "Father Name",
                                         hinttext: "Father Name"),
                                     Padding(
                                       padding: const EdgeInsets.only(left: 20.0),
                                       child: Textfildwithupper(

                                           width: 250,
                                           controller: Mother_Name,
                                           Uptext: "Mother Name",
                                           hinttext: "Mother Name"),
                                     )
                                   ],
                                 ),
                               ),
                               Padding(
                                 padding: const EdgeInsets.only(top: 22.0),
                                 child: Row(
                                   children: [
                                     Textfildwithupper(

                                         width: 250,
                                         controller: Phone_Numper,
                                         Uptext: "Phone Numper",
                                         hinttext: "Phone Numper"),
                                     Padding(
                                         padding: const EdgeInsets.only(left: 20.0),
                                         child: BirthDate(

                                           Uptext: "Birthdate",
                                           width: 250,
                                         ))
                                   ],
                                 ),
                               ),
                               Padding(
                                 padding: const EdgeInsets.only(top: 22.0),
                                 child: Row(
                                   children: [
                                     Textfildwithupper(

                                         width: 250,
                                         controller: Emergency_Number,
                                         Uptext: "Emergency Number",
                                         hinttext: "Emergency Number"),
                                     Padding(
                                         padding: const EdgeInsets.only(left: 20.0),
                                         child: JoinDate(

                                           Uptext: "Join Date",
                                           width: 250,

                                         ))
                                   ],
                                 ),
                               ),
                               Padding(
                                 padding: const EdgeInsets.only(top: 22.0),
                                 child: Row(
                                   children: [
                                     Textfildwithupper(

                                         width: 250,
                                         controller: Address,
                                         Uptext: "Address",
                                         hinttext: "Address"),
                                     Padding(
                                       padding: const EdgeInsets.only(left: 20.0),
                                       child: Textfildwithupper(

                                           width: 250,
                                           controller: Current_Address,
                                           Uptext: "Current Address",
                                           hinttext: "Current Address"),
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
                                         width: 250,
                                         controller: Email,
                                         Uptext: "Email",
                                         hinttext: "Email"),
                                     Padding(
                                       padding: const EdgeInsets.only(left: 20.0),
                                       child: Textfildwithupper(

                                           readOnly: true,
                                           width: 250,
                                           controller: Username,
                                           Uptext: "Username",
                                           hinttext: "Username"),
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
                                         width: 250,
                                         controller: Joptitle,
                                         Uptext: "Joptitle",
                                         hinttext: "Joptitle"),
                                     Padding(
                                       padding: const EdgeInsets.only(left: 20.0),
                                       child: Textfildwithupper(

                                           readOnly: true,
                                           width: 250,
                                           controller: roll,
                                           Uptext: "Roll",
                                           hinttext: "Roll"),
                                     )
                                   ],
                                 ),
                               ),
                               Padding(
                                 padding: const EdgeInsets.only(top: 22.0),
                                 child: Row(
                                   crossAxisAlignment: CrossAxisAlignment.end,
                                   children: [
                                     Dropdownallemployee(
                                         title: "Gender", width: 250, type: "Gender"),
                                     Padding(
                                       padding: const EdgeInsets.only(left: 20.0),
                                       child: Dropdownallemployee(
                                           title: "Family Status",
                                           width: 250,
                                           type: "Family_Status"),
                                     )

                                     // Gender
                                     // Family_Status
                                   ],
                                 ),
                               ),
                               Padding(
                                 padding: const EdgeInsets.only(top: 22.0),
                                 child: Row(
                                   crossAxisAlignment: CrossAxisAlignment.end,
                                   children: [
                                     Textfildwithupper(
                                         width: 250,
                                         controller: Salary,
                                         Uptext: "Salary",
                                         hinttext: "Salary"),
                                     Padding(
                                         padding: const EdgeInsets.only(left: 20.0),
                                         child:   GetBuilder<IllnessController>(builder: (controller) {
                                           return ButtonDialog(
                                               bordercolor: Color(0xffD9D9D9),
                                               textcolor: Colors.black,
                                               text: "Employee Illness",
                                               onPressed: () {
                                                 Get.dialog(
                                                   VMSAlertDialog(
                                                     action: [],
                                                     contents: SizedBox(
                                                       height: 400,
                                                       width: 400,
                                                       child: Obx(() {
                                                         return ListView.builder(
                                                           itemCount: controller.allIllness
                                                               .length,
                                                           itemBuilder: (context, index) {
                                                             return Column(
                                                               mainAxisSize: MainAxisSize.min,
                                                               children: [
                                                                 Padding(
                                                                   padding:
                                                                   const EdgeInsets.all(8.0),
                                                                   child: Obx(() {
                                                                     // غلف CheckboxListTile بـ Obx
                                                                     return CheckboxListTile(
                                                                       overlayColor:
                                                                       WidgetStatePropertyAll(
                                                                           Colors.transparent),
                                                                       checkColor: Colors
                                                                           .white,
                                                                       title: Text(controller
                                                                           .allIllness[index]
                                                                       ['arName']),
                                                                       value: controller
                                                                           .selectedIllness[index],
                                                                       onChanged: (
                                                                           bool? value) {
                                                                         controller
                                                                             .toggleIllness(
                                                                             index);
                                                                       },
                                                                     );
                                                                   }),
                                                                 ),
                                                                 Divider(
                                                                   color: Get.theme
                                                                       .primaryColor,
                                                                   height: 1,
                                                                 )
                                                               ],
                                                             );
                                                           },
                                                         );
                                                       }),
                                                     ),
                                                     apptitle: "All Employee Illness",
                                                     subtitle: "none",
                                                   ),
                                                 );
                                               },
                                               color: Colors.white,
                                               width: 250);
                                         })

                                     )


                                   ],
                                 ),
                               ),

                               Padding(
                                 padding: const EdgeInsets.only(top: 22.0),
                                 child: Row(
                                   crossAxisAlignment: CrossAxisAlignment.end,
                                   children: [
                                     Text(
                                       "Social Media Info :",
                                       style: Get.theme.textTheme.titleLarge!
                                           .copyWith(fontSize: 20),
                                     )
                                   ],
                                 ),
                               ),
                               Padding(
                                 padding: const EdgeInsets.only(top: 22.0),
                                 child: Row(
                                   children: [
                                     Textfildwithupper(
                                         width: 250,
                                         controller: Facebook_URL,
                                         Uptext: "Facebook URL",
                                         hinttext: "Facebook URL"),
                                     Padding(
                                       padding: const EdgeInsets.only(left: 20.0),
                                       child: Textfildwithupper(
                                           width: 250,
                                           controller: X_Platform_URL,
                                           Uptext: "X Platform URL",
                                           hinttext: "X Platform URL"),
                                     )
                                   ],
                                 ),
                               ),
                               Padding(
                                 padding: const EdgeInsets.only(top: 22.0),
                                 child: Row(
                                   children: [
                                     Textfildwithupper(
                                         width: 250,
                                         controller: Linkedin_URL,
                                         Uptext: "Linkedin URL",
                                         hinttext: "Linkedin URL"),
                                     Padding(
                                       padding: const EdgeInsets.only(left: 20.0),
                                       child: Textfildwithupper(
                                           width: 250,
                                           controller: Instagram_URL,
                                           Uptext: "Instagram URL",
                                           hinttext: "Instagram URL"),
                                     )
                                   ],
                                 ),
                               ),
                               Padding(
                                 padding: const EdgeInsets.only(top: 22.0),
                                 child: Row(
                                   crossAxisAlignment: CrossAxisAlignment.end,
                                   children: [
                                     Text(
                                       "Teacher Bank Info :",
                                       style: Get.theme.textTheme.titleLarge!
                                           .copyWith(fontSize: 20),
                                     )
                                   ],
                                 ),
                               ),
                               Padding(
                                 padding: const EdgeInsets.only(top: 22.0),
                                 child: Row(
                                   children: [
                                     Textfildwithupper(
                                         width: 250,
                                         controller: Bank_Account_Title,
                                         Uptext: "Bank Account Title",
                                         hinttext: "Bank Account Title"),
                                     Padding(
                                       padding: const EdgeInsets.only(left: 20.0),
                                       child: Textfildwithupper(
                                           width: 250,
                                           controller: Bank_Name,
                                           Uptext: "Bank Name",
                                           hinttext: "Bank Name"),
                                     )
                                   ],
                                 ),
                               ),
                               Padding(
                                 padding: const EdgeInsets.only(top: 22.0),
                                 child: Row(
                                   children: [
                                     Textfildwithupper(
                                         width: 250,
                                         controller: Bank_Branch_Name,
                                         Uptext: "Bank Branch Name",
                                         hinttext: "Bank Branch Name"),
                                     Padding(
                                       padding: const EdgeInsets.only(left: 20.0),
                                       child: Textfildwithupper(
                                           width: 250,
                                           controller: Bank_Account_Number,
                                           Uptext: "Bank Account Number",
                                           hinttext: "Bank Account Number"),
                                     )
                                   ],
                                 ),
                               ),
                               Padding(
                                 padding: const EdgeInsets.only(top: 22.0),
                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment.start,
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Textfildwithupper(
                                         width: 250,
                                         controller: IFSC_Code,
                                         Uptext: "IFSC Code",
                                         hinttext: "IFSC Code"),
                                   ],
                                 ),
                               ),
                               Padding(
                                 padding: const EdgeInsets.only(top: 22.0),
                                 child: Divider(
                                   color: Get.theme.primaryColor,
                                   height: 1,
                                 ),
                               ),
                               Padding(
                                 padding: const EdgeInsets.only(top: 22.0),
                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment.start,
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     LargeTextField(
                                         controller: Career_History,
                                         hinttext: "Career History"),
                                   ],
                                 ),
                               ),
                               Padding(
                                 padding: const EdgeInsets.only(top: 22.0),
                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment.start,
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     LargeTextField(

                                         controller: Qualification,
                                         hinttext: "Qualification"),
                                   ],
                                 ),
                               ),
                               Padding(
                                 padding: const EdgeInsets.only(top: 22.0),
                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment.start,
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     LargeTextField(

                                         controller: Experience, hinttext: "Experience"),
                                   ],
                                 ),
                               ),
                               Padding(
                                 padding: const EdgeInsets.only(top: 22.0),
                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment.start,
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     LargeTextField(controller: Note, hinttext: "Note"),
                                   ],
                                 ),
                               ),
                             ],
                           ),
                         ),
                       );
                     }
                 ),
                 apptitle: "Edit Employee",
                 subtitle: "none");
           }
       ));

}
