// String hostPort = "https://lion-secure-strongly.ngrok-free.app/api/";
// String hostPort = "https://api.vmssyria.com/api/";
String hostPort = "http://192.168.1.18:8000/api/";
//..................... Guardians API Start ...................//
String enroll = "Enroll";
String resendCodeGurdian = "resendCodeGurdian";
String verifyCodeAndEnroll = "verifyCodeAndEnroll";
String getMyChildren = "getMyChildren";
String getStudentQuiz = 'getStudentQuiz';
String getMyData = 'getMyData';
String updateGuardian = 'updateGuardian';
String getStudentMarksById = 'getStudentMarksById';
String resendRegister = "resendRegister";
//..................... Guardians API End ...................//

//..................... Teacher API Start ...................//

String getStudentByTeacher = "getStudentByTeacher";
String getMyStudyShare = "getMyStudyShare";
String getMyQuiz = "getMyQuiz";
String getMyAttendence = "getMyAttendance";
String getClassesByTeacher = "getClassesByTeacher";
String getDivionByTeacher = "getDivionByTeacher";
String getCurriculumByTeacher = "getCurriculumByTeacher";

//..................... Teacher API End ...................//

//..................... Admin API Start ...................//
//..................... Students ...................//
String addGuardian = "addGuardian";
String getguardians = "getAllGuardian";
String editGuardian = "updateGuardian";
String getStudents = "getAllStudent";
String deleteStudent = "deleteStudent";
String studentAttenendnce = "getStudentAttendance";
String studentAttendenceById = "getStudentAttendanceById";
String studentsAttendance = "IncreaseAttendance";
String getStudyYearStudent = "getStudent";
String rejectrequest = "unacceptable";
String acceptARequest = "AcceptARequest";
String addStudentPenalty = "addStudentPenalty";
String addStudentAttendance = "addStudentAttendance";
String addStudentInfo = "addStudentInfo";
String getStudentInformation = "getStudentInformation";
String getStudentsPenalty = "getStudentsPenalty";

String updateStudentIll = "updateStudentIll";
String getStudentIll = "getStudentIll";
String getStudentVaccines = "getStudentVaccines";
String updateStudentVaccines = "updateStudentVaccines";
String updateStudent = "update";
String getStudentPrize = "getStudentPrize";
String deleteStudentPrize = "deleteStudentPrize";

String addMarks = "addMarks";
String deleteStudentAttendance = "deleteStudentAttendance";

//..................... Employees ...................//

String addEmpolyee = "addEmployee";
String getMyEmployeeIll = "getMyEmployeeIll";
String addFullEmployee = "addFullEmployee";
String updateEmployee = "updateEmployee";
String getAllEmployee = "getAllEmployee";
String deleteEmployee = "deleteEmployee";
String getEmployeeById = "getEmployeeById";
String addEmployeeAttendance = "addEmployeeAttendance";
String employeeAttendence = "getAllEmployeeAttendance";
String getEmployeeAttendance = "getEmployeeAttendance";
String employeeIncreaseAttendance = "employeeIncreaseAttendance";

String addVirtualUser = "addVirtualUser";
String getVirtualUser = "getVirtualUser";
String deleteVirtualEmployee = "deleteVirtualUser";
String updateEmployeeIll = "updateEmployeeIll";
String getEmployeeIll = "getEmployeeIll";
String getMyEmployee = "getMyEmployee";
String addEmployeeInfo = "addEmployeeInfo";
String deleteEmployeeAttendance = "deleteEmployeeAttendance";

//..................... Teachers ...................//

String getTeachers = "getAllTeacher";
String deleteTeacher = "deleteTeacher";
String getTeacherAttendance = "getTeacherAttendance";
String teacherIncreaseAttendance = "teacherIncreaseAttendance";
String getTeacherById = "getTeacherById";
String updateTeacher = "updateTeacher";
String getSCDTeacherById = "getSCDTeacherById";

//..................... Schools ...................//

String getSession = "getAllSession";
String addSession = "addSession";
String updateSession = "updateSession";
String closeSession = "closeSession";

String destroy = "destroy";
String getCountry = "getCountry";

String getGrade = "getGrade";
String createGrade = "createGrade";
String updateGrade = "updateGrade";
String destroyGrede = "destroyGrede";

String getDivision = "getDivisionByClass";
String getRequests = "getRegistration";

String getclasses = "getClasses";
String addClass = "addClass";
String updateClass = "updateClass";
String deleteClass = "deleteClass";

String getAllDivision = "getAllDivision";
String createDivision = "createDivision";
String deleteDivision = "deleteDivision";
String updateDivision = "updateDivision";

String getClassUser = "getClassUser";

String getSchoolData = "getSchoolData";
String getSchoolContent = "getSchoolContent";
String addSchoolContents = "addSchoolContents";
String updateSchoolContents = "updateSchoolContents";
String updatSchoolData = "updatSchoolData";

String getCurriculum = "getCurriculum";
String createCurriculum = "createCurriculum";
String deleteCurriculum = "deleteCurriculum";

String getSubject = "getSubject";
String addSubject = "addSubject";
String deleteSubject = "deleteSubject";
String updateSubject = "updateSubject";

String addBook = "addBook";
String getBook = "getBook";
String deleteBook = "deleteBook";

String getTransaction = "getTransaction";

String getIllness = "getIllness";
String addIllness = "addIllness";
String deleteIllness = "deleteIllness";

String getVaccine = "getVaccine";
String deleteVaccines = "deleteVaccines";
String addVaccines = "addVaccines";

String allPenalty = "getPenalty";
String addPenalty = "addPenalty";

String deletePenalty = "deletePenalty";
String editPenalty = "updatePenalty";
String deleteStudentPenalty = "deleteStudentPenalty";

String addStudentPrize = "addStudentPrize";

String addQuizType = "addQuizType";
String getQuizType = "getAllQuizType";
String getStudentMarks = "getStudentMarks";
String getQuizTypeIdesAndName = "getQuizTypeIdesAndName";
String addQuizTypeOperation = "addQuizTypeOperation";

//..................... Admin ...................//

String dashboard = "DashBoard";
String getLocation = "getLocation";

//..................... File ...................//

String getimage = hostPort + "getFile/";
String getpdf = hostPort + "getpdf/";

//..................... Tables ...................//

String examType = "getExamType";
String getSemester = "getSemester";
String examTable = "getQuiz";
String addQuiz = "addQuiz";
String deletetQuiz = "deleteQuiz";
String updateQuiz = "updateQuiz";

String addStudyShare = "addStudyShare";
String getDivisionStudyShare = "getDivisionStudyShare";
String updatLessonByDay = "updatLessonByDay";
String deleteStudyShare = "deleteStudyShare";

String getNoneQuizTypeClass = "getNoneQuizTypeClass";
String updateQuizType = "updateQuizType";
//..................... Admin API End ...................//

//..................... All ...................//

String Home = "homeScreen";

//..................... Auth ...................//

String LOGIN = "login";
String logout = "logout";
String forgetPassword = "forgetPassword";
String verifyPassword = "verifyPassword";

// ..................... All Users ...................//

String verify = "verify";
String resendCode = "resendCode";
String updateEmail = "updateEmail";
String updatePassword = "updatePassword";

// ..................... LMS Users ...................//
String getClassesLms = "getClassesLms";
String getLMSCurriculum = "getLMSCurriculum";
String LmsSubject = "LmsSubject";
String getLmsDivision = "getLmsDivision";
String getLmsStudent = "getLmsStudent";
String addHomework = "addHomework";
String getHomework = "getHomework";
