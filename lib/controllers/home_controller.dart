import 'package:get/get.dart';
import 'package:studentapp/database/database_healper.dart';
import 'package:studentapp/model/database_model.dart';

class HomeController extends GetxController {
  RxBool issearching = false.obs;
  RxList<Student> students = <Student>[].obs;
  RxList<Student> filteredStudents = <Student>[].obs;

  late DatabaseHealper databaseHealper;

  @override
  void onInit() {
    super.onInit();
    databaseHealper = DatabaseHealper();
    refreshStudentsist();
  }

  Future<void> refreshStudentsist() async {
    final studentList = await databaseHealper.getStudent();
    students.assignAll(studentList);
    filteredStudents.assignAll(studentList);
  }

  void filterStudents(String query) {
    if (query.isEmpty) {
      filteredStudents.assignAll(students);
    } else {
      filteredStudents.assignAll(students
          .where((student) => student.studentname
              .trim()
              .toLowerCase()
              .contains(query.trim().toLowerCase()))
          .toList());
    }
  }
  togglesearch(){
    issearching.toggle();{
      if(!issearching.isTrue){
        filteredStudents.assignAll(students);
      }
    }
  }
}
