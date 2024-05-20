import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:studentapp/add_student/add_student.dart';
import 'package:studentapp/controllers/home_controller.dart';
import 'package:studentapp/core/colors.dart';
import 'package:studentapp/student_details/student_details.dart';

class Homepage extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());
  Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(110),
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xFF80CBC4),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Text('StudentList',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                  TextFormField(
                    onChanged: (query) {
                      controller.filterStudents(query);
                    },
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      hintText: 'Search Students',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      prefixIcon: const Icon(Icons.search),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(gradient: Shade.bodyGradient),
        child: Obx(() {
          return controller.filteredStudents.isEmpty
              ? Center(
                  child: SizedBox(
                    width: 300,
                    child: Lottie.asset(
                        'assets/no data found.json'),
                  ),
                )
              : Column(
                  children: [
                    Expanded(
                        child: ListView.builder(
                      itemCount: controller.filteredStudents.length,
                      itemBuilder: (context, index) {
                        final student = controller.filteredStudents[index];
                        return GestureDetector(
                          onTap: (){
                            Get.to(StudentDetails(student: student));
                          },
                            child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Card(
                            elevation: 10,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CircleAvatar(
                                      radius: 45,
                                      backgroundImage:
                                          FileImage(File(student.imageurl)),
                                      backgroundColor: Colors.black,
                                    ),
                                  ),
                                  const Spacer(),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        student.studentname,
                                        style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                                      ),
                                      Text(student.schoolname,
                                      style: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                                    ],
                                  ),
                                  const Spacer(),
                       
                                  
                                ],
                                
                              ),
                              
                            ),
                          ),
                        ));
                      },
                    ))
                  ],
                );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        shape: const CircleBorder(),
        onPressed: () {
          Get.to(AddStudent())!
              .then((value) => controller.refreshStudentsist());
        },
        child: const Text('+',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
      ),
    );
  }
}
