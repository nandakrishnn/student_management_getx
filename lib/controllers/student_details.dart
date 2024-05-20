import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentapp/controllers/home_controller.dart';
import 'package:studentapp/database/database_healper.dart';
import 'package:studentapp/edit_student/edit_student.dart';
import 'package:studentapp/model/database_model.dart';
import 'package:studentapp/refactored_widgets/delete_dialog.dart';

class StudentDetailsContoller extends GetxController {
  late DatabaseHealper db;

  @override
  void onInit() {
    super.onInit();
    db = DatabaseHealper();
  }

  void editStudent(Student student) {
    Get.to(()=>EditStudent(student: student))?.then((_) => Get.back());
  }

  void showCustomDialog(Student student) {
    Get.dialog(DeleteDialog(onCancel: () {
      Get.back();
    }, onDelete: () {
      Get.snackbar(
        'Sucess',
        'Student added Successfully',
        messageText: const Text(
          'Student Deleted Sucessfully',
          style: TextStyle(color: Colors.white),
        ),
        titleText: const Text(
          'Deleted',
          style: TextStyle(
              color: Colors.red, fontWeight: FontWeight.bold, fontSize: 17),
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

      db.deleteStudent(student.id);
      HomeController controller = Get.find();
      controller.refreshStudentsist();
      Get.offAllNamed('/Homepage');
    }));
  }
}
