import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_app/getx/controller.dart';
import 'package:student_app/model/model.dart';
import 'package:student_app/widgets%20and%20styles/styles.dart';
import 'package:student_app/widgets%20and%20styles/widgets.dart';


class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final namecontroller = TextEditingController();
  final agecontroller = TextEditingController();
  final locationcontroller = TextEditingController();
  final picker = ImagePicker();
  File? imagefile;

  Future getimage(BuildContext context) async {
    final pickedfile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedfile != null) {
      imagefile = File(pickedfile.path);
      final imagegetx _imageController = Get.put(imagegetx());
      _imageController.setimage(imagefile);
    }
  }

  @override
  Widget build(BuildContext context) {
    final imagegetx _imageController=Get.put(imagegetx());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Student',
          style: kwhitestyle,
        ),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => getimage(context),
                  child: Obx(() {
                    return CircleAvatar(
                      radius: 60,
                      backgroundImage: _imageController.imagefile != null
                          ? FileImage(_imageController.imagefile!)
                          : null,
                      child: const Text(
                        'image',
                        style: TextStyle(fontWeight: FontWeight.w100),
                      ),
                    );
                  },
                  ),
                ),
                box,
                textField('name', namecontroller,TextInputType.name),
                box,
                textField('age', agecontroller,TextInputType.number),
                box,
                textField('class', locationcontroller,TextInputType.number),
                box,
                ElevatedButton(
                    onPressed: () {
                      onSaved(context);
                    },
                    child: const Text('Save')),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onSaved(BuildContext context) {
    if (imagefile == null ||
        namecontroller.text.isEmpty ||
        agecontroller.text.isEmpty ||
        locationcontroller.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Every fields are required'),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      ));
    } else {
      final name = namecontroller.text;
      final age = agecontroller.text;
      final location = locationcontroller.text;
      final imagegetx _imageController =Get.find();
      final image = _imageController.imagefile;

      final person =
      Student(name: name, age: age, location: location, image: image!);
      final Studentgetx studedetails=Get.find();
      studedetails.addstudent(person);

      _imageController.setimage(null);
      Navigator.of(context).pop();
    }
  }
}
