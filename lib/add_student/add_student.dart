import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:studentapp/controllers/add_student_controller.dart';
import 'package:studentapp/core/colors.dart';
import 'package:studentapp/core/constant.dart';
import 'package:studentapp/model/database_model.dart';
import 'package:studentapp/refactored_widgets/round_button.dart';

import '../database/database_healper.dart';

// ignore: must_be_immutable
class AddStudent extends StatelessWidget {
  AddStudentController controller = Get.put(AddStudentController());
  final _formkey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _fathernameController = TextEditingController();
  final _schoolnameController = TextEditingController();

  DatabaseHealper databaseHelper = DatabaseHealper();

  AddStudent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: Shade.bodyGradient,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 12,
                  ),
                  GestureDetector(
                    onTap: () async {
                      XFile? img = await ImagePicker()
                          .pickImage(source: ImageSource.gallery);
                      controller.updateProfilepic(img!.path);
                    },
                    child: Obx(() => 
                    CircleAvatar(
                      radius: 80,
                      backgroundColor: Colors.grey,
                      backgroundImage: controller.profilepicturepath.isNotEmpty?FileImage(File(controller.profilepicturepath.value)):null,
                      child: controller.profilepicturepath.isEmpty?const Icon(Icons.add_a_photo,size: 35,):null
                    )
                    )
                  ),
                  kheight20,
                  TextFormField(
                    controller: _nameController,
                    onChanged: controller.updatename,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      label: const Text('Student Name'),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Student Name';
                      } else {
                        return null;
                      }
                    },
                  ),
                  kheight20,
                  TextFormField(
                    onChanged: controller.updateSchoolname,
                    controller: _schoolnameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      label: const Text('School Name'),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter The school Name';
                      } else {
                        return null;
                      }
                    },
                  ),
                  kheight20,
                  TextFormField(
                    onChanged: controller.updatefathersname,
                    controller: _fathernameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      label: const Text('Father Name'),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter The Father Name';
                      } else {
                        return null;
                      }
                    },
                  ),
                  kheight20,
                  TextFormField(
                    controller: _ageController,
                    onChanged: (value) =>
                        controller.updateAge(int.parse(value)),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      label: const Text('Age'),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Age';
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.number,
                     inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  FilteringTextInputFormatter.digitsOnly,
                ],
                  ),
                  kheight40,
                  RoundButton(
                      title: 'Save',
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          final name = controller.name.value;
                          final school = controller.schoolname.value;
                          final father = controller.fathername.value;
                          final age = controller.age.value;

                          final student = Student(
                              imageurl: controller.profilepicturepath.value,
                              id: 0,
                              studentname: name,
                              age: age,
                              fathername: father,
                              schoolname: school);
                              controller.clearimage();
                              databaseHelper.insertStudent(student).then((id) {
                                  if(id>0){
                                    Get.back();
                                    controller.saveStudent();
                                  }else{
                                    Get.snackbar('failed', 'failed to add student');
                                  }
                              });
                        }
                      },
                      buttoncolor: const Color.fromARGB(255, 255, 255, 255),
                      textcolor: const Color.fromARGB(255, 0, 0, 0))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
