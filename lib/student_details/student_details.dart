import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:studentapp/controllers/student_details.dart';
import 'package:studentapp/core/colors.dart';
import 'package:studentapp/core/constant.dart';
import 'package:studentapp/model/database_model.dart';

class StudentDetails extends StatelessWidget {
  final Student student;
  final StudentDetailsContoller controller = Get.put(StudentDetailsContoller());
  StudentDetails({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF80CBC4),
        title: const Text(
          'Students Profile',
          
          style: TextStyle(),
        ),
        actions: [    
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              controller.showCustomDialog(student);
            },
          ),
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              controller.editStudent(student);
            },
          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(gradient: Shade.bodyGradient),
        child: Align(
          alignment: Alignment.center,
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(158, 0, 0, 0).withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 10,
                  offset: Offset(0,
                      18), // Adjust this offset to evenly distribute the shadow
                ),
              ],
            ),
            child: Card(
              elevation: 50,
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 1.3,
                height: MediaQuery.of(context).size.height / 1.7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Card(
                      elevation: 32,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                                           
                         
                            image: DecorationImage(
                                image: FileImage(
                                  File(student.imageurl),
                                ),
                                fit: BoxFit.cover),
                          
                          ),
                        ),
                      ),
                    ),
                    kheight20,
         
                    Text(
                      'Name : ${student.studentname}',
                      style: TextStyle1,
                    ),
                    Text(
                      'Age : ${student.age}',
                      style: TextStyle1,
                    ),
                    Text(
                      'Father : ${student.fathername}',
                      style: TextStyle1,
                    ),
                    Text(
                      'School : ${student.schoolname}',
                      style:  TextStyle1,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
