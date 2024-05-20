import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentapp/model/database_model.dart';

class EditController extends GetxController {
  RxString profilePicturePath = ''.obs;
  RxString name = ''.obs;
  RxString schoolname = ''.obs;
  RxString fathername = ''.obs;
  RxString imageurl = ''.obs;
  RxInt age = 0.obs;

  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController schoolnamecontroller = TextEditingController();
  final TextEditingController fathernameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  late String initalName;
  late String initalSchoolname;
  late String initalFathername;
  late int initalAge;

  void initialize(Student student) {
    initalName = student.studentname;
    initalSchoolname = student.schoolname;
    initalFathername = student.fathername;
    initalAge = student.age;

    namecontroller.text = initalName;
    schoolnamecontroller.text = initalSchoolname;
    fathernameController.text = initalFathername;
    ageController.text = initalAge.toString();
  }

  void updateImagePath(String path) {
    profilePicturePath.value = path;
  }

  void upadateName(String value) {
    name.value = value;
  }

  void updateSchoolname(String value) {
    schoolname.value = value;
  }

  void updateFatherName(String value) {
    fathername.value = value;
  }

  void updateAge(String value) {
    age.value = int.parse(value);
  }

  showDilog() {
    Get.snackbar(
      'Sucess',
      'Student Edited Sucessfully',
      messageText: const Text(
        'Student updated successfully',
        style: TextStyle(color: Colors.white),
      ),
      titleText: const Text(
        'Sucess',
        style: TextStyle(
            color: Colors.green, fontWeight: FontWeight.bold, fontSize: 17),
      ),
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      snackStyle: SnackStyle.FLOATING,
      backgroundColor: Colors.black,
      colorText: Colors.white,
      margin: const EdgeInsets.all(16),
      borderRadius: 8,
      isDismissible: true,
    );
  }
}
