import 'package:flutter/material.dart';
import 'package:studentapp/core/colors.dart';
import 'package:studentapp/core/constant.dart';
import 'package:studentapp/refactored_widgets/round_button.dart';

import '../database/database_healper.dart';

class AddStudent extends StatelessWidget {

  final _formkey=GlobalKey<FormState>();
  final _nameController=TextEditingController();
  final _ageController=TextEditingController();
  final _fathernameController=TextEditingController();
  final _schoolnameController=TextEditingController();

  DatabaseHealper databaseHelper = DatabaseHealper();

   AddStudent({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
  
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
                  SizedBox(height: MediaQuery.of(context).size.height/12,),
                  const CircleAvatar(
                    radius: 80,
                  ),
                  kheight20,
                  TextFormField(
                    controller: _nameController,
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
                  ),
                  kheight40,
                  RoundButton(title: 'Save', onPressed: (){
                    if(_formkey.currentState!.validate()){
                     
                    }


                  }, buttoncolor: const Color.fromARGB(255, 255, 255, 255), textcolor: const Color.fromARGB(255, 0, 0, 0))
                ],
              ),
            ),
          ),
        ),

      ),
    );
  }
}