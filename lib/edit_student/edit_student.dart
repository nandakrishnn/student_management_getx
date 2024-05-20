// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:studentapp/controllers/edit_controller.dart';
import 'package:studentapp/controllers/home_controller.dart';
import 'package:studentapp/core/colors.dart';
import 'package:studentapp/core/constant.dart';
import 'package:studentapp/database/database_healper.dart';
import 'package:studentapp/home/home_page.dart';
import 'package:studentapp/model/database_model.dart';
import 'package:studentapp/refactored_widgets/round_button.dart';

class EditStudent extends StatelessWidget {
  EditController controller = Get.put(EditController());
  final Student student;
  EditStudent({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    DatabaseHealper datahelp = DatabaseHealper();

    controller.initialize(student);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: 
          const Color(0xFF80CBC4),
        title: const Text('Edit Student'),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: Shade.bodyGradient
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: GetBuilder<EditController>(builder: (_) {
            return Form(
                key: _.formkey,
                child: ListView(
                  children: [
                    kheight20,
                    GestureDetector(
                        onTap: () async {
                          XFile? img = await ImagePicker()
                              .pickImage(source: ImageSource.gallery);
                          _.updateImagePath(img!.path);
                        },
                        child: Obx(() => CircleAvatar(
                            radius: 80,
                            backgroundImage: _.profilePicturePath.isNotEmpty
                                ? FileImage(File(_.profilePicturePath.toString()))
                                : FileImage(File(student.imageurl))))),
                    kheight20,
                    TextFormField(
                      controller: _.namecontroller,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          label: const Text('Student Name')),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter students name';
                        } else {
                          return null;
                        }
                      },
                    ),
                    kheight20,
                    TextFormField(
                      controller: _.schoolnamecontroller,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          label: const Text('School Name')),
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
                      controller: _.fathernameController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          label: const Text('Father Name')),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter Father Name';
                        } else {
                          return null;
                        }
                      },
                    ),
                    kheight20,
                    TextFormField(
                      controller: _.ageController,
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
                    ),
                    kheight20,
                    RoundButton(
                        title: 'Save',
                        onPressed: () {
                          _.formkey.currentState!.validate();
                          {
                            final name = _.namecontroller.text;
                            final schoolname = _.schoolnamecontroller.text;
                            final fathername = _.fathernameController.text;
                            final age = int.parse(_.ageController.text);
        
                            final updatedStudent = Student(
                              id: student.id,
                              studentname: name,
                              age: age,
                              fathername: fathername,
                              schoolname: schoolname,
                              imageurl: _.profilePicturePath.isNotEmpty
                                  ? _.profilePicturePath.toString()
                                  : student.imageurl,
                            );
                            datahelp.updatedStudent(updatedStudent).then((id) {
                              if (id > 0) {
                                controller.showDilog();
                                Get.offAll(() => Homepage());
                                Get.find<HomeController>().refreshStudentsist();
                              } else {
                                Get.showSnackbar(const GetSnackBar(
                                  titleText: Text(
                                    'Failed',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  messageText: Text(
                                    'Failed to update student',
                                    style: TextStyle(fontSize: 12),
                                    
                                  ),
                                    duration: Duration(seconds: 3),
                                ));
                              }
                            });
                          }
                        },
                        buttoncolor: Colors.white,
                        textcolor: Colors.black)
                  ],
                ));
          }),
        ),
      ),
    );
  }
}
