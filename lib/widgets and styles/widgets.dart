import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_app/getx/controller.dart';
import 'package:student_app/model/model.dart';
import 'package:student_app/screens/screen_home.dart';
import 'package:student_app/widgets%20and%20styles/styles.dart';

Widget textField(
    String hint, TextEditingController control, TextInputType keyboardtype) {
  return TextFormField(
    keyboardType: keyboardtype,
    controller: control,
    decoration: InputDecoration(
      labelText: hint,
      border: const OutlineInputBorder(),
    ),
  );
}

Widget alert(BuildContext context, Student studentindex,int index) {
  final namecontroller = TextEditingController();
  final agecontroller = TextEditingController();
  final classcontroller = TextEditingController();
  namecontroller.text = studentindex.name;
  agecontroller.text = studentindex.age;
  classcontroller.text = studentindex.location;


  return SingleChildScrollView(
    child: AlertDialog(
      title: const Text('Edit'),
      content: Column(
        children: [
          GestureDetector(
            onTap: () {},
            child: CircleAvatar(
              backgroundImage: FileImage(studentindex.image),
              radius: 40,
            ),
          ),
          box,
          TextFormField(
            controller: namecontroller,
          ),
          box,
          TextFormField(
            controller: agecontroller,
          ),
          box,
          TextFormField(
            controller: classcontroller,
          ),
          box,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Close')),
              ElevatedButton(onPressed: () {
                final person=Student(name: namecontroller.text,
                    age: agecontroller.text,
                    location: classcontroller.text,
                    image:studentindex.image);
                final Studentgetx studentdetail=Get.find();
                studentdetail.updatestudent(person,index);
                Navigator.pop(context);
                Get.to(StudentList());
              },
                  child: const Text('Update'))
            ],
          )
        ],
      ),
    ),
  );
}

