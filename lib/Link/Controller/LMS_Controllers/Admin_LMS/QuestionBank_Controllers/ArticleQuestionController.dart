
import 'package:get/get.dart';
import 'package:vms_school/Link/Model/LMS_Model/Questions_Models/ArticleModel.dart';

class Articlequestioncontroller extends GetxController {
 
  List<Question>? articleQuestion;
  List<Question> filtered_articleQuestion = [];
  String? filterName = '';

  void clearFilter() {
    searchByName("");
    update();
  }

  void searchByName(String? nameQuery) {
    filterName = nameQuery;
    List<Question> tempFilteredList = List.from(articleQuestion!);

    if (nameQuery != null && nameQuery.isNotEmpty) {
      tempFilteredList = tempFilteredList.where((cur) {
        final curName = cur.description?.toLowerCase() ?? '';
        return curName.contains(nameQuery.toLowerCase());
      }).toList();
    }

    filtered_articleQuestion = tempFilteredList;
    update();
  }

  bool isLoading = true;

  RxString fileName = "".obs;


  void SetArticle(ArticleModel links) {
    articleQuestion = links.question;

    filtered_articleQuestion = List.from(articleQuestion!);

    if (filterName != null && filterName!.isNotEmpty) {
      searchByName(filterName.toString());
    }



    SetIsLoading(false);
    update();
  }
   void Add_Question(Question cthc) {
    articleQuestion!.insert(0, cthc);
    filtered_articleQuestion = List.from(articleQuestion!);

    if (filterName != null && filterName!.isNotEmpty) {
      searchByName(filterName.toString());
    }

    update();
  }

  void Delete_Question(Question cthc) {
    articleQuestion!.remove(cthc);
    filtered_articleQuestion = List.from(articleQuestion!);
    if (filterName != null && filterName!.isNotEmpty) {
      searchByName(filterName.toString());
    }
    update();
  }

  void SetIsLoading(bool value) {
    isLoading = value;
    update();
  }
  bool IsQuestionError = false;
 
  void updateFieldError(String type, bool newValue) {
    switch (type) {
      case 'question':
        IsQuestionError = newValue;
        break;
  

      default:
        print("Error: Invalid type");
    }
    update();
  }


  void resetError() {
    IsQuestionError = false;
    update();
  }
}
