import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentapp/add_student/add_student.dart';
import 'package:studentapp/core/colors.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(gradient: Shade.bodyGradient),
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFF80CBC4),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text('StudentList'),
                  TextFormField(
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      hintText: 'Search Students',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      prefixIcon: Icon(Icons.search),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        shape: CircleBorder(),
        onPressed: () {
          Get.to(AddStudent());
        },
        child: Text('+'),
      ),
    );
  }
}
