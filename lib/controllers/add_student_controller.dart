import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class AddStudentController extends GetxController{
  RxString profilepicturepath=''.obs;
  RxString name=''.obs;
  RxString schoolname=''.obs;
  RxString fathername=''.obs;
  RxInt age=0.obs;


  void updateProfilepic(String path){
    profilepicturepath.value=path;
  }
  void updatename(String value){
    name.value=value;
  }
  void updateSchoolname(String value){
    schoolname.value=value;
  }
  void updatefathersname(String value){
    fathername.value=value;
  }
  void updateAge(int value){
    age.value=value;
  }
  void clearimage(){
    profilepicturepath.value='';
  }

  @override
  void onClose(){
    clearimage();
    super.onClose();
  }

  saveStudent(){
    Get.snackbar('Success', 'Student added Successfully');
  }
}