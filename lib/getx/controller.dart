import 'dart:io';

import 'package:get/get.dart';
import 'package:student_app/model/model.dart';


class Studentgetx extends GetxController{
  RxList<Student> studentlist=<Student>[].obs;

  void addstudent(Student data){
    studentlist.add(data);
  }

  void updatestudent(Student data,int index){
    studentlist.removeAt(index);
    studentlist.insert(index,data);
  }

  void clearlist(){
    studentlist.clear();
  }

  void deletestudent(int index){
    studentlist.removeAt(index);
  }
}

class imagegetx extends GetxController{
  final Rx<File?> _imagefile = Rx<File?>(null);
  File? get imagefile => _imagefile.value;

  void setimage(File? file) {
    _imagefile.value = file;
  }

}
