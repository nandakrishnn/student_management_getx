import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentapp/home/home_page.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home:Homepage() ,
    );
  }
}